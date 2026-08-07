// Line-by-line Haxe/Lime port of the upstream `interaction` example (`app.ts`), written directly
// against the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`:
// the browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// The upstream DOM-canvas InputManager wiring (createInputManager/attachPointerInput/
// connectInputToInteraction) is replaced by driving `dispatchInteractionPointer*` directly from Lime's
// `onMouseDown`/`onMouseMove`/`onMouseUp` overrides; the interaction-manager signal wiring
// (connectInteractionSignal / capture / release) is otherwise translated faithfully.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.DisplayObject;
import flighthq.types.Shape;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;
import lime.ui.MouseButton;
import lime.ui.Window;

// Shape definitions: six draggable colored shapes at different positions.
typedef DraggableShape = {
  var shape:Shape;
  var name:String;
  var baseColor:Int;
  var hoverColor:Int;
  var kind:String;
  var cx:Float;
  var cy:Float;
  var w:Float;
  var h:Float;
};

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;
  var usingCairo = false;

  final CANVAS_HEIGHT = 600;

  var root:DisplayObject;
  var manager:Dynamic;

  var shapes:Array<DraggableShape>;

  // HUD state, updated by signal handlers and displayed each frame.
  var lastEventType = 'none';
  var hoveredName = 'none';
  var dragStatus = 'idle';

  // Track hovered and dragged shapes so we know which fill color to use.
  var hoveredShapes:Array<DraggableShape> = [];
  var dragTarget:Null<DraggableShape> = null;
  var dragOffsetX = 0.0;
  var dragOffsetY = 0.0;

  var hudEventLabel:Dynamic;
  var hudHoverLabel:Dynamic;
  var hudDragLabel:Dynamic;

  public function new() {
    super();
  }

  // Lime: window/GL are ready. Wire the Flight Lime backend, set up the GL renderer, build the scene.
  override public function onWindowCreate():Void {
    App.setAppBackend(LimeApp.createLimeAppBackend(this));
    trace('window context type: ' + window.context.type);
    switch (window.context.type) {
      case CAIRO:
        usingCairo = true;
      case OPENGL, OPENGLES, WEBGL:
      default:
        throw 'Flight examples require an OpenGL/WebGL or cairo render context.';
    }
    scale = window.scale;
    if (usingCairo) {
      final canvas = flighthq.scene2dCairo.Scene2dCairo.createCairoSurface(window);
      renderState = createCanvasRenderState(canvas, {
        pixelRatio: window.scale,
        backgroundColor: 0x1a1a2eff,
        sceneGraphSyncPolicy: 'requiresInvalidation',
      });
      registerRenderer(renderState, ShapeKind, defaultCanvasShapeRenderer);
      registerRenderer(renderState, TextLabelKind, defaultCanvasTextLabelRenderer);
      registerCanvasShapeCommands(renderState, defaultCanvasShapeCommands);
      registerCanvasImageTextureResolver(getCanvasRenderStateTextureResolvers(renderState));
      registerCanvasBitmapTextureResolver(getCanvasRenderStateTextureResolvers(renderState));
      enableCanvasBlendMode(renderState);
    } else {
      final canvas = flighthq.hostLime.GlSurface.createGlSurface(window);
      renderState = createGlRenderState(canvas, {
        pixelRatio: window.scale,
        backgroundColor: 0x1a1a2eff,
        contextAttributes: {alpha: false, preserveDrawingBuffer: true},
        sceneGraphSyncPolicy: 'requiresInvalidation',
      });
      registerGlStandardMaterial(renderState);
      registerStandardGlTextureResolvers(renderState);
      registerRenderer(renderState, ShapeKind, defaultGlShapeRenderer);
      registerRenderer(renderState, TextLabelKind, defaultGlTextLabelRenderer);
      // Upstream f1a7a9a0: the GPU mesh lane covers solid fills and open strokes; closed strokes,
      // gradients, and texture fills draw through an explicit canvas shape rasterizer, whose
      // resolver set is pointed at this state's diagnostics. Without it those shapes silently
      // vanish (this example's GL frame was background-only).
      final shapeRasterizerResolvers = createCanvasTextureResolvers();
      connectCanvasTextureResolverMisses(shapeRasterizerResolvers, renderState);
      registerCanvasImageTextureResolver(shapeRasterizerResolvers);
      registerCanvasBitmapTextureResolver(shapeRasterizerResolvers);
      registerCanvasShapeCommands(renderState, defaultCanvasShapeCommands);
      registerCanvasShapeCommands(renderState, defaultCanvasTextureShapeCommands);
      registerGlShapeRasterizer(renderState, createCanvasShapeRasterizer(shapeRasterizerResolvers));
      enableGlBlendModeSupport(renderState);
    }

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    // Register hit test handlers for all built-in display object kinds so the interaction manager
    // can find targets under the pointer. registerDefaultHitTests installs the coarse (bounding-box)
    // bank; registerShapeHitTest adds the exact fill-winding provider for Shape, so `precise: true`
    // resolves a hit against the actual circle/rectangle fill rather than its bounding box — a click in
    // a circle's bbox corner misses.
    registerDefaultHitTests();
    registerShapeHitTest();

    manager = createInteractionManager(root, {precise: true});

    // The upstream DOM pointer wiring (createInputManager/attachPointerInput/connectInputToInteraction)
    // is replaced by driving dispatchInteractionPointer* from the onMouse* overrides below. The pointer
    // coordinates are scaled by `scale` there, matching upstream's coordScale bridge from CSS pixels to
    // the backing-store pixel space used by hit testing.

    shapes = [
      {
        shape: createShape(),
        name: 'Red Rect',
        baseColor: 0xcc4444,
        hoverColor: 0xff6666,
        kind: 'rect',
        cx: 100,
        cy: 100,
        w: 100,
        h: 80,
      },
      {
        shape: createShape(),
        name: 'Green Circle',
        baseColor: 0x44cc44,
        hoverColor: 0x66ff66,
        kind: 'circle',
        cx: 300,
        cy: 150,
        w: 60,
        h: 60,
      },
      {
        shape: createShape(),
        name: 'Blue Rect',
        baseColor: 0x4444cc,
        hoverColor: 0x6666ff,
        kind: 'rect',
        cx: 500,
        cy: 100,
        w: 120,
        h: 90,
      },
      {
        shape: createShape(),
        name: 'Yellow Circle',
        baseColor: 0xcccc44,
        hoverColor: 0xffff66,
        kind: 'circle',
        cx: 200,
        cy: 350,
        w: 50,
        h: 50,
      },
      {
        shape: createShape(),
        name: 'Cyan Rect',
        baseColor: 0x44cccc,
        hoverColor: 0x66ffff,
        kind: 'rect',
        cx: 450,
        cy: 300,
        w: 90,
        h: 70,
      },
      {
        shape: createShape(),
        name: 'Magenta Circle',
        baseColor: 0xcc44cc,
        hoverColor: 0xff66ff,
        kind: 'circle',
        cx: 650,
        cy: 250,
        w: 55,
        h: 55,
      },
    ];

    // Initialize shapes: add to scene, draw, and wire interaction signals.
    for (ds in shapes) {
      addNodeChild(root, ds.shape);
      // Hit testing is opt-in: each interactive shape volunteers itself as a candidate.
      setNodeHitTestEnabled(ds.shape, true);
      redrawShape(ds);

      // Hover: pointerOver / pointerOut change the fill to a brighter shade.
      connectInteractionSignal(manager, ds.shape, 'onPointerOver', function(data:Dynamic):Void {
        lastEventType = 'pointerOver';
        hoveredName = ds.name;
        if (hoveredShapes.indexOf(ds) == -1) hoveredShapes.push(ds);
        redrawShape(ds);
      });

      connectInteractionSignal(manager, ds.shape, 'onPointerOut', function(data:Dynamic):Void {
        lastEventType = 'pointerOut';
        if (hoveredName == ds.name) hoveredName = 'none';
        hoveredShapes.remove(ds);
        redrawShape(ds);
      });

      // Drag: pointerDown captures the pointer, pointerMove updates position, pointerUp releases.
      connectInteractionSignal(manager, ds.shape, 'onPointerDown', function(data:Dynamic):Void {
        lastEventType = 'pointerDown';
        dragTarget = ds;
        dragOffsetX = data.localX - ds.cx;
        dragOffsetY = data.localY - ds.cy;
        dragStatus = 'dragging ' + ds.name;
        captureInteractionPointer(manager, data.pointerId, ds.shape);
      });

      connectInteractionSignal(manager, ds.shape, 'onPointerMove', function(data:Dynamic):Void {
        lastEventType = 'pointerMove';
        if (dragTarget != ds) return;

        final localX = data.worldX / scale;
        final localY = data.worldY / scale;
        ds.cx = localX - dragOffsetX;
        ds.cy = localY - dragOffsetY;

        redrawShape(ds);
      });

      connectInteractionSignal(manager, ds.shape, 'onPointerUp', function(data:Dynamic):Void {
        lastEventType = 'pointerUp';
        if (dragTarget == ds) {
          dragTarget = null;
          dragStatus = 'idle';
          releaseInteractionPointer(manager, data.pointerId);
        }
      });
    }

    // HUD labels: show last event, hovered object, and drag status.

    hudEventLabel = createTextLabel();
    hudEventLabel.data.text = 'Event: none';
    hudEventLabel.data.textFormat = {size: 14, color: 0xdddddd};
    hudEventLabel.x = 10;
    hudEventLabel.y = CANVAS_HEIGHT - 80;
    invalidateNodeLocalTransform(hudEventLabel);
    addNodeChild(root, hudEventLabel);

    hudHoverLabel = createTextLabel();
    hudHoverLabel.data.text = 'Hovered: none';
    hudHoverLabel.data.textFormat = {size: 14, color: 0xdddddd};
    hudHoverLabel.x = 10;
    hudHoverLabel.y = CANVAS_HEIGHT - 58;
    invalidateNodeLocalTransform(hudHoverLabel);
    addNodeChild(root, hudHoverLabel);

    hudDragLabel = createTextLabel();
    hudDragLabel.data.text = 'Drag: idle';
    hudDragLabel.data.textFormat = {size: 14, color: 0xdddddd};
    hudDragLabel.x = 10;
    hudDragLabel.y = CANVAS_HEIGHT - 36;
    invalidateNodeLocalTransform(hudDragLabel);
    addNodeChild(root, hudDragLabel);

    final titleLabel = createTextLabel();
    titleLabel.data.text = 'Drag the shapes around. Hover to highlight.';
    titleLabel.data.textFormat = {size: 16, color: 0x999999};
    titleLabel.x = 10;
    titleLabel.y = 10;
    invalidateNodeLocalTransform(titleLabel);
    addNodeChild(root, titleLabel);

    ready = true;
  }

  function redrawShape(ds:DraggableShape):Void {
    final isHovered = hoveredShapes.indexOf(ds) != -1;
    final color = isHovered ? ds.hoverColor : ds.baseColor;

    clearShapeCommands(ds.shape);
    appendShapeBeginFill(ds.shape, color, 0.85);

    if (ds.kind == 'rect') {
      appendShapeRectangle(ds.shape, ds.cx - ds.w / 2, ds.cy - ds.h / 2, ds.w, ds.h);
    } else {
      appendShapeCircle(ds.shape, ds.cx, ds.cy, ds.w);
    }

    appendShapeEndFill(ds.shape);
    invalidateNodeLocalTransform(ds.shape);
  }

  function updateHud():Void {
    final eventText = 'Event: ' + lastEventType;
    if (hudEventLabel.data.text != eventText) {
      hudEventLabel.data.text = eventText;
      invalidateNodeAppearance(hudEventLabel);
    }

    final hoverText = 'Hovered: ' + hoveredName;
    if (hudHoverLabel.data.text != hoverText) {
      hudHoverLabel.data.text = hoverText;
      invalidateNodeAppearance(hudHoverLabel);
    }

    final dragText = 'Drag: ' + dragStatus;
    if (hudDragLabel.data.text != dragText) {
      hudDragLabel.data.text = dragText;
      invalidateNodeAppearance(hudDragLabel);
    }
  }

  // Upstream DOM pointer events, delivered here through Lime's mouse overrides and forwarded to the
  // interaction manager. Coordinates are scaled to backing-store space, matching the upstream coordScale.
  override public function onMouseDown(x:Float, y:Float, button:MouseButton):Void {
    if (!ready) return;
    dispatchInteractionPointerDown(manager, x * scale, y * scale);
  }

  override public function onMouseMove(x:Float, y:Float):Void {
    if (!ready) return;
    dispatchInteractionPointerMove(manager, x * scale, y * scale);
  }

  override public function onMouseUp(x:Float, y:Float, button:MouseButton):Void {
    if (!ready) return;
    dispatchInteractionPointerUp(manager, x * scale, y * scale);
  }

  // Upstream `enterFrame`, driven by Lime's per-frame `update`.
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    updateHud();
  }

  // Upstream `render(root)`, driven by Lime's per-frame `render`.
  override public function render(context:RenderContext):Void {
    if (!ready || root == null) return;
    // Nothing changed since the last frame: skip the draw AND cancel this frame's present, so
    // Lime does not flip to the never-drawn back buffer (a black flash every second frame on
    // page-flip hardware). OpenFL's Stage pauses rendering the same way; the skipped frame costs
    // nothing, which matters on the interpreter targets.
    if (!prepareScene2DRender(renderState, root)) {
      window.onRender.cancel();
      return;
    }
    if (usingCairo) {
      renderCanvasBackground(renderState);
      renderCanvasScene2D(renderState, root);
    } else {
      renderGlBackground(renderState);
      renderGlScene2D(renderState, root);
    }
  }

  // Portable stand-in for JavaScript's `Number.prototype.toFixed`.
  static function toFixed(value:Float, digits:Int):String {
    final factor = Math.pow(10, digits);
    final rounded = Math.round(value * factor) / factor;
    var s = Std.string(rounded);
    final dot = s.indexOf('.');
    if (digits == 0) return dot == -1 ? s : s.substr(0, dot);
    if (dot == -1) s += '.';
    var decimals = s.length - s.indexOf('.') - 1;
    while (decimals < digits) {
      s += '0';
      decimals++;
    }
    return s;
  }
}
