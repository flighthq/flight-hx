// Line-by-line Haxe/Lime port of the upstream `motionpath` example (`app.ts`), written directly
// against the generated Flight Haxe surface (`flight.*`). It is a standalone `lime.app.Application`:
// the browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and Flight's Lime host capabilities are enabled with `HostLime.enableHostLime(this)`.
// Every statement of the upstream program is otherwise translated faithfully.
import flight.hostLime.HostLime;
import flight.Sdk.*;
import flight.types.DisplayObject;
import flight.types.TextLabel;
import flight.types.MotionPath;
import flight.types.MotionPathLoopMode;
import flight.types.Path;
import flight.types.Shape;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;
import lime.ui.Window;

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;
  var usingCairo = false;

  var root:DisplayObject;

  var path:Path;

  // Create the motion path driver with an initial speed.
  var speed:Float = 150;
  var loopMode:MotionPathLoopMode = 'loop';
  var mp:MotionPath;

  var track:Shape;

  // Arrow shape that follows the path. Drawn as a triangle pointing right (along +X), then rotated
  // by the heading so the tip faces the direction of travel.
  final ARROW_LENGTH = 20;
  final ARROW_HALF_WIDTH = 8;
  var arrow:Shape;

  var speedLabel:TextLabel;
  var modeLabel:TextLabel;
  var progressLabel:TextLabel;

  // Scratch vectors for position and tangent sampling (no per-frame allocation).
  final pointOut:Dynamic = {x: 0.0, y: 0.0};
  final tangentOut:Dynamic = {x: 0.0, y: 0.0};

  public function new() {
    super();
  }

  // Lime: window/GL are ready. Wire the Flight Lime backend, set up the GL renderer, build the scene.
  override public function onWindowCreate():Void {
    HostLime.enableHostLime(this);
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
      final canvas = flight.Scene2DCairo.createCairoSurface(window);
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
      final canvas = flight.hostLime.GlSurface.createGlSurface(window);
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

    // Build a bezier path with two cubic segments forming an S-curve across the canvas.
    path = createPath();
    appendPathMoveTo(path, 100, 400);
    appendPathCubicCurveTo(path, 250, 100, 350, 100, 400, 250);
    appendPathCubicCurveTo(path, 450, 400, 550, 400, 700, 100);

    mp = createMotionPath(path, speed, loopMode);

    // Draw the visible track on screen as a shape with a line style.
    track = createShape();
    appendShapeLineStyle(track, 2, 0x4488aa);
    appendShapeMoveTo(track, 100, 400);
    appendShapeCubicCurveTo(track, 250, 100, 350, 100, 400, 250);
    appendShapeCubicCurveTo(track, 450, 400, 550, 400, 700, 100);
    addNodeChild(root, track);

    // Draw small circles at the control points for visual reference.
    final controlPoints = [
      [100, 400],
      [250, 100],
      [350, 100],
      [400, 250],
      [450, 400],
      [550, 400],
      [700, 100],
    ];

    for (cp in controlPoints) {
      final cx = cp[0];
      final cy = cp[1];
      final dot = createShape();
      appendShapeBeginFill(dot, 0x335566);
      // Draw a small diamond as a control-point marker.
      final r = 4;
      appendShapeMoveTo(dot, cx, cy - r);
      appendShapeLineTo(dot, cx + r, cy);
      appendShapeLineTo(dot, cx, cy + r);
      appendShapeLineTo(dot, cx - r, cy);
      appendShapeLineTo(dot, cx, cy - r);
      appendShapeEndFill(dot);
      addNodeChild(root, dot);
    }

    arrow = createShape();

    drawArrow(100, 400, 0);
    addNodeChild(root, arrow);

    final titleLabel = createLabel('Motion Path', 20, 10, 24, 0xffffff);
    addNodeChild(root, titleLabel);

    speedLabel = createLabel('Speed: ' + speed, 20, 445, 16, 0xcccccc);
    addNodeChild(root, speedLabel);

    modeLabel = createLabel('Mode: ' + loopMode + ' (1/2/3)', 20, 465, 16, 0xcccccc);
    addNodeChild(root, modeLabel);

    progressLabel = createLabel('Progress: 0%', 250, 445, 16, 0xcccccc);
    addNodeChild(root, progressLabel);

    final controlsLabel = createLabel('+/- speed    1 clamp  2 loop  3 pingpong', 250, 465, 14, 0x888888);
    addNodeChild(root, controlsLabel);

    ready = true;
  }

  function drawArrow(x:Float, y:Float, headingDegrees:Float):Void {
    clearShapeCommands(arrow);
    arrow.x = x;
    arrow.y = y;
    arrow.rotation = headingDegrees;
    invalidateNodeLocalTransform(arrow);

    // Triangle centered at origin, pointing right (+X).
    appendShapeBeginFill(arrow, 0xff6644);
    appendShapeMoveTo(arrow, ARROW_LENGTH, 0);
    appendShapeLineTo(arrow, -ARROW_LENGTH / 2, -ARROW_HALF_WIDTH);
    appendShapeLineTo(arrow, -ARROW_LENGTH / 2, ARROW_HALF_WIDTH);
    appendShapeLineTo(arrow, ARROW_LENGTH, 0);
    appendShapeEndFill(arrow);
  }

  // HUD labels for speed, loop mode, and progress.
  function createLabel(text:String, x:Float, y:Float, size:Float, color:Int):TextLabel {
    final label = createTextLabel();
    label.data.text = text;
    label.data.textFormat = {size: size, color: color};
    label.x = x;
    label.y = y;
    invalidateNodeLocalTransform(label);
    return label;
  }

  function updateLabel(label:TextLabel, text:String):Void {
    label.data.text = text;
    invalidateNodeAppearance(label);
  }

  // Keyboard controls. In the browser this is a `keydown` listener; here it is Lime's `onKeyDown`.
  // `+`/`=` share the EQUALS key and `-`/`_` share MINUS, so each maps to a single Lime key code.
  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {
    if (!ready) return;
    switch (keyCode) {
      case EQUALS:
        speed = Math.min(speed + 25, 500);
        mp.speed = speed;
        updateLabel(speedLabel, 'Speed: ' + speed);
      case MINUS:
        speed = Math.max(speed - 25, 25);
        mp.speed = speed;
        updateLabel(speedLabel, 'Speed: ' + speed);
      case NUMBER_1:
        loopMode = 'clamp';
        mp.loopMode = loopMode;
        updateLabel(modeLabel, 'Mode: ' + loopMode + ' (1/2/3)');
      case NUMBER_2:
        loopMode = 'loop';
        mp.loopMode = loopMode;
        updateLabel(modeLabel, 'Mode: ' + loopMode + ' (1/2/3)');
      case NUMBER_3:
        loopMode = 'pingpong';
        mp.loopMode = loopMode;
        updateLabel(modeLabel, 'Mode: ' + loopMode + ' (1/2/3)');
      default:
    }
  }

  // Upstream `enterFrame`, driven by Lime's per-frame `update` (deltaTime is milliseconds).
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    final rawDelta = deltaTime / 1000.0;

    // Advance the motion path by the elapsed time.
    updateMotionPath(mp, rawDelta);

    // Sample the current position and tangent.
    if (getMotionPathPosition(mp, pointOut, tangentOut)) {
      final heading = getMotionPathHeading(mp);
      drawArrow(pointOut.x, pointOut.y, heading * RAD_TO_DEG);
    }

    // Update progress readout.
    final progress = getMotionPathProgress(mp);
    updateLabel(progressLabel, 'Progress: ' + Std.int(progress * 100) + '%');
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
