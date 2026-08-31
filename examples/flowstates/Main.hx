// Line-by-line Haxe/Lime port of the upstream `flowstates` example (`app.ts`), written directly
// against the generated Flight Haxe surface (`flight.*`). It is a standalone `lime.app.Application`:
// the browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and Flight's Lime host capabilities are enabled with `HostLime.enableHostLime(this)`.
// The `keydown` listener becomes Lime's `onKeyDown`; the flow stack still drives what is on screen.
import flight.hostLime.HostLime;
import flight.Sdk.*;
import flight.types.DisplayObject;
import flight.types.TextLabel;
import flight.types.FlowState;
import flight.types.FlowStack;
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

  final WIDTH = 600;
  final HEIGHT = 400;

  var root:DisplayObject;

  var stack:FlowStack;
  final visibleStates:Array<FlowState> = [];

  var score = 0;
  var bootTimer = 0.0;

  // Absolute-millisecond accumulator standing in for the browser's `performance.now()`.
  var nowMs:Float = 0;

  // Each flow state owns a container of display objects. The container is created in onEnter and
  // discarded in onExit. The render loop reads getFlowStackVisibleStates each frame and adds only the
  // visible containers to the root -- the flow stack drives what is drawn.
  final stateContainers = new Map<FlowState, DisplayObject>();

  // State definitions. Each builds its visual layer in onEnter and drops it in onExit.
  var playScoreLabel:TextLabel;
  var playTimerLabel:TextLabel;

  var bootState:FlowState;
  var menuState:FlowState;
  var playState:FlowState;
  var pauseState:FlowState;
  var gameOverState:FlowState;

  // HUD: a separate display container drawn on top every frame, not a flow state.
  var hud:DisplayObject;
  var hudDepthLabel:TextLabel;
  var hudActiveLabel:TextLabel;
  var hudStackLabel:TextLabel;

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
    final surfaceCreator = flight.Scene2DCairo.createCairoRenderSurfaceCreator();
    if (usingCairo) {
      final canvas = flight.Scene2DCairo.createCairoSurface(window);
      renderState = createCanvasRenderState(createCanvasRenderSurface(surfaceCreator, canvas, {pixelRatio: window.scale}), createCanvasPipeline(createEmptyCanvasRegistries()), createCanvasTextureResolvers(surfaceCreator), {
        pixelRatio: window.scale,
        backgroundColor: 0x000000ff,
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
      renderState = createGlRenderState(createGlContextState(createGlContextFromCanvasElement(canvas, {contextAttributes: {alpha: false, preserveDrawingBuffer: true}})), createGlPipeline(createEmptyGlRegistries()), {
        pixelRatio: window.scale,
        backgroundColor: 0x000000ff,
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
      final shapeRasterizerResolvers = createCanvasTextureResolvers(surfaceCreator);
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

    stack = createFlowStack();

    bootState = {
      name: 'Boot',
      onEnter: function() {
        bootTimer = 0;
        final container = createStateContainer(bootState);
        addNodeChild(container, createBackground(0x111111, 1));
        addNodeChild(container, createLabel('FLIGHT SDK', 200, 140, 32, 0xffffff));
        addNodeChild(container, createLabel('Loading...', 240, 190, 18, 0x888888));
      },
      onExit: function() {
        stateContainers.remove(bootState);
      },
      onUpdate: function(deltaTime:Float) {
        bootTimer += deltaTime;
        // After 1.5 seconds, replace Boot with Menu (Boot exits, Menu enters, stack depth stays 1).
        if (bootTimer >= 1500) {
          replaceFlowState(stack, menuState);
        }
      },
    };

    menuState = {
      name: 'Menu',
      onEnter: function() {
        final container = createStateContainer(menuState);
        addNodeChild(container, createBackground(0x1a3a5c, 1));
        addNodeChild(container, createLabel('FLOW STATES', 170, 80, 36, 0xffffff));
        addNodeChild(container, createLabel('A @flighthq/flow demo', 190, 130, 16, 0xaaaaaa));
        addNodeChild(container, createLabel('Press ENTER to play', 195, 220, 20, 0x44cc88));
        addNodeChild(container, createLabel('Press Q to clear stack', 195, 260, 16, 0x888888));
      },
      onExit: function() {
        stateContainers.remove(menuState);
      },
      onPause: function() {},
      onResume: function() {},
    };

    playState = {
      name: 'Play',
      onEnter: function() {
        score = 0;
        final container = createStateContainer(playState);
        addNodeChild(container, createBackground(0x2d5016, 1));
        addNodeChild(container, createLabel('PLAYING', 230, 30, 28, 0xffffff));
        playScoreLabel = createLabel('Score: 0', 30, 100, 22, 0xeedd44);
        addNodeChild(container, playScoreLabel);
        playTimerLabel = createLabel('', 30, 140, 16, 0xcccccc);
        addNodeChild(container, playTimerLabel);
        addNodeChild(container, createLabel('SPACE - score points', 30, 220, 16, 0x88bb88));
        addNodeChild(container, createLabel('ESCAPE - pause', 30, 250, 16, 0x88bb88));
        addNodeChild(container, createLabel('G - game over', 30, 280, 16, 0x88bb88));
      },
      onExit: function() {
        stateContainers.remove(playState);
      },
      onPause: function() {},
      onResume: function() {},
      onUpdate: function(?_deltaTime:Float) {
        final elapsed = Std.int(nowMs / 1000);
        updateLabel(playTimerLabel, 'Time: ' + elapsed + 's');
      },
    };

    // Pause is a transparent overlay: renderBelow = true so the play screen is visible underneath,
    // updateBelow is omitted (false) so the play state stops ticking while paused.
    pauseState = {
      name: 'Pause',
      renderBelow: true,
      onEnter: function() {
        final container = createStateContainer(pauseState);
        addNodeChild(container, createBackground(0x000000, 0.6));
        addNodeChild(container, createLabel('PAUSED', 225, 150, 40, 0xffffff));
        addNodeChild(container, createLabel('Press ESCAPE to resume', 185, 210, 18, 0xcccccc));
      },
      onExit: function() {
        stateContainers.remove(pauseState);
      },
    };

    gameOverState = {
      name: 'GameOver',
      onEnter: function() {
        final container = createStateContainer(gameOverState);
        addNodeChild(container, createBackground(0x5c1a1a, 1));
        addNodeChild(container, createLabel('GAME OVER', 185, 100, 36, 0xff4444));
        addNodeChild(container, createLabel('Final Score: ' + score, 200, 160, 24, 0xffffff));
        addNodeChild(container, createLabel('Press R to restart', 205, 240, 18, 0xcccccc));
        addNodeChild(container, createLabel('Press M for menu', 215, 275, 18, 0x888888));
      },
      onExit: function() {
        stateContainers.remove(gameOverState);
      },
    };

    // HUD: a separate display container drawn on top every frame, not a flow state. It reads the stack
    // each frame and shows depth, active state, and full stack contents as diagnostic text.
    hud = createDisplayObject();
    hudDepthLabel = createLabel('', 400, 10, 14, 0xffff88);
    hudActiveLabel = createLabel('', 400, 30, 14, 0xffff88);
    hudStackLabel = createLabel('', 400, 50, 14, 0xffff88);
    addNodeChild(hud, hudDepthLabel);
    addNodeChild(hud, hudActiveLabel);
    addNodeChild(hud, hudStackLabel);

    // Bootstrap: push Boot as the first state.
    pushFlowState(stack, bootState);

    ready = true;
  }

  function createBackground(color:Int, alpha:Float):DisplayObject {
    final bg = createShape();
    appendShapeBeginFill(bg, color, alpha);
    appendShapeRectangle(bg, 0, 0, WIDTH, HEIGHT);
    return bg;
  }

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

  function createStateContainer(flowState:FlowState):DisplayObject {
    final container = createDisplayObject();
    stateContainers.set(flowState, container);
    return container;
  }

  function getStateContainer(flowState:FlowState):DisplayObject {
    final container = stateContainers.get(flowState);
    return container != null ? container : null;
  }

  function updateHud():Void {
    final depth = getFlowStackDepth(stack);
    final active = getActiveFlowState(stack);
    updateLabel(hudDepthLabel, 'Depth: ' + depth);
    updateLabel(hudActiveLabel, 'Active: ' + (active != null ? active.name : 'none'));
    final names = stack.states.map(s -> s.name != null ? s.name : '?').join(' > ');
    updateLabel(hudStackLabel, 'Stack: ' + names);
  }

  // Keyboard controls. In the browser this is a `keydown` listener; here it is Lime's `onKeyDown`.
  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {
    if (!ready) return;
    final active = getActiveFlowState(stack);
    final activeName = active != null ? active.name : null;

    if (keyCode == RETURN && activeName == 'Menu') {
      // Push: Menu is paused, Play enters. Stack: Menu > Play.
      pushFlowState(stack, playState);
      return;
    }

    if (keyCode == SPACE && activeName == 'Play') {
      score += 10;
      updateLabel(playScoreLabel, 'Score: ' + score);
      return;
    }

    if (keyCode == ESCAPE && activeName == 'Play') {
      // Push: Play is paused, Pause enters. Stack: Menu > Play > Pause.
      pushFlowState(stack, pauseState);
      return;
    }

    if (keyCode == ESCAPE && activeName == 'Pause') {
      // Pop: Pause exits, Play resumes. Stack: Menu > Play.
      popFlowState(stack);
      return;
    }

    if (keyCode == G && activeName == 'Play') {
      // Replace: Play exits, GameOver enters. Stack depth stays the same: Menu > GameOver.
      replaceFlowState(stack, gameOverState);
      return;
    }

    if (keyCode == R && activeName == 'GameOver') {
      // Replace: GameOver exits, Play enters fresh. Stack: Menu > Play.
      replaceFlowState(stack, playState);
      return;
    }

    if (keyCode == M && activeName == 'GameOver') {
      // Clear + push: exits all states top-to-bottom, then pushes Menu fresh. Stack: Menu.
      clearFlowStack(stack);
      pushFlowState(stack, menuState);
      return;
    }

    if (keyCode == Q && activeName == 'Menu') {
      // Clear + push: demonstrates clearFlowStack tearing down and rebuilding. Stack: Menu.
      clearFlowStack(stack);
      pushFlowState(stack, menuState);
      return;
    }
  }

  // Upstream `enterFrame`, driven by Lime's per-frame `update` (deltaTime is milliseconds).
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    nowMs += deltaTime;

    updateFlowStack(stack, deltaTime);
    updateHud();

    // Rebuild root's children each frame from the visible-state list. Only states reachable through
    // the renderBelow chain are drawn; the flow stack decides what is on screen.
    getFlowStackVisibleStates(stack, visibleStates);
    removeNodeChildren(root);

    for (i in 0...visibleStates.length) {
      final container = getStateContainer(visibleStates[i]);
      if (container != null) {
        addNodeChild(root, container);
      }
    }

    // HUD is always on top, outside the flow stack.
    addNodeChild(root, hud);
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
