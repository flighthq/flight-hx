// Line-by-line Haxe/Lime port of the upstream `particleeditor` example (`app.ts`), written directly
// against the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`:
// the browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// Every statement of the upstream program is otherwise translated faithfully. The procedural glow
// particle texture and the HTML `<div id="controls">` slider/color/blend panel are pure browser glue
// with no SDK call sites, so they collapse to a size-reporting stub and the retained portable config
// state; the emitter still follows the Lime pointer and rebuilds its config through the SDK.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.DisplayObject;
import flighthq.types.ParticleEmitter2D;
import flighthq.types.ParticleEmitterConfig;
import flighthq.types.ParticleForce;
import flighthq.types.TextureAtlas;
import flighthq.types._internal._BlendModeValues;
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

  // `BlendMode` is a TS string enum; its value namespace maps to the generated `BlendModeValue`
  // record, so `BlendMode.Add` / `BlendMode.Normal` read exactly as upstream.
  final BlendMode:Dynamic = _BlendModeValues.BlendModeValue;

  final WIDTH = 800;
  final HEIGHT = 600;

  var root:DisplayObject;

  var atlas:TextureAtlas;
  var emitter:ParticleEmitter2D;
  var countLabel:DisplayObject;

  // Editable config values — these drive `createParticleEmitterConfig` each time a slider changes.
  final editable:Dynamic = {
    spawnRate: 120,
    lifetimeMin: 0.3,
    lifetimeMax: 0.8,
    speedMin: 40,
    speedMax: 120,
    scaleMin: 0.4,
    scaleMax: 1.2,
    alphaStart: 1,
    alphaEnd: 0,
    spread: 360,
    directionX: 0,
    directionY: -1,
    gravityX: 0,
    gravityY: 100,
    rotationSpeedMin: 0,
    rotationSpeedMax: 0,
    maxParticles: 2000,
    dragStrength: 0.5,
    turbulenceStrength: 40,
  };

  // Color state (stored separately since they are RGB components).
  var colorStartR:Float = 1;
  var colorStartG:Float = 0.85;
  var colorStartB:Float = 0.4;
  var colorEndR:Float = 0.6;
  var colorEndG:Float = 0.05;
  var colorEndB:Float = 0;
  var useBlendAdd:Bool = true;

  var config:ParticleEmitterConfig;
  var forces:Array<ParticleForce>;
  var simState:Dynamic;

  // Control panel construction (SliderDef entries as plain data; the DOM panel itself is stubbed).
  final controlSections:Array<Dynamic> = [
    {
      heading: 'Emission',
      controls: [
        {key: 'spawnRate', label: 'Spawn rate', min: 1, max: 500, step: 1},
        {key: 'maxParticles', label: 'Max particles', min: 100, max: 5000, step: 100},
      ],
    },
    {
      heading: 'Lifetime',
      controls: [
        {key: 'lifetimeMin', label: 'Lifetime min (s)', min: 0.05, max: 5, step: 0.05},
        {key: 'lifetimeMax', label: 'Lifetime max (s)', min: 0.05, max: 5, step: 0.05},
      ],
    },
    {
      heading: 'Speed',
      controls: [
        {key: 'speedMin', label: 'Speed min', min: 0, max: 400, step: 5},
        {key: 'speedMax', label: 'Speed max', min: 0, max: 400, step: 5},
      ],
    },
    {
      heading: 'Scale',
      controls: [
        {key: 'scaleMin', label: 'Scale min', min: 0.05, max: 4, step: 0.05},
        {key: 'scaleMax', label: 'Scale max', min: 0.05, max: 4, step: 0.05},
      ],
    },
    {
      heading: 'Alpha',
      controls: [
        {key: 'alphaStart', label: 'Alpha start', min: 0, max: 1, step: 0.05},
        {key: 'alphaEnd', label: 'Alpha end', min: 0, max: 1, step: 0.05},
      ],
    },
    {
      heading: 'Direction',
      controls: [
        {key: 'spread', label: 'Spread (deg)', min: 0, max: 360, step: 5},
        {key: 'directionX', label: 'Direction X', min: -1, max: 1, step: 0.1},
        {key: 'directionY', label: 'Direction Y', min: -1, max: 1, step: 0.1},
      ],
    },
    {
      heading: 'Gravity',
      controls: [
        {key: 'gravityX', label: 'Gravity X', min: -500, max: 500, step: 10},
        {key: 'gravityY', label: 'Gravity Y', min: -500, max: 500, step: 10},
      ],
    },
    {
      heading: 'Rotation',
      controls: [
        {key: 'rotationSpeedMin', label: 'Rotation min', min: -10, max: 10, step: 0.5},
        {key: 'rotationSpeedMax', label: 'Rotation max', min: -10, max: 10, step: 0.5},
      ],
    },
    {
      heading: 'Forces',
      controls: [
        {key: 'dragStrength', label: 'Drag', min: 0, max: 3, step: 0.1},
        {key: 'turbulenceStrength', label: 'Turbulence', min: 0, max: 200, step: 5},
      ],
    },
  ];

  // Mouse tracking — emitter follows the pointer.
  var mouseX:Float;
  var mouseY:Float;

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
      backgroundColor: 0x1a1a2eff,
      contextAttributes: {alpha: false, preserveDrawingBuffer: true},
      sceneGraphSyncPolicy: 'requiresInvalidation',
    });
    registerDefaultGlMaterial(renderState);
    registerRenderer(renderState, ParticleEmitter2DKind, defaultGlParticleEmitter2DRenderer);
    registerRenderer(renderState, TextLabelKind, defaultGlTextLabelRenderer);
    registerGlShapeCommands(defaultGlShapeCommands);
    enableGlBlendModeSupport(renderState);

    root = createDisplayObject();

    // Procedural radial glow particle texture (Canvas 2D painting stubbed to size reporting).
    final particleCanvas = createParticleTexture();

    atlas = createTextureAtlas({image: createImageResource(particleCanvas)});
    addTextureAtlasRegion(atlas, 0, 0, 16, 16);

    emitter = createParticleEmitter2D();
    emitter.data.atlas = atlas;
    emitter.blendMode = BlendMode.Add;
    emitter.scaleX = 1;
    emitter.scaleY = 1;
    emitter.x = (WIDTH * scale) / 2;
    emitter.y = (HEIGHT * scale) / 2;
    addNodeChild(root, emitter);

    countLabel = createTextLabel();
    countLabel.data.text = '0 particles';
    countLabel.data.textFormat = {size: 12, color: 0x999999};
    countLabel.x = 8 * scale;
    countLabel.y = (HEIGHT - 20) * scale;
    invalidateNodeLocalTransform(countLabel);
    addNodeChild(root, countLabel);

    config = rebuildConfig();
    forces = rebuildForces();
    simState = createParticleEmitterState();

    // Color controls (initial hex derived through the portable rgb<->hex helpers).
    addColorPicker('Start color', rgbToHex(colorStartR, colorStartG, colorStartB), function(r, g, b) {
      colorStartR = r;
      colorStartG = g;
      colorStartB = b;
    });

    addColorPicker('End color', rgbToHex(colorEndR, colorEndG, colorEndB), function(r, g, b) {
      colorEndR = r;
      colorEndG = g;
      colorEndB = b;
    });

    // Mouse tracking — emitter follows the pointer.
    mouseX = (WIDTH * scale) / 2;
    mouseY = (HEIGHT * scale) / 2;

    invalidateNodeLocalTransform(emitter);
    ready = true;
  }

  // Upstream builds the glow sprite with the Canvas 2D radial-gradient API; that painting has no SDK
  // call sites, so the port reduces it to a size-reporting stub the image resource wraps.
  function createParticleTexture():Dynamic {
    return {width: 16, height: 16};
  }

  function rebuildConfig():ParticleEmitterConfig {
    final alphaCurve = buildParticleCurve(function(t) return editable.alphaStart + (editable.alphaEnd - editable.alphaStart) * t);
    final scaleCurve = buildParticleCurve(function(t) return 1 - t * 0.6);
    final colorCurve = particleColorCurveFromKeyframes([
      {time: 0.0, r: colorStartR, g: colorStartG, b: colorStartB},
      {time: 1.0, r: colorEndR, g: colorEndG, b: colorEndB},
    ]);

    return createParticleEmitterConfig({
      worldSpace: true,
      spawnRate: editable.spawnRate,
      lifetimeMin: editable.lifetimeMin,
      lifetimeMax: editable.lifetimeMax,
      speedMin: editable.speedMin * scale,
      speedMax: editable.speedMax * scale,
      scaleMin: editable.scaleMin * scale,
      scaleMax: editable.scaleMax * scale,
      spread: (editable.spread / 180) * Math.PI,
      directionX: editable.directionX,
      directionY: editable.directionY,
      gravityX: editable.gravityX * scale,
      gravityY: editable.gravityY * scale,
      rotationSpeedMin: editable.rotationSpeedMin,
      rotationSpeedMax: editable.rotationSpeedMax,
      maxParticles: editable.maxParticles,
      alphaCurve: alphaCurve,
      scaleCurve: scaleCurve,
      colorCurve: colorCurve,
    });
  }

  function rebuildForces():Array<ParticleForce> {
    final forces:Array<ParticleForce> = [];
    if (editable.dragStrength > 0) {
      forces.push({kind: 'DragForce', strength: editable.dragStrength});
    }
    if (editable.turbulenceStrength > 0) {
      forces.push({kind: 'TurbulenceForce', strength: editable.turbulenceStrength * scale, scale: 0.01});
    }
    return forces;
  }

  function formatValue(value:Float):String {
    if (value == Math.floor(value)) return Std.string(Std.int(value));
    return toFixed(value, 2);
  }

  function onConfigChange():Void {
    config = rebuildConfig();
    forces = rebuildForces();
    emitter.blendMode = useBlendAdd ? BlendMode.Add : BlendMode.Normal;
  }

  function rgbToHex(r:Float, g:Float, b:Float):String {
    final ri = Math.round(r * 255);
    final gi = Math.round(g * 255);
    final bi = Math.round(b * 255);
    return '#' + padStart2(StringTools.hex(ri)) + padStart2(StringTools.hex(gi)) + padStart2(StringTools.hex(bi));
  }

  function hexToRgb(hex:String):Dynamic {
    final n = Std.parseInt('0x' + hex.substr(1));
    return {r: ((n >> 16) & 0xff) / 255, g: ((n >> 8) & 0xff) / 255, b: (n & 0xff) / 255};
  }

  // Upstream builds a DOM `<label><input type="color">`; the port keeps the portable callback wiring
  // but the panel itself has no Lime equivalent, so element construction is stubbed out.
  function addColorPicker(labelText:String, initialHex:String, onChange:Float->Float->Float->Void):Void {}

  // Portable stand-in for `String.prototype.padStart(2, '0')` over a hex byte.
  static function padStart2(s:String):String {
    return s.length < 2 ? '0' + s : s;
  }

  // Mouse tracking — emitter follows the pointer. Lime reports window pixel coordinates; the upstream
  // `* scale` factor into emitter space is preserved.
  override public function onMouseMove(x:Float, y:Float):Void {
    if (!ready) return;
    mouseX = x * scale;
    mouseY = y * scale;
  }

  // Upstream `enterFrame`, driven by Lime's per-frame `update` (deltaTime is milliseconds).
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    final rawDelta = deltaTime / 1000.0;
    final dt = Math.min(rawDelta, 0.05);

    // Snap emitter to mouse position.
    emitter.x = mouseX;
    emitter.y = mouseY;
    invalidateNodeLocalTransform(emitter);

    // World-space emitter bakes spawns through its own node world transform (set above), so nothing to pass.
    applyParticleForces(emitter, simState, forces, dt);
    updateParticleEmitter2D(emitter, simState, config, dt);
    invalidateNodeAppearance(emitter);

    countLabel.data.text = emitter.data.particleCount + ' particles';
    invalidateNodeAppearance(countLabel);
  }

  // Upstream `render(root)`, driven by Lime's per-frame `render`.
  override public function render(context:RenderContext):Void {
    if (!ready || root == null) return;
    if (!prepareDisplayObjectRender(renderState, root)) return;
    renderGlBackground(renderState);
    renderGlDisplayObject(renderState, root);
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
    return window.width;
  }

  function get_height():Int {
    return window.height;
  }

  static function resolveContext(window:Window):Dynamic {
    final renderContext:Dynamic = window.context;
    if (renderContext == null) return null;
    final webgl2 = renderContext.webgl2;
    return webgl2 == null ? renderContext.webgl : webgl2;
  }
}
