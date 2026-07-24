// Line-by-line Haxe/Lime port of the upstream `sound` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
//
// Two pieces of the upstream program are irreducible browser glue and adapted as the earlier headless
// ports did: (1) Web Audio's `new AudioContext()` is browser-only, so `getAudioContext` returns a stub
// context object — the Lime target supplies audio output — keeping the SDK audio call sites identical;
// (2) the DOM pointer source (`createInputManager`/`attachPointerInput`/`connectInputToInteraction`)
// is replaced by Lime's `onMouseDown`/`onMouseMove`/`onMouseUp`, which dispatch straight into the
// Flight interaction manager. Every other statement is translated faithfully.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq._internal._Float32Array;
import flighthq.types.AudioBus;
import flighthq.types.AudioResource;
import flighthq.types.DisplayObject;
import flighthq.types.Shape;
import flighthq.types.TextLabel;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;
import lime.ui.MouseButton;
import lime.ui.Window;

typedef SoundButton = {
  var shape:Shape;
  var label:String;
  var color:Int;
  var hoverColor:Int;
  var x:Float;
  var y:Float;
  var w:Float;
  var h:Float;
  var resource:AudioResource;
  var pan:Float;
};

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;

  final SAMPLE_RATE = 44100;

  // Web Audio requires a user gesture to start. The AudioContext is created once and resumed on
  // the first pointer interaction.
  var audioContext:Dynamic = null;

  // Scene graph root, scaled to device pixel ratio.
  var root:DisplayObject;

  var interactionManager:Dynamic;

  // Audio mixer with two buses: sfx and music.
  var mixer:AudioMixer = null;
  var sfxBus:AudioBus;
  var musicBus:AudioBus;

  final BUTTON_Y = 120;
  final BUTTON_W = 180;
  final BUTTON_H = 80;
  final BUTTON_GAP = 40;

  var buttons:Array<SoundButton>;

  // Volume slider bar: a horizontal bar that controls the master gain.
  final SLIDER_X = 60;
  final SLIDER_Y = 280;
  final SLIDER_W = 680;
  final SLIDER_H = 30;
  var masterGain = 0.7;

  var sliderTrack:Shape;
  var sliderFill:Shape;
  var sliderHandle:Shape;

  // Bus gain control sliders.
  final BUS_SLIDER_Y = 380;
  final BUS_SLIDER_W = 300;
  final BUS_SLIDER_H = 24;

  var sfxSliderTrack:Shape;
  var sfxSliderFill:Shape;
  var musicSliderTrack:Shape;
  var musicSliderFill:Shape;

  // Bus pan control sliders.
  final PAN_SLIDER_Y = 450;

  var sfxPanTrack:Shape;
  var sfxPanFill:Shape;
  var musicPanTrack:Shape;
  var musicPanFill:Shape;

  // Hovered state tracking.
  var hoveredButtons:Array<SoundButton>;

  var statusLabel:TextLabel;
  var masterValueLabel:TextLabel;

  public function new() {
    super();
  }

  // Procedurally generate a sine tone with exponential decay.
  function generateTone(frequency:Float, duration:Float, decay:Float):AudioResource {
    final length = Math.floor(SAMPLE_RATE * duration);
    final samples = new _Float32Array(length);
    for (i in 0...length) {
      final t = i / SAMPLE_RATE;
      final envelope = Math.exp(-decay * t);
      samples[i] = Math.sin(2 * Math.PI * frequency * t) * envelope;
    }
    return createAudioResourceFromSamples([samples], SAMPLE_RATE);
  }

  // Procedurally generate a frequency sweep with linear interpolation.
  function generateSweep(startFreq:Float, endFreq:Float, duration:Float, decay:Float):AudioResource {
    final length = Math.floor(SAMPLE_RATE * duration);
    final samples = new _Float32Array(length);
    var phase = 0.0;
    for (i in 0...length) {
      final t = i / SAMPLE_RATE;
      final freq = startFreq + (endFreq - startFreq) * (t / duration);
      final envelope = Math.exp(-decay * t);
      samples[i] = Math.sin(phase) * envelope;
      phase += (2 * Math.PI * freq) / SAMPLE_RATE;
    }
    return createAudioResourceFromSamples([samples], SAMPLE_RATE);
  }

  function getAudioContext():Dynamic {
    if (audioContext == null) {
      // `new AudioContext()` is browser-only; the Lime target supplies audio output. Stub the context
      // object so the SDK audio call sites (createAudioMixer/playAudioResource) stay identical.
      audioContext = {state: 'running'};
    }
    if (audioContext.state == 'suspended') {
      // audioContext.resume().catch(() => {});
    }
    return audioContext;
  }

  function ensureMixer():AudioMixer {
    if (mixer == null) {
      mixer = createAudioMixer(getAudioContext());
      addAudioBusToMixer(mixer, sfxBus);
      addAudioBusToMixer(mixer, musicBus);
    }
    return mixer;
  }

  // Play a sound through the sfx bus.
  function playSfx(resource:AudioResource, gain:Float, pan:Float):Null<AudioChannel> {
    final ctx = getAudioContext();
    final channel = playAudioResource(ctx, resource, {gain: gain});
    if (channel != null) {
      routeAudioChannelToMixerBus(ensureMixer(), channel, sfxBus);
    }
    return channel;
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
    registerRenderer(renderState, ShapeKind, defaultGlShapeRenderer);
    registerRenderer(renderState, TextLabelKind, defaultGlTextLabelRenderer);
    registerGlShapeCommands(defaultGlShapeCommands);
    enableGlBlendModeSupport(renderState);

    final clickSound = generateTone(440, 0.15, 20);
    final blipSound = generateTone(880, 0.08, 40);
    final sweepSound = generateSweep(200, 800, 0.3, 6);

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    // Interaction setup: register hit test handlers and wire pointer events. The manager gets a cursor
    // backend so a node's `setNodeCursor` shows through on rollover (the buttons/sliders below opt in).
    registerDefaultHitTests();
    final canvasElement = canvas;
    interactionManager = createInteractionManager(root, {
      cursorBackend: createWebCursorBackend(canvasElement),
    });
    // Upstream feeds the manager from a DOM pointer source (createInputManager/attachPointerInput/
    // connectInputToInteraction). Lime's onMouseDown/onMouseMove/onMouseUp dispatch into the manager
    // directly (see below), so no DOM input source is created here.

    sfxBus = createAudioBus({name: 'sfx', gain: 0.8});
    musicBus = createAudioBus({name: 'music', gain: 0.6});

    buttons = [
      {
        shape: createShape(),
        label: 'Click (440 Hz)',
        color: 0x3a7bd5,
        hoverColor: 0x5a9bf5,
        x: 60,
        y: BUTTON_Y,
        w: BUTTON_W,
        h: BUTTON_H,
        resource: clickSound,
        pan: -0.5,
      },
      {
        shape: createShape(),
        label: 'Blip (880 Hz)',
        color: 0x2ecc71,
        hoverColor: 0x4eec91,
        x: 60 + BUTTON_W + BUTTON_GAP,
        y: BUTTON_Y,
        w: BUTTON_W,
        h: BUTTON_H,
        resource: blipSound,
        pan: 0,
      },
      {
        shape: createShape(),
        label: 'Sweep (200-800 Hz)',
        color: 0xe74c3c,
        hoverColor: 0xf76c5c,
        x: 60 + (BUTTON_W + BUTTON_GAP) * 2,
        y: BUTTON_Y,
        w: BUTTON_W,
        h: BUTTON_H,
        resource: sweepSound,
        pan: 0.5,
      },
    ];

    sliderTrack = createShape();
    sliderFill = createShape();
    sliderHandle = createShape();

    sfxSliderTrack = createShape();
    sfxSliderFill = createShape();
    musicSliderTrack = createShape();
    musicSliderFill = createShape();

    sfxPanTrack = createShape();
    sfxPanFill = createShape();
    musicPanTrack = createShape();
    musicPanFill = createShape();

    hoveredButtons = [];

    // Initialize scene graph: add buttons, sliders, and labels. Hit testing is opt-in — only the nodes
    // that call `setNodeHitTestEnabled(node, true)` are candidates, so the labels and slider fills drawn
    // on top of the buttons/tracks are transparent to the pointer for free (they never opt in). Each
    // button opts in and shows the pointer (hand) cursor on rollover via the manager's cursor backend.
    for (btn in buttons) {
      addNodeChild(root, btn.shape);
      setNodeHitTestEnabled(btn.shape, true);
      setNodeCursor(btn.shape, 'pointer');
      drawButton(btn);
    }

    addNodeChild(root, sliderTrack);
    addNodeChild(root, sliderFill);
    addNodeChild(root, sliderHandle);
    addNodeChild(root, sfxSliderTrack);
    addNodeChild(root, sfxSliderFill);
    addNodeChild(root, musicSliderTrack);
    addNodeChild(root, musicSliderFill);
    addNodeChild(root, sfxPanTrack);
    addNodeChild(root, sfxPanFill);
    addNodeChild(root, musicPanTrack);
    addNodeChild(root, musicPanFill);

    // Only the tracks opt into hit testing; their fills/handle overlays never do, so a click on the
    // filled half passes through to the track underneath and the whole bar stays draggable. The tracks
    // also show a horizontal-resize cursor on rollover to read as draggable.
    for (track in [sliderTrack, sfxSliderTrack, musicSliderTrack, sfxPanTrack, musicPanTrack]) {
      setNodeHitTestEnabled(track, true);
      setNodeCursor(track, 'ew-resize');
    }

    drawMasterSlider();
    drawBusSliders();
    drawPanSliders();

    // Labels.
    final titleLabel = createTextLabel();
    titleLabel.data.text = 'Sound Example - Procedural Audio & Mixer';
    titleLabel.data.textFormat = {size: 18, color: 0xcccccc};
    titleLabel.x = 60;
    titleLabel.y = 30;
    invalidateNodeLocalTransform(titleLabel);
    addNodeChild(root, titleLabel);

    final instructionLabel = createTextLabel();
    instructionLabel.data.text = 'Click the buttons to play procedurally generated tones.';
    instructionLabel.data.textFormat = {size: 13, color: 0x888888};
    instructionLabel.x = 60;
    instructionLabel.y = 65;
    invalidateNodeLocalTransform(instructionLabel);
    addNodeChild(root, instructionLabel);

    // Button labels sit on top of their button. They never opt into hit testing, so a click on the text
    // passes straight through to the button beneath instead of being swallowed by the label.
    for (btn in buttons) {
      final label = createTextLabel();
      label.data.text = btn.label;
      label.data.textFormat = {size: 14, color: 0xffffff};
      label.x = btn.x + 12;
      label.y = btn.y + btn.h / 2 - 8;
      invalidateNodeLocalTransform(label);
      addNodeChild(root, label);
    }

    final masterLabel = createTextLabel();
    masterLabel.data.text = 'Master Volume';
    masterLabel.data.textFormat = {size: 13, color: 0xaaaaaa};
    masterLabel.x = SLIDER_X;
    masterLabel.y = SLIDER_Y - 24;
    invalidateNodeLocalTransform(masterLabel);
    addNodeChild(root, masterLabel);

    masterValueLabel = createTextLabel();
    masterValueLabel.data.text = Math.round(masterGain * 100) + '%';
    masterValueLabel.data.textFormat = {size: 13, color: 0xdddddd};
    masterValueLabel.x = SLIDER_X + SLIDER_W + 12;
    masterValueLabel.y = SLIDER_Y + 4;
    invalidateNodeLocalTransform(masterValueLabel);
    addNodeChild(root, masterValueLabel);

    final sfxBusLabel = createTextLabel();
    sfxBusLabel.data.text = 'SFX Bus Gain';
    sfxBusLabel.data.textFormat = {size: 12, color: 0x8899bb};
    sfxBusLabel.x = SLIDER_X;
    sfxBusLabel.y = BUS_SLIDER_Y - 20;
    invalidateNodeLocalTransform(sfxBusLabel);
    addNodeChild(root, sfxBusLabel);

    final musicBusLabel = createTextLabel();
    musicBusLabel.data.text = 'Music Bus Gain';
    musicBusLabel.data.textFormat = {size: 12, color: 0x88bb99};
    musicBusLabel.x = SLIDER_X + BUS_SLIDER_W + 80;
    musicBusLabel.y = BUS_SLIDER_Y - 20;
    invalidateNodeLocalTransform(musicBusLabel);
    addNodeChild(root, musicBusLabel);

    final sfxPanLabel = createTextLabel();
    sfxPanLabel.data.text = 'SFX Bus Pan';
    sfxPanLabel.data.textFormat = {size: 12, color: 0x8899bb};
    sfxPanLabel.x = SLIDER_X;
    sfxPanLabel.y = PAN_SLIDER_Y - 20;
    invalidateNodeLocalTransform(sfxPanLabel);
    addNodeChild(root, sfxPanLabel);

    final musicPanLabel = createTextLabel();
    musicPanLabel.data.text = 'Music Bus Pan';
    musicPanLabel.data.textFormat = {size: 12, color: 0x88bb99};
    musicPanLabel.x = SLIDER_X + BUS_SLIDER_W + 80;
    musicPanLabel.y = PAN_SLIDER_Y - 20;
    invalidateNodeLocalTransform(musicPanLabel);
    addNodeChild(root, musicPanLabel);

    statusLabel = createTextLabel();
    statusLabel.data.text = 'Ready';
    statusLabel.data.textFormat = {size: 13, color: 0x999999};
    statusLabel.x = 60;
    statusLabel.y = 530;
    invalidateNodeLocalTransform(statusLabel);
    addNodeChild(root, statusLabel);

    // Wire interaction signals for sound buttons.
    for (btn in buttons) {
      connectInteractionSignal(interactionManager, btn.shape, 'onPointerOver', function() {
        hoveredButtonsAdd(btn);
        drawButton(btn);
      });

      connectInteractionSignal(interactionManager, btn.shape, 'onPointerOut', function() {
        hoveredButtonsDelete(btn);
        drawButton(btn);
      });

      connectInteractionSignal(interactionManager, btn.shape, 'onPointerDown', function(data:Dynamic) {
        playSfx(btn.resource, 0.8, btn.pan);
        updateStatus('Played: ' + btn.label);
      });
    }

    // Wire interaction signals for the master volume slider track.
    connectInteractionSignal(interactionManager, sliderTrack, 'onPointerDown', function(data:Dynamic) {
      final localX = data.localX - SLIDER_X;
      masterGain = Math.max(0, Math.min(1, localX / SLIDER_W));
      if (mixer != null) setAudioMixerMasterGain(mixer, masterGain);
      drawMasterSlider();
      updateMasterValueLabel();
      updateStatus('Master volume: ' + Math.round(masterGain * 100) + '%');
    });

    // Wire interaction for bus gain sliders.
    connectInteractionSignal(interactionManager, sfxSliderTrack, 'onPointerDown', function(data:Dynamic) {
      final localX = data.localX - SLIDER_X;
      final gain = Math.max(0, Math.min(1, localX / BUS_SLIDER_W));
      setAudioBusGain(sfxBus, gain);
      drawBusSliders();
      updateStatus('SFX bus gain: ' + Math.round(gain * 100) + '%');
    });

    connectInteractionSignal(interactionManager, musicSliderTrack, 'onPointerDown', function(data:Dynamic) {
      final localX = data.localX - (SLIDER_X + BUS_SLIDER_W + 80);
      final gain = Math.max(0, Math.min(1, localX / BUS_SLIDER_W));
      setAudioBusGain(musicBus, gain);
      drawBusSliders();
      updateStatus('Music bus gain: ' + Math.round(gain * 100) + '%');
    });

    // Wire interaction for bus pan sliders.
    connectInteractionSignal(interactionManager, sfxPanTrack, 'onPointerDown', function(data:Dynamic) {
      final localX = data.localX - SLIDER_X;
      final pan = Math.max(-1, Math.min(1, (localX / BUS_SLIDER_W) * 2 - 1));
      setAudioBusPan(sfxBus, pan);
      drawPanSliders();
      updateStatus('SFX bus pan: ' + toFixed(pan, 2));
    });

    connectInteractionSignal(interactionManager, musicPanTrack, 'onPointerDown', function(data:Dynamic) {
      final localX = data.localX - (SLIDER_X + BUS_SLIDER_W + 80);
      final pan = Math.max(-1, Math.min(1, (localX / BUS_SLIDER_W) * 2 - 1));
      setAudioBusPan(musicBus, pan);
      drawPanSliders();
      updateStatus('Music bus pan: ' + toFixed(pan, 2));
    });

    ready = true;
  }

  function hoveredButtonsAdd(btn:SoundButton):Void {
    if (hoveredButtons.indexOf(btn) == -1) hoveredButtons.push(btn);
  }

  function hoveredButtonsDelete(btn:SoundButton):Void {
    hoveredButtons.remove(btn);
  }

  function drawButton(btn:SoundButton):Void {
    final isHovered = hoveredButtons.indexOf(btn) != -1;
    final color = isHovered ? btn.hoverColor : btn.color;
    clearShapeCommands(btn.shape);
    appendShapeBeginFill(btn.shape, color, 0.9);
    appendShapeRectangle(btn.shape, btn.x, btn.y, btn.w, btn.h);
    appendShapeEndFill(btn.shape);
    invalidateNodeLocalTransform(btn.shape);
  }

  function drawSliderBar(track:Shape, fill:Shape, x:Float, y:Float, w:Float, h:Float, ratio:Float, trackColor:Int,
      fillColor:Int):Void {
    clearShapeCommands(track);
    appendShapeBeginFill(track, trackColor, 0.4);
    appendShapeRectangle(track, x, y, w, h);
    appendShapeEndFill(track);
    invalidateNodeLocalTransform(track);

    clearShapeCommands(fill);
    appendShapeBeginFill(fill, fillColor, 0.8);
    appendShapeRectangle(fill, x, y, Math.max(1, w * ratio), h);
    appendShapeEndFill(fill);
    invalidateNodeLocalTransform(fill);
  }

  function drawPanBar(track:Shape, fill:Shape, x:Float, y:Float, w:Float, h:Float, pan:Float, trackColor:Int,
      fillColor:Int):Void {
    clearShapeCommands(track);
    appendShapeBeginFill(track, trackColor, 0.4);
    appendShapeRectangle(track, x, y, w, h);
    appendShapeEndFill(track);
    invalidateNodeLocalTransform(track);

    // Pan ranges from -1 to 1. Draw a bar from center to the pan position.
    final center = x + w / 2;
    final panOffset = (pan / 2 + 0.5) * w;
    final barX = Math.min(center, x + panOffset);
    final barW = Math.abs(panOffset - w / 2);
    clearShapeCommands(fill);
    appendShapeBeginFill(fill, fillColor, 0.8);
    appendShapeRectangle(fill, barX, y, Math.max(1, barW), h);
    appendShapeEndFill(fill);
    invalidateNodeLocalTransform(fill);
  }

  function drawMasterSlider():Void {
    drawSliderBar(sliderTrack, sliderFill, SLIDER_X, SLIDER_Y, SLIDER_W, SLIDER_H, masterGain, 0x444444, 0xdddddd);

    clearShapeCommands(sliderHandle);
    final handleX = SLIDER_X + SLIDER_W * masterGain - 4;
    appendShapeBeginFill(sliderHandle, 0xffffff, 1);
    appendShapeRectangle(sliderHandle, handleX, SLIDER_Y - 4, 8, SLIDER_H + 8);
    appendShapeEndFill(sliderHandle);
    invalidateNodeLocalTransform(sliderHandle);
  }

  function drawBusSliders():Void {
    drawSliderBar(sfxSliderTrack, sfxSliderFill, SLIDER_X, BUS_SLIDER_Y, BUS_SLIDER_W, BUS_SLIDER_H, sfxBus.gain,
      0x444444, 0x3a7bd5);
    drawSliderBar(musicSliderTrack, musicSliderFill, SLIDER_X + BUS_SLIDER_W + 80, BUS_SLIDER_Y, BUS_SLIDER_W,
      BUS_SLIDER_H, musicBus.gain, 0x444444, 0x2ecc71);
  }

  function drawPanSliders():Void {
    drawPanBar(sfxPanTrack, sfxPanFill, SLIDER_X, PAN_SLIDER_Y, BUS_SLIDER_W, BUS_SLIDER_H, sfxBus.pan, 0x444444,
      0x3a7bd5);
    drawPanBar(musicPanTrack, musicPanFill, SLIDER_X + BUS_SLIDER_W + 80, PAN_SLIDER_Y, BUS_SLIDER_W, BUS_SLIDER_H,
      musicBus.pan, 0x444444, 0x2ecc71);
  }

  function updateStatus(text:String):Void {
    if (statusLabel.data.text != text) {
      statusLabel.data.text = text;
      invalidateNodeAppearance(statusLabel);
    }
  }

  function updateMasterValueLabel():Void {
    final text = Math.round(masterGain * 100) + '%';
    if (masterValueLabel.data.text != text) {
      masterValueLabel.data.text = text;
      invalidateNodeAppearance(masterValueLabel);
    }
  }

  // Pointer events. Upstream attaches a DOM pointer source to the input manager; Lime dispatches
  // straight into the Flight interaction manager here.
  override public function onMouseDown(x:Float, y:Float, button:MouseButton):Void {
    if (!ready) return;
    dispatchInteractionPointerDown(interactionManager, x, y, cast button);
  }

  override public function onMouseMove(x:Float, y:Float):Void {
    if (!ready) return;
    dispatchInteractionPointerMove(interactionManager, x, y);
  }

  override public function onMouseUp(x:Float, y:Float, button:MouseButton):Void {
    if (!ready) return;
    dispatchInteractionPointerUp(interactionManager, x, y, cast button);
  }

  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {}

  // Upstream `enterFrame` only re-renders; there is no per-frame state to advance.
  override public function update(deltaTime:Int):Void {}

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
// It also stands in for the DOM canvas element the interaction cursor backend expects (`style`).
// @:keep — Flight reaches this adapter only reflectively (getContext/width/height via Reflect),
// so full DCE would strip those members and reflective access would crash. Retain the whole adapter.
@:keep
private class _GlCanvas {
  // Flight's GL renderer reads `canvas.width`/`canvas.height` reflectively (`Reflect.field`) to build
  // both the GL viewport and the pixel->clip projection. A Haxe `(get, never)` property compiles to
  // `get_width()` with no reflectable `width` field, so the reflective read returns `undefined`, the
  // viewport becomes 0x0 and the projection `2 / undefined` becomes NaN — every draw is discarded while
  // the (viewport/projection-independent) background clear still shows. So expose plain physical fields
  // and keep them in sync with the backing buffer size (device pixels = window size * scale).
  public var width:Int = 0;
  public var height:Int = 0;
  public var style:Dynamic = {};

  final window:Window;
  final context:Dynamic;

  public function new(window:Window) {
    this.window = window;
    context = resolveContext(window);
    if (context == null) throw 'Flight examples require a hardware OpenGL/WebGL window.';
    syncSize();
    window.onResize.add((_, _) -> syncSize());
  }

  public function getContext(contextId:String, ?attributes:Dynamic):Dynamic {
    return context;
  }

  function syncSize():Void {
    width = Std.int(window.width * window.scale);
    height = Std.int(window.height * window.scale);
  }

  static function resolveContext(window:Window):Dynamic {
    final renderContext:Dynamic = window.context;
    if (renderContext == null) return null;
    final webgl2 = renderContext.webgl2;
    return webgl2 == null ? renderContext.webgl : webgl2;
  }
}
