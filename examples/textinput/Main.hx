// Line-by-line Haxe/Lime port of the upstream `textinput` example (`app.ts`), written directly
// against the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`:
// the browser `./render` module and the `createApplication`/`startApplicationLoop` render loop are
// replaced by Lime's window/render lifecycle, and the Flight app backend is wired with
// `App.setAppBackend(createLimeAppBackend(this))`. The DOM `pointerdown`/`keydown` listeners become
// Lime's `onMouseDown`/`onKeyDown`, and printable characters arrive through Lime's `onTextInput`.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.DisplayObject;
import flighthq.types.KeyboardEventData;
import flighthq.types.RichText;
import flighthq.types.Shape;
import flighthq.types.TextInputState;
import flighthq.types.TextLabel;
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

  final FIELD_WIDTH = 340;
  final FIELD_HEIGHT = 28;
  final FIELD_X = 30;
  final LABEL_X = 30;
  final FIELD_GAP = 70;
  final START_Y = 40;

  var root:DisplayObject;

  // Three editable text fields: normal, numeric-only, and password.
  var normalField:RichText;
  var numericField:RichText;
  var passwordField:RichText;
  var fields:Array<RichText>;
  final fieldNames = ['Normal', 'Numeric Only', 'Password'];

  var normalLabel:TextLabel;
  var numericLabel:TextLabel;
  var passwordLabel:TextLabel;

  // Focus highlight shape (drawn behind the focused field as a colored border).
  var focusHighlight:Shape;

  // HUD text for displaying state information.
  var hudText:TextLabel;

  // Instructions label.
  var instructionsText:TextLabel;

  // Focus tracking -- which field is currently focused.
  var focusedField:RichText = null;

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
      backgroundColor: 0xeeeeeeff,
      contextAttributes: {alpha: false, preserveDrawingBuffer: true},
      sceneGraphSyncPolicy: 'requiresInvalidation',
    });
    registerDefaultGlMaterial(renderState);
    registerRenderer(renderState, ShapeKind, defaultGlShapeRenderer);
    registerRenderer(renderState, TextLabelKind, defaultGlTextLabelRenderer);
    registerRenderer(renderState, RichTextKind, defaultGlRichTextRenderer);
    registerGlShapeCommands(defaultGlShapeCommands);
    enableGlBlendModeSupport(renderState);

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    normalField = createRichText();
    numericField = createRichText();
    passwordField = createRichText();
    fields = [normalField, numericField, passwordField];

    configureField(normalField, START_Y + 22, 'Type here...');
    configureField(numericField, START_Y + FIELD_GAP + 22, '');
    configureField(passwordField, START_Y + FIELD_GAP * 2 + 22, '');

    // Enable text input on each field with appropriate options.
    enableTextInput(normalField);
    enableTextInput(numericField, {restrict: '0-9'});
    enableTextInput(passwordField, {displayAsPassword: true});

    // Labels above each field.
    normalLabel = createFieldLabel('Normal Text Field', START_Y);
    numericLabel = createFieldLabel('Numeric Only (digits 0-9)', START_Y + FIELD_GAP);
    passwordLabel = createFieldLabel('Password Field', START_Y + FIELD_GAP * 2);

    // Focus highlight shape (drawn behind the focused field as a colored border).
    focusHighlight = createShape();

    // HUD text for displaying state information.
    hudText = createTextLabel();
    hudText.x = 30;
    hudText.y = START_Y + FIELD_GAP * 3 + 10;
    hudText.data.textFormat = {font: 'monospace', size: 13, color: 0x333333};
    invalidateNodeLocalTransform(hudText);

    // Instructions label.
    instructionsText = createTextLabel();
    instructionsText.x = 30;
    instructionsText.y = START_Y + FIELD_GAP * 3 + 110;
    instructionsText.data.textFormat = {font: 'sans-serif', size: 12, color: 0x666666};
    instructionsText.data.text =
      'Click a field to focus. Type to enter text.\n' +
      'Arrow keys: move caret | Shift+Arrow: select\n' +
      'Ctrl+A: select all | Ctrl+Z: undo | Ctrl+Y: redo\n' +
      'Backspace/Delete: delete | Ctrl+Backspace: delete word';
    invalidateNodeLocalTransform(instructionsText);

    // Scene graph assembly.
    addNodeChild(root, focusHighlight);
    addNodeChild(root, normalLabel);
    addNodeChild(root, normalField);
    addNodeChild(root, numericLabel);
    addNodeChild(root, numericField);
    addNodeChild(root, passwordLabel);
    addNodeChild(root, passwordField);
    addNodeChild(root, hudText);
    addNodeChild(root, instructionsText);

    // Focus the first field on startup.
    focusField(normalField);

    ready = true;
  }

  function configureField(field:RichText, y:Float, placeholder:String):Void {
    field.x = FIELD_X;
    field.y = y;
    field.data.width = FIELD_WIDTH;
    field.data.height = FIELD_HEIGHT;
    field.data.multiline = false;
    field.data.wordWrap = false;
    field.data.selectable = true;
    field.data.background = true;
    field.data.backgroundColor = 0xffffff;
    field.data.border = true;
    field.data.borderColor = 0x999999;
    field.data.text = placeholder;
    field.data.defaultTextFormat = {font: 'sans-serif', size: 16, color: 0x222222};
  }

  // Labels above each field.
  function createFieldLabel(text:String, y:Float):TextLabel {
    final label = createTextLabel();
    label.x = LABEL_X;
    label.y = y;
    label.data.text = text;
    label.data.textFormat = {font: 'sans-serif', size: 14, color: 0x444444};
    invalidateNodeLocalTransform(label);
    return label;
  }

  function focusField(field:RichText):Void {
    if (focusedField == field) return;
    // Blur previous.
    if (focusedField != null) {
      final prevState = getTextInputState(focusedField);
      if (prevState != null) prevState.focused = false;
      invalidateNodeAppearance(focusedField);
    }
    focusedField = field;
    final state = getTextInputState(field);
    if (state != null) state.focused = true;
    invalidateNodeAppearance(field);
    updateFocusHighlight();
  }

  function blurAll():Void {
    if (focusedField != null) {
      final state = getTextInputState(focusedField);
      if (state != null) state.focused = false;
      invalidateNodeAppearance(focusedField);
    }
    focusedField = null;
    updateFocusHighlight();
  }

  function updateFocusHighlight():Void {
    clearShapeCommands(focusHighlight);
    if (focusedField == null) return;
    final pad = 3;
    appendShapeBeginFill(focusHighlight, 0x3399ff, 0.3);
    appendShapeRectangle(
      focusHighlight,
      focusedField.x - pad,
      focusedField.y - pad,
      FIELD_WIDTH + pad * 2,
      FIELD_HEIGHT + pad * 2
    );
    invalidateNodeAppearance(focusHighlight);
  }

  // Click-to-focus: detect which field was clicked based on bounds. Browser `pointerdown` becomes
  // Lime's `onMouseDown`.
  override public function onMouseDown(x:Float, y:Float, button:Int):Void {
    if (!ready) return;
    var hit = false;
    for (field in fields) {
      if (x >= field.x && x <= field.x + FIELD_WIDTH && y >= field.y && y <= field.y + FIELD_HEIGHT) {
        focusField(field);
        hit = true;
        break;
      }
    }
    if (!hit) blurAll();
  }

  // Keyboard handling: convert Lime's key event to KeyboardEventData for handleTextInputKeyboard.
  function toKeyboardEventData(keyCode:KeyCode, modifier:KeyModifier):KeyboardEventData {
    return {
      altKey: modifier.altKey,
      ctrlKey: modifier.ctrlKey,
      key: keyToString(keyCode),
      keyCode: 0,
      metaKey: modifier.metaKey,
      shiftKey: modifier.shiftKey,
    };
  }

  // Map a Lime KeyCode to the DOM-style `key` string that handleTextInputKeyboard matches on.
  function keyToString(keyCode:KeyCode):String {
    switch (keyCode) {
      case LEFT: return 'ArrowLeft';
      case RIGHT: return 'ArrowRight';
      case UP: return 'ArrowUp';
      case DOWN: return 'ArrowDown';
      case BACKSPACE: return 'Backspace';
      case DELETE: return 'Delete';
      case HOME: return 'Home';
      case END: return 'End';
      case RETURN: return 'Enter';
      case TAB: return 'Tab';
      case ESCAPE: return 'Escape';
      case SPACE: return ' ';
      default:
        final code:Int = keyCode;
        // Lime letter/digit key codes are lowercase ASCII; map them to a single-character key.
        if ((code >= 'a'.code && code <= 'z'.code) || (code >= '0'.code && code <= '9'.code)) {
          return String.fromCharCode(code);
        }
        return '';
    }
  }

  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {
    if (!ready) return;

    // Tab cycles focus between fields (browser: a dedicated keydown listener that prevents default).
    if (keyCode == TAB) {
      if (focusedField != null) {
        final currentIndex = fields.indexOf(focusedField);
        final nextIndex = modifier.shiftKey
          ? (currentIndex - 1 + fields.length) % fields.length
          : (currentIndex + 1) % fields.length;
        focusField(fields[nextIndex]);
      } else {
        focusField(fields[0]);
      }
      return;
    }

    if (focusedField == null) return;

    // Ctrl+Z: undo, Ctrl+Y: redo (handle before the generic keyboard handler since
    // handleTextInputKeyboard does not map these commands).
    if ((modifier.ctrlKey || modifier.metaKey) && !modifier.altKey) {
      if (keyCode == Z) {
        if (modifier.shiftKey) {
          redoTextInput(focusedField);
        } else {
          undoTextInput(focusedField);
        }
        return;
      }
      if (keyCode == Y) {
        redoTextInput(focusedField);
        return;
      }
    }

    final data = toKeyboardEventData(keyCode, modifier);
    final handled = handleTextInputKeyboard(focusedField, data);
    if (handled) {
      return;
    }

    // Printable characters that handleTextInputKeyboard did not consume are inserted through Lime's
    // `onTextInput` callback below.
  }

  // Printable text entry. In the browser this is `insertTextInput(focusedField, e.key)`; Lime
  // surfaces composed text through `onTextInput`.
  override public function onTextInput(text:String):Void {
    if (!ready) return;
    if (focusedField == null) return;
    insertTextInput(focusedField, text);
  }

  function getFieldName(field:RichText):String {
    if (field == null) return 'None';
    final index = fields.indexOf(field);
    return index >= 0 ? fieldNames[index] : 'Unknown';
  }

  function updateHud():Void {
    var text = 'Focus: ' + getFieldName(focusedField);

    if (focusedField != null) {
      final inputState:TextInputState = getTextInputState(focusedField);
      final caretIndex = getTextInputCaretIndex(focusedField);
      final selBegin = getTextInputSelectionBeginIndex(focusedField);
      final selEnd = getTextInputSelectionEndIndex(focusedField);
      final displayText = getTextInputDisplayText(focusedField);
      final rawText:String = focusedField.data.text;

      text += '\nCaret: ' + caretIndex;
      text += '\nSelection: ' + selBegin + ' - ' + selEnd;
      if (selBegin != selEnd) {
        text += ' (' + (selEnd - selBegin) + ' chars)';
      }
      text += '\nChars: ' + rawText.length;
      text += '\nDisplay: "' + displayText + '"';
      if (inputState != null && inputState.restrict.length > 0) {
        text += '\nRestrict: ' + inputState.restrict;
      }
      if (inputState != null && inputState.displayAsPassword) {
        text += '\nPassword mode: on';
      }
    }

    hudText.data.text = text;
    invalidateNodeAppearance(hudText);
  }

  // Upstream render loop, connected to `app.onRender`, driven by Lime's per-frame `update`.
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    updateHud();
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
