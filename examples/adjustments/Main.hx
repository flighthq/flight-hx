// Line-by-line Haxe/Lime port of the upstream `adjustments` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// The HTML `<input type="range">` sliders have no standalone-window equivalent, so each becomes a plain
// `{value:Float}` holder seeded with its initial value; every other statement is translated faithfully.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.DisplayObject;
import flighthq.types.Shape;
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

  final CANVAS_HEIGHT = 600;

  // Packed 0xRRGGBBAA colors. Each exceeds the 32-bit signed Int range, so they are built with Float
  // arithmetic (`rgb * 256 + alpha`) rather than a hex Int literal that would overflow to a negative value.
  final SAMPLE_COLORS:Array<Float> = [
    0xff0000 * 256.0 + 0xff, 0x00ff00 * 256.0 + 0xff, 0x0000ff * 256.0 + 0xff, 0xffff00 * 256.0 + 0xff, 0xff00ff * 256.0 + 0xff,
    0x00ffff * 256.0 + 0xff, 0xffffff * 256.0 + 0xff, 0x808080 * 256.0 + 0xff,
  ];

  final SWATCH_SIZE = 40;
  final SWATCH_GAP = 8;
  final SWATCHES_X = 40;
  final SWATCHES_BEFORE_Y = 340;
  final SWATCHES_AFTER_Y = 420;

  final MATRIX_X = 40;
  final MATRIX_Y = 200;
  final MATRIX_CELL_WIDTH = 90;
  final MATRIX_CELL_HEIGHT = 24;

  var root:DisplayObject;

  // Slider state.
  var brightness = 0.0;
  var contrast = 1.0;
  var hueRotation = 0.0;
  var saturation = 1.0;

  // Fused color matrix (recomputed when sliders change).
  var fusedMatrix:Array<Float>;

  var brightnessSlider:SliderHolder;
  var contrastSlider:SliderHolder;
  var hueSlider:SliderHolder;
  var saturationSlider:SliderHolder;

  // Matrix display: 4 rows x 5 columns of text labels showing the fused matrix values.
  var matrixLabels:Array<DisplayObject> = [];

  final ROW_LABELS = ["R'", "G'", "B'", "A'"];
  final COL_LABELS = ['R', 'G', 'B', 'A', 'Offset'];

  var afterSwatches:Array<Shape> = [];
  var afterHexLabels:Array<DisplayObject> = [];

  public function new() {
    super();
  }

  // The HTML slider factory has no standalone equivalent; it returns a `{value}` holder seeded with `initial`.
  function createSlider(labelText:String, min:Float, max:Float, step:Float, initial:Float, x:Float, y:Float):SliderHolder {
    return {value: initial};
  }

  function createLabel(text:String, x:Float, y:Float, size:Float, color:Int):DisplayObject {
    final label = createTextLabel();
    label.data.text = text;
    label.data.textFormat = {size: size, color: color};
    label.x = x;
    label.y = y;
    invalidateNodeLocalTransform(label);
    return label;
  }

  function updateLabel(label:DisplayObject, text:String):Void {
    label.data.text = text;
    invalidateNodeAppearance(label);
  }

  function formatMatrixValue(v:Float):String {
    if (Math.abs(v) < 0.0005) return '0.000';
    return toFixed(v, 3);
  }

  function packedRgbaToHex(packed:Float):String {
    final r = Std.int(packed / 16777216) & 0xff;
    final g = Std.int(packed / 65536) & 0xff;
    final b = Std.int(packed / 256) & 0xff;
    return '#' + StringTools.hex((1 << 24) | (r << 16) | (g << 8) | b).substr(1).toLowerCase();
  }

  function recomputeMatrix():Void {
    final matrices:Array<Array<Float>> = [];

    if (brightness != 0) matrices.push(createBrightnessColorMatrix(brightness));
    if (contrast != 1) matrices.push(createContrastColorMatrix(contrast));
    if (hueRotation != 0) matrices.push(createHueRotateColorMatrix(hueRotation));
    if (saturation != 1) matrices.push(createSaturationColorMatrix(saturation));

    fusedMatrix = matrices.length > 0 ? fuseColorMatrices(matrices) : createIdentityColorMatrix();
  }

  function updateMatrixDisplay():Void {
    for (row in 0...4) {
      for (col in 0...5) {
        final idx = row * 5 + col;
        updateLabel(matrixLabels[idx], formatMatrixValue(fusedMatrix[idx]));
      }
    }
  }

  function updateSwatches():Void {
    for (i in 0...SAMPLE_COLORS.length) {
      final original = SAMPLE_COLORS[i];
      final transformed = applyColorMatrixToColor(fusedMatrix, original);

      final x = SWATCHES_X + i * (SWATCH_SIZE + SWATCH_GAP);
      final shape = afterSwatches[i];
      clearShapeCommands(shape);
      appendShapeBeginFill(shape, Std.int(transformed / 256), (transformed % 256) / 255);
      appendShapeRectangle(shape, x, SWATCHES_AFTER_Y, SWATCH_SIZE, SWATCH_SIZE);
      invalidateNodeLocalTransform(shape);

      updateLabel(afterHexLabels[i], packedRgbaToHex(transformed));
    }
  }

  function onSliderChange():Void {
    brightness = brightnessSlider.value;
    contrast = contrastSlider.value;
    hueRotation = hueSlider.value;
    saturation = saturationSlider.value;

    recomputeMatrix();
    updateMatrixDisplay();
    updateSwatches();
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

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    fusedMatrix = createIdentityColorMatrix();

    // Create sliders in HTML overlay above the canvas.
    brightnessSlider = createSlider('Brightness', -128, 128, 1, 0, 20, 20);
    contrastSlider = createSlider('Contrast', 0, 3, 0.01, 1, 20, 50);
    hueSlider = createSlider('Hue Rotate', -180, 180, 1, 0, 20, 80);
    saturationSlider = createSlider('Saturation', 0, 3, 0.01, 1, 20, 110);

    // Title and section labels.
    addNodeChild(root, createLabel('4x5 Color Matrix (fused)', MATRIX_X, MATRIX_Y - 30, 16, 0xcccccc));

    for (col in 0...5) {
      addNodeChild(root, createLabel(COL_LABELS[col], MATRIX_X + 40 + col * MATRIX_CELL_WIDTH, MATRIX_Y - 10, 12, 0x888888));
    }

    for (row in 0...4) {
      addNodeChild(root, createLabel(ROW_LABELS[row], MATRIX_X, MATRIX_Y + 14 + row * MATRIX_CELL_HEIGHT, 12, 0x888888));
      for (col in 0...5) {
        final label = createLabel('0.000', MATRIX_X + 40 + col * MATRIX_CELL_WIDTH, MATRIX_Y + 14 + row * MATRIX_CELL_HEIGHT, 13, 0xeedd44);
        addNodeChild(root, label);
        matrixLabels.push(label);
      }
    }

    // Color swatch shapes: "before" row (original) and "after" row (matrix-transformed).
    addNodeChild(root, createLabel('Original colors', SWATCHES_X, SWATCHES_BEFORE_Y - 22, 14, 0xcccccc));
    addNodeChild(root, createLabel('After matrix', SWATCHES_X, SWATCHES_AFTER_Y - 22, 14, 0xcccccc));

    for (i in 0...SAMPLE_COLORS.length) {
      final x = SWATCHES_X + i * (SWATCH_SIZE + SWATCH_GAP);

      final beforeShape = createShape();
      appendShapeBeginFill(beforeShape, Std.int(SAMPLE_COLORS[i] / 256), 1);
      appendShapeRectangle(beforeShape, x, SWATCHES_BEFORE_Y, SWATCH_SIZE, SWATCH_SIZE);
      addNodeChild(root, beforeShape);

      final afterShape = createShape();
      addNodeChild(root, afterShape);
      afterSwatches.push(afterShape);
    }

    // Hex value labels below each after-swatch.
    for (i in 0...SAMPLE_COLORS.length) {
      final x = SWATCHES_X + i * (SWATCH_SIZE + SWATCH_GAP);
      final hexLabel = createLabel('', x, SWATCHES_AFTER_Y + SWATCH_SIZE + 4, 9, 0x888888);
      addNodeChild(root, hexLabel);
      afterHexLabels.push(hexLabel);
    }

    // Description label at the bottom.
    addNodeChild(root, createLabel('Adjustments compose a 4x5 color matrix as pure data. Use sliders to build a fused matrix.', SWATCHES_X, CANVAS_HEIGHT - 40, 12, 0x666666));

    // Initial computation.
    recomputeMatrix();
    updateMatrixDisplay();
    updateSwatches();

    ready = true;
  }

  override public function update(deltaTime:Int):Void {
    if (!ready) return;
  }

  // Upstream `enterFrame` only calls `render(root)`, driven here by Lime's per-frame `render`.
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

// Stand-in for the HTML `<input type="range">` element the upstream slider factory returns.
private typedef SliderHolder = {var value:Float;};

// Minimal GL canvas adapter over the Lime window, matching the shape `createGlRenderState` expects.
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
