// Line-by-line Haxe/Lime port of the upstream `text` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// Every statement of the upstream program is otherwise translated faithfully.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.DisplayObject;
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

  var root:DisplayObject;

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
    registerRenderer(renderState, TextLabelKind, defaultGlTextLabelRenderer);
    registerRenderer(renderState, RichTextKind, defaultGlRichTextRenderer);
    enableGlBlendModeSupport(renderState);

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    // Section 1: TextLabel basics — different sizes, colors, and font families.

    final headingBasics = createTextLabel();
    headingBasics.x = 30;
    headingBasics.y = 20;
    headingBasics.data.text = 'TextLabel Basics';
    headingBasics.data.textFormat = {font: 'sans-serif', size: 18, bold: true, color: 0x222222};
    addNodeChild(root, headingBasics);

    final labelSansSerif = createTextLabel();
    labelSansSerif.x = 30;
    labelSansSerif.y = 48;
    labelSansSerif.data.text = 'Sans-serif 16px';
    labelSansSerif.data.textFormat = {font: 'sans-serif', size: 16, color: 0x333333};
    addNodeChild(root, labelSansSerif);

    final labelSerif = createTextLabel();
    labelSerif.x = 200;
    labelSerif.y = 48;
    labelSerif.data.text = 'Serif 16px';
    labelSerif.data.textFormat = {font: 'serif', size: 16, color: 0x333333};
    addNodeChild(root, labelSerif);

    final labelMono = createTextLabel();
    labelMono.x = 340;
    labelMono.y = 48;
    labelMono.data.text = 'Monospace 16px';
    labelMono.data.textFormat = {font: 'monospace', size: 16, color: 0x333333};
    addNodeChild(root, labelMono);

    final labelLarge = createTextLabel();
    labelLarge.x = 540;
    labelLarge.y = 40;
    labelLarge.data.text = 'Large 28px';
    labelLarge.data.textFormat = {font: 'sans-serif', size: 28, color: 0x1a6b3c};
    addNodeChild(root, labelLarge);

    final labelSmall = createTextLabel();
    labelSmall.x = 30;
    labelSmall.y = 74;
    labelSmall.data.text = 'Small 12px in a different color';
    labelSmall.data.textFormat = {font: 'sans-serif', size: 12, color: 0x7a0026};
    addNodeChild(root, labelSmall);

    // Section 2: Text alignment — left, center, right aligned text labels.

    final headingAlignment = createTextLabel();
    headingAlignment.x = 30;
    headingAlignment.y = 110;
    headingAlignment.data.text = 'Text Alignment';
    headingAlignment.data.textFormat = {font: 'sans-serif', size: 18, bold: true, color: 0x222222};
    addNodeChild(root, headingAlignment);

    final alignLeft = createRichText();
    alignLeft.x = 30;
    alignLeft.y = 138;
    alignLeft.data.width = 220;
    alignLeft.data.height = 24;
    alignLeft.data.text = 'Left aligned (default)';
    alignLeft.data.defaultTextFormat = {font: 'sans-serif', size: 14, color: 0x444444, align: 'left'};
    alignLeft.data.border = true;
    alignLeft.data.borderColor = 0xcccccc;
    addNodeChild(root, alignLeft);

    final alignCenter = createRichText();
    alignCenter.x = 270;
    alignCenter.y = 138;
    alignCenter.data.width = 220;
    alignCenter.data.height = 24;
    alignCenter.data.text = 'Center aligned';
    alignCenter.data.defaultTextFormat = {font: 'sans-serif', size: 14, color: 0x444444, align: 'center'};
    alignCenter.data.border = true;
    alignCenter.data.borderColor = 0xcccccc;
    addNodeChild(root, alignCenter);

    final alignRight = createRichText();
    alignRight.x = 510;
    alignRight.y = 138;
    alignRight.data.width = 220;
    alignRight.data.height = 24;
    alignRight.data.text = 'Right aligned';
    alignRight.data.defaultTextFormat = {font: 'sans-serif', size: 14, color: 0x444444, align: 'right'};
    alignRight.data.border = true;
    alignRight.data.borderColor = 0xcccccc;
    addNodeChild(root, alignRight);

    // Section 3: RichText with word wrapping — a paragraph of text.

    final headingWrapping = createTextLabel();
    headingWrapping.x = 30;
    headingWrapping.y = 185;
    headingWrapping.data.text = 'Word Wrapping';
    headingWrapping.data.textFormat = {font: 'sans-serif', size: 18, bold: true, color: 0x222222};
    addNodeChild(root, headingWrapping);

    final wrappedText = createRichText();
    wrappedText.x = 30;
    wrappedText.y = 213;
    wrappedText.data.width = 350;
    wrappedText.data.wordWrap = true;
    wrappedText.data.multiline = true;
    wrappedText.data.text = 'Flight is a tree-shakable graphics and application SDK. '
      + 'It spans a scene graph, four interchangeable renderers, '
      + 'offscreen image processing, and a full application layer. '
      + 'This paragraph demonstrates word wrapping within a fixed width.';
    wrappedText.data.defaultTextFormat = {font: 'sans-serif', size: 14, color: 0x444444, leading: 4};
    addNodeChild(root, wrappedText);

    final wrappedSerif = createRichText();
    wrappedSerif.x = 410;
    wrappedSerif.y = 213;
    wrappedSerif.data.width = 320;
    wrappedSerif.data.wordWrap = true;
    wrappedSerif.data.multiline = true;
    wrappedSerif.data.text = 'The same paragraph rendered in serif at a slightly larger size. '
      + 'Each renderable node type is identified by a Kind string, and '
      + 'concrete renderers are registered explicitly by the caller.';
    wrappedSerif.data.defaultTextFormat = {font: 'serif', size: 15, color: 0x555555, leading: 4};
    addNodeChild(root, wrappedSerif);

    // Section 4: Styled text — bold, italic, underline via textFormat properties.

    final headingStyles = createTextLabel();
    headingStyles.x = 30;
    headingStyles.y = 345;
    headingStyles.data.text = 'Text Styles';
    headingStyles.data.textFormat = {font: 'sans-serif', size: 18, bold: true, color: 0x222222};
    addNodeChild(root, headingStyles);

    final styleBold = createTextLabel();
    styleBold.x = 30;
    styleBold.y = 373;
    styleBold.data.text = 'Bold text';
    styleBold.data.textFormat = {font: 'sans-serif', size: 16, bold: true, color: 0x333333};
    addNodeChild(root, styleBold);

    final styleItalic = createTextLabel();
    styleItalic.x = 160;
    styleItalic.y = 373;
    styleItalic.data.text = 'Italic text';
    styleItalic.data.textFormat = {font: 'sans-serif', size: 16, italic: true, color: 0x333333};
    addNodeChild(root, styleItalic);

    final styleBoldItalic = createTextLabel();
    styleBoldItalic.x = 300;
    styleBoldItalic.y = 373;
    styleBoldItalic.data.text = 'Bold + Italic';
    styleBoldItalic.data.textFormat = {font: 'sans-serif', size: 16, bold: true, italic: true, color: 0x333333};
    addNodeChild(root, styleBoldItalic);

    final styleUnderline = createTextLabel();
    styleUnderline.x = 470;
    styleUnderline.y = 373;
    styleUnderline.data.text = 'Underlined text';
    styleUnderline.data.textFormat = {font: 'sans-serif', size: 16, underline: true, color: 0x2255aa};
    addNodeChild(root, styleUnderline);

    final styleLetterSpacing = createTextLabel();
    styleLetterSpacing.x = 30;
    styleLetterSpacing.y = 400;
    styleLetterSpacing.data.text = 'Letter spacing: 4';
    styleLetterSpacing.data.textFormat = {font: 'sans-serif', size: 14, letterSpacing: 4, color: 0x666666};
    addNodeChild(root, styleLetterSpacing);

    final styleSerifBold = createTextLabel();
    styleSerifBold.x = 280;
    styleSerifBold.y = 400;
    styleSerifBold.data.text = 'Serif bold italic';
    styleSerifBold.data.textFormat = {font: 'serif', size: 16, bold: true, italic: true, color: 0x8b4513};
    addNodeChild(root, styleSerifBold);

    final styleMonoBold = createTextLabel();
    styleMonoBold.x = 500;
    styleMonoBold.y = 400;
    styleMonoBold.data.text = 'Mono bold';
    styleMonoBold.data.textFormat = {font: 'monospace', size: 14, bold: true, color: 0x2a6e3f};
    addNodeChild(root, styleMonoBold);

    // Section 5: Text with background and border — RichText with background and border colors.

    final headingBackgrounds = createTextLabel();
    headingBackgrounds.x = 30;
    headingBackgrounds.y = 440;
    headingBackgrounds.data.text = 'Background & Border';
    headingBackgrounds.data.textFormat = {font: 'sans-serif', size: 18, bold: true, color: 0x222222};
    addNodeChild(root, headingBackgrounds);

    final bgLight = createRichText();
    bgLight.x = 30;
    bgLight.y = 468;
    bgLight.data.width = 220;
    bgLight.data.height = 30;
    bgLight.data.text = 'Light background';
    bgLight.data.defaultTextFormat = {font: 'sans-serif', size: 14, color: 0x333333};
    bgLight.data.background = true;
    bgLight.data.backgroundColor = 0xf0f0f0;
    bgLight.data.border = true;
    bgLight.data.borderColor = 0xcccccc;
    addNodeChild(root, bgLight);

    final bgColored = createRichText();
    bgColored.x = 270;
    bgColored.y = 468;
    bgColored.data.width = 220;
    bgColored.data.height = 30;
    bgColored.data.text = 'Colored background';
    bgColored.data.defaultTextFormat = {font: 'sans-serif', size: 14, color: 0xffffff};
    bgColored.data.background = true;
    bgColored.data.backgroundColor = 0x336699;
    bgColored.data.border = true;
    bgColored.data.borderColor = 0x224466;
    addNodeChild(root, bgColored);

    final bgWarning = createRichText();
    bgWarning.x = 510;
    bgWarning.y = 468;
    bgWarning.data.width = 220;
    bgWarning.data.height = 30;
    bgWarning.data.text = 'Warning style';
    bgWarning.data.defaultTextFormat = {font: 'sans-serif', size: 14, bold: true, color: 0x856404};
    bgWarning.data.background = true;
    bgWarning.data.backgroundColor = 0xfff3cd;
    bgWarning.data.border = true;
    bgWarning.data.borderColor = 0xffc107;
    addNodeChild(root, bgWarning);

    final bgMultiline = createRichText();
    bgMultiline.x = 30;
    bgMultiline.y = 515;
    bgMultiline.data.width = 350;
    bgMultiline.data.wordWrap = true;
    bgMultiline.data.multiline = true;
    bgMultiline.data.text = 'A multiline RichText with background and border. '
      + 'Word wrapping is enabled so the text flows within the specified width, '
      + 'and the background and border wrap the content area.';
    bgMultiline.data.defaultTextFormat = {font: 'sans-serif', size: 13, color: 0x333333, leading: 3};
    bgMultiline.data.background = true;
    bgMultiline.data.backgroundColor = 0xeef6ff;
    bgMultiline.data.border = true;
    bgMultiline.data.borderColor = 0x99bbdd;
    addNodeChild(root, bgMultiline);

    final bgCode = createRichText();
    bgCode.x = 410;
    bgCode.y = 515;
    bgCode.data.width = 320;
    bgCode.data.wordWrap = true;
    bgCode.data.multiline = true;
    bgCode.data.text = "const label = createTextLabel();\nlabel.data.text = 'Hello Flight';\nlabel.data.textFormat = { font: 'monospace' };";
    bgCode.data.defaultTextFormat = {font: 'monospace', size: 13, color: 0xd4d4d4};
    bgCode.data.background = true;
    bgCode.data.backgroundColor = 0x1e1e1e;
    bgCode.data.border = true;
    bgCode.data.borderColor = 0x444444;
    addNodeChild(root, bgCode);

    ready = true;
  }

  // Upstream `enterFrame` only re-renders each frame; Lime's `render` override drives that.
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
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
