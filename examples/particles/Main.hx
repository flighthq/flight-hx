// Line-by-line Haxe/Lime port of the upstream `particles` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// Every statement of the upstream program is otherwise translated faithfully. The procedural
// Canvas-2D texture painting is replaced by a minimal stub that keeps the SDK call sites intact.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.ParticleCurve.ColorKeyframe;
import flighthq.types.DisplayObject;
import flighthq.types.ParticleEmitter2D;
import flighthq.types.ParticleForce;
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

  final WIDTH = 800;
  final HEIGHT = 500;

  // Root container holds both emitters and the HUD label.
  var root:DisplayObject;

  var fireEmitter:ParticleEmitter2D;
  var fireConfig:Dynamic;
  var fireForces:Array<ParticleForce>;
  var fireSimState:Dynamic;

  var snowEmitter:ParticleEmitter2D;
  var snowConfig:Dynamic;
  var snowForces:Array<ParticleForce>;
  var snowSimState:Dynamic;

  var countLabel:DisplayObject;

  // Mouse tracking for the fire emitter.
  var mouseX:Float;
  var mouseY:Float;
  var fireVelX:Float = 0;
  var fireVelY:Float = 0;

  final SPRING = 300;
  final DAMPING = 22;

  public function new() {
    super();
  }

  // Lime: window/GL are ready. Wire the Flight Lime backend, set up the GL renderer, build the scene.
  override public function onWindowCreate():Void {
    App.setAppBackend(LimeApp.createLimeAppBackend(this));
    switch (window.context.type) {
      case OPENGL, OPENGLES, WEBGL:
      default:
        throw 'Flight examples require an OpenGL/WebGL render context.';
    }
    scale = window.scale;
    final canvas = new _GlCanvas(window);
    renderState = createGlRenderState(canvas, {
      pixelRatio: window.scale,
      backgroundColor: 0x0a0a14ff,
      contextAttributes: {alpha: false, preserveDrawingBuffer: true},
      sceneGraphSyncPolicy: 'requiresInvalidation',
    });
    registerDefaultGlMaterial(renderState);
    registerRenderer(renderState, ParticleEmitter2DKind, defaultGlParticleEmitter2DRenderer);
    registerRenderer(renderState, TextLabelKind, defaultGlTextLabelRenderer);
    enableGlBlendModeSupport(renderState);

    mouseX = (WIDTH * scale) / 4;
    mouseY = (HEIGHT * scale) / 2;

    // Root container holds both emitters and the HUD label.
    root = createDisplayObject();

    // Procedural spark texture: soft radial glow, warm white core fading to orange then transparent.
    final sparkCanvas = _makeCanvas(16, 16);
    final sparkCtx = sparkCanvas.getContext('2d');
    final sparkGrad = sparkCtx.createRadialGradient(8, 8, 0, 8, 8, 8);
    sparkGrad.addColorStop(0, 'rgba(255, 248, 170, 1)');
    sparkGrad.addColorStop(0.25, 'rgba(255, 150, 20, 1)');
    sparkGrad.addColorStop(0.6, 'rgba(255, 55, 0, 0.7)');
    sparkGrad.addColorStop(1, 'rgba(150, 0, 0, 0)');
    sparkCtx.fillStyle = sparkGrad;
    sparkCtx.fillRect(0, 0, 16, 16);

    final fireAtlas = createTextureAtlas({image: createImageResource(sparkCanvas)});
    addTextureAtlasRegion(fireAtlas, 0, 0, 16, 16);

    // Procedural snowflake texture: soft white radial glow.
    final snowCanvas = _makeCanvas(12, 12);
    final snowCtx = snowCanvas.getContext('2d');
    final snowGrad = snowCtx.createRadialGradient(6, 6, 0, 6, 6, 6);
    snowGrad.addColorStop(0, 'rgba(255, 255, 255, 1)');
    snowGrad.addColorStop(0.4, 'rgba(220, 235, 255, 0.8)');
    snowGrad.addColorStop(0.7, 'rgba(180, 210, 255, 0.3)');
    snowGrad.addColorStop(1, 'rgba(140, 180, 255, 0)');
    snowCtx.fillStyle = snowGrad;
    snowCtx.fillRect(0, 0, 12, 12);

    final snowAtlas = createTextureAtlas({image: createImageResource(snowCanvas)});
    addTextureAtlasRegion(snowAtlas, 0, 0, 12, 12);

    // Fire emitter: additive glow, follows mouse, world-space trail.
    fireEmitter = createParticleEmitter2D();
    fireEmitter.data.atlas = fireAtlas;
    // BlendMode.Add -- `BlendMode` is a string typedef in the port, so its member is the literal.
    fireEmitter.blendMode = 'Add';
    fireEmitter.scaleX = 1;
    fireEmitter.scaleY = 1;
    fireEmitter.x = (WIDTH * scale) / 4;
    fireEmitter.y = (HEIGHT * scale) / 2;
    addNodeChild(root, fireEmitter);

    final fireScaleCurve = buildParticleCurve(function(t:Float):Float {
      final pop = t < 0.15 ? 0.7 + 0.3 * (t / 0.15) : 1;
      return pop * (1 - t);
    });
    final fireAlphaCurve = buildParticleCurve(function(t:Float):Float return 1 - t * t);
    final fireColorCurve = particleColorCurveFromKeyframes(([
      {time: 0, r: 1, g: 1, b: 0.85},
      {time: 0.35, r: 1, g: 0.5, b: 0.1},
      {time: 1, r: 0.55, g: 0.05, b: 0},
    ] : Array<ColorKeyframe>));

    fireConfig = createParticleEmitterConfig({
      worldSpace: true,
      velocityInheritance: 0.35,
      spawnRate: 300,
      lifetimeMin: 0.2,
      lifetimeMax: 0.55,
      speedMin: 40 * scale,
      speedMax: 130 * scale,
      spread: Math.PI * 2,
      directionX: 0,
      directionY: -1,
      gravityX: 0,
      gravityY: 200 * scale,
      alphaCurve: fireAlphaCurve,
      scaleCurve: fireScaleCurve,
      colorCurve: fireColorCurve,
      scaleMin: 0.4 * scale,
      scaleMax: 1.4 * scale,
      maxParticles: 3000,
    });

    // Forces for fire: drag decelerates sparks, turbulence adds shimmer.
    fireForces = ([
      {kind: 'DragForce', strength: 0.9},
      {kind: 'TurbulenceForce', strength: 90 * scale, scale: 0.01},
    ] : Array<ParticleForce>);

    fireSimState = createParticleEmitterState();

    // Snow emitter: normal blend, fixed position at top-right, gentle downward drift.
    snowEmitter = createParticleEmitter2D();
    snowEmitter.data.atlas = snowAtlas;
    snowEmitter.scaleX = 1;
    snowEmitter.scaleY = 1;
    // Snow spawns across the right half of the canvas.
    snowEmitter.x = (WIDTH * scale * 3) / 4;
    snowEmitter.y = 0;
    addNodeChild(root, snowEmitter);

    final snowScaleCurve = buildParticleCurve(function(t:Float):Float {
      // Fade in over first 10%, hold, then shrink away in last 20%.
      if (t < 0.1) return t / 0.1;
      if (t > 0.8) return (1 - t) / 0.2;
      return 1;
    });
    final snowAlphaCurve = buildParticleCurve(function(t:Float):Float {
      // Fade in then gentle fade out.
      if (t < 0.1) return t / 0.1;
      return 1 - t * 0.6;
    });
    final snowColorCurve = particleColorCurveFromKeyframes(([
      {time: 0, r: 1, g: 1, b: 1},
      {time: 0.5, r: 0.85, g: 0.92, b: 1},
      {time: 1, r: 0.7, g: 0.82, b: 1},
    ] : Array<ColorKeyframe>));

    snowConfig = createParticleEmitterConfig({
      worldSpace: true,
      velocityInheritance: 0,
      spawnRate: 80,
      lifetimeMin: 2,
      lifetimeMax: 4,
      speedMin: 15 * scale,
      speedMax: 40 * scale,
      // Spread slightly downward with some horizontal variation.
      spread: Math.PI * 0.6,
      directionX: 0,
      directionY: 1,
      gravityX: 0,
      gravityY: 20 * scale,
      alphaCurve: snowAlphaCurve,
      scaleCurve: snowScaleCurve,
      colorCurve: snowColorCurve,
      scaleMin: 0.3 * scale,
      scaleMax: 0.9 * scale,
      maxParticles: 500,
      // Snow spawns across a wide horizontal band.
      emitterShape: 'rect',
      emitterWidth: (WIDTH * scale) / 2,
      emitterHeight: 2,
    });

    // Forces for snow: light drag, gentle turbulence for drifting, and a mild horizontal wind.
    snowForces = ([
      {kind: 'DragForce', strength: 0.3},
      {kind: 'TurbulenceForce', strength: 30 * scale, scale: 0.005},
      {kind: 'WindForce', x: 15 * scale, y: 0},
    ] : Array<ParticleForce>);

    snowSimState = createParticleEmitterState();

    // Particle count HUD label.
    countLabel = createTextLabel();
    countLabel.data.text = '0 particles';
    countLabel.data.textFormat = {size: 12, color: 0x999999};
    countLabel.x = 8 * scale;
    countLabel.y = (HEIGHT - 20) * scale;
    invalidateNodeLocalTransform(countLabel);
    addNodeChild(root, countLabel);

    invalidateNodeLocalTransform(fireEmitter);
    invalidateNodeLocalTransform(snowEmitter);

    ready = true;
  }

  // Mouse tracking for the fire emitter. In the browser this is a `pointermove` listener; here it is
  // Lime's `onMouseMove`. Window coordinates are scaled into the emitter's device-pixel space.
  override public function onMouseMove(x:Float, y:Float):Void {
    if (!ready) return;
    mouseX = x * scale;
    mouseY = y * scale;
  }

  // Upstream `enterFrame`, driven by Lime's per-frame `update` (deltaTime is milliseconds).
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    final dt = Math.min(deltaTime / 1000.0, 0.05);

    // Spring-follow the mouse for the fire emitter.
    fireVelX += ((mouseX - fireEmitter.x) * SPRING - fireVelX * DAMPING) * dt;
    fireVelY += ((mouseY - fireEmitter.y) * SPRING - fireVelY * DAMPING) * dt;
    fireEmitter.x += fireVelX * dt;
    fireEmitter.y += fireVelY * dt;
    invalidateNodeLocalTransform(fireEmitter);

    // World-space emitter: it bakes spawns through its own node world transform (set above), so nothing to pass.
    applyParticleForces(fireEmitter, fireSimState, fireForces, dt);
    updateParticleEmitter2D(fireEmitter, fireSimState, fireConfig, dt);
    invalidateNodeAppearance(fireEmitter);

    // Snow emitter stays fixed at its node position.
    applyParticleForces(snowEmitter, snowSimState, snowForces, dt);
    updateParticleEmitter2D(snowEmitter, snowSimState, snowConfig, dt);
    invalidateNodeAppearance(snowEmitter);

    // Update the particle count label.
    final total = fireEmitter.data.particleCount + snowEmitter.data.particleCount;
    countLabel.data.text = '${total} particles';
    invalidateNodeAppearance(countLabel);
  }

  // Upstream `render(root)`, driven by Lime's per-frame `render`.
  override public function render(context:RenderContext):Void {
    if (!ready || root == null) return;
    if (!prepareDisplayObjectRender(renderState, root)) return;
    renderGlBackground(renderState);
    renderGlDisplayObject(renderState, root);
  }

  // Minimal stand-in for `document.createElement('canvas')` -- keeps the procedural texture-painting
  // call sites intact without a real Canvas-2D backend.
  static function _makeCanvas(w:Int, h:Int):_CanvasStub {
    return new _CanvasStub(w, h);
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

// Minimal GL canvas adapter over the Lime window, matching the shape `createGlRenderState` expects.
private class _GlCanvas {
  public var width(get, never):Int;
  public var height(get, never):Int;

  final window:Window;
  final context:Dynamic;

  public function new(window:Window) {
    this.window = window;
    context = resolveContext(window);
    if (context == null) throw 'Flight examples require a hardware OpenGL/WebGL window.';
  }

  public function getContext(contextId:String, ?attributes:Dynamic):Dynamic {
    return context;
  }

  function get_width():Int {
    return Std.int(window.width * window.scale);
  }

  function get_height():Int {
    return Std.int(window.height * window.scale);
  }

  static function resolveContext(window:Window):Dynamic {
    final renderContext:Dynamic = window.context;
    if (renderContext == null) return null;
    final webgl2 = renderContext.webgl2;
    return webgl2 == null ? renderContext.webgl : webgl2;
  }
}

// Stub for a 2D drawing canvas used only as an ImageResource source in this headless Lime port.
private class _CanvasStub {
  public var width:Int;
  public var height:Int;

  public function new(w:Int, h:Int) {
    width = w;
    height = h;
  }

  public function getContext(contextId:String):_Context2DStub {
    return new _Context2DStub();
  }
}

private class _Context2DStub {
  public var fillStyle:Dynamic;

  public function new() {}

  public function createRadialGradient(x0:Float, y0:Float, r0:Float, x1:Float, y1:Float, r1:Float):_GradientStub {
    return new _GradientStub();
  }

  public function fillRect(x:Float, y:Float, w:Float, h:Float):Void {}
}

private class _GradientStub {
  public function new() {}

  public function addColorStop(offset:Float, color:String):Void {}
}
