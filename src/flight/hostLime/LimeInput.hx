package flight.hostLime;

#if lime
import flight.types.InputGamepadAxisData;
import flight.types.InputGamepadButtonData;
import flight.types.InputGamepadConnectData;
import flight.types.InputKeyboardData;
import flight.types.InputManager;
import flight.types.InputPointerData;
import haxe.ds.ObjectMap;
import lime.system.System;
import lime.ui.Gamepad;
import lime.ui.GamepadAxis;
import lime.ui.GamepadButton;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;
import lime.ui.MouseButton;
import lime.ui.MouseWheelMode;
import lime.ui.Touch;
import lime.ui.Window;

/** Explicit, disposable Lime event ingress for Flight's InputManager. */
class LimeInput {
  /**
   * Attaches window-local pointer, keyboard, text, and wheel input.
   *
   * Touch events are global in Lime and do not retain their originating
   * window. Attach touch on only one binding in a multi-window app, or provide
   * `touchFilter` to route Lime touch-device ids yourself. Gamepads are also
   * application-global and opt-in to avoid duplicate delivery.
   */
  public static function attachLimeInput(window:Window, manager:InputManager,
      ?options:{?touch:Bool, ?touchFilter:Touch->Bool, ?gamepads:Bool}):Void->Void {
    final binding = new LimeInputBinding(window, manager, options == null ? null : options.touchFilter);
    binding.attachWindow();
    if (options == null || options.touch != false) binding.attachTouch();
    if (options != null && options.gamepads == true) binding.attachGamepads();
    return binding.dispose;
  }

  /** Adds application-global Lime gamepad events to an existing binding. */
  public static function attachLimeGamepadInput(manager:InputManager):Void->Void {
    final binding = new LimeInputBinding(null, manager, null);
    binding.attachGamepads();
    return binding.dispose;
  }
}

private class LimeInputBinding {
  final window:Null<Window>;
  final manager:InputManager;
  final touchFilter:Null<Touch->Bool>;
  final downKeys = new Map<Int, Bool>();
  final gamepads:Array<Gamepad> = [];
  final gamepadHandlers = new ObjectMap<Gamepad, LimeGamepadHandlers>();
  final activeTouches = new Map<Int, Bool>();
  var disposed = false;
  var touchAttached = false;
  var gamepadsAttached = false;
  var buttons = 0;
  var mouseX = 0.0;
  var mouseY = 0.0;
  var modifiers:KeyModifier = KeyModifier.NONE;
  var primaryTouch = -1;

  public function new(window:Null<Window>, manager:InputManager, touchFilter:Null<Touch->Bool>) {
    this.window = window;
    this.manager = manager;
    this.touchFilter = touchFilter;
  }

  public function attachWindow():Void {
    if (window == null) return;
    window.onKeyDown.add(onKeyDown);
    window.onKeyUp.add(onKeyUp);
    window.onMouseDown.add(onMouseDown);
    window.onMouseMove.add(onMouseMove);
    window.onMouseMoveRelative.add(onMouseMoveRelative);
    window.onMouseUp.add(onMouseUp);
    window.onMouseWheel.add(onMouseWheel);
    window.onTextEdit.add(onTextEdit);
    window.onTextInput.add(onTextInput);
  }

  public function attachTouch():Void {
    if (window == null || touchAttached) return;
    touchAttached = true;
    Touch.onStart.add(onTouchStart);
    Touch.onMove.add(onTouchMove);
    Touch.onEnd.add(onTouchEnd);
    Touch.onCancel.add(onTouchCancel);
  }

  public function attachGamepads():Void {
    if (gamepadsAttached) return;
    gamepadsAttached = true;
    Gamepad.onConnect.add(onGamepadConnect);
    for (gamepad in Gamepad.devices) connectGamepad(gamepad);
  }

  public function dispose():Void {
    if (disposed) return;
    disposed = true;
    if (window != null) {
      window.onKeyDown.remove(onKeyDown);
      window.onKeyUp.remove(onKeyUp);
      window.onMouseDown.remove(onMouseDown);
      window.onMouseMove.remove(onMouseMove);
      window.onMouseMoveRelative.remove(onMouseMoveRelative);
      window.onMouseUp.remove(onMouseUp);
      window.onMouseWheel.remove(onMouseWheel);
      window.onTextEdit.remove(onTextEdit);
      window.onTextInput.remove(onTextInput);
    }
    if (touchAttached) {
      Touch.onStart.remove(onTouchStart);
      Touch.onMove.remove(onTouchMove);
      Touch.onEnd.remove(onTouchEnd);
      Touch.onCancel.remove(onTouchCancel);
    }
    if (gamepadsAttached) Gamepad.onConnect.remove(onGamepadConnect);
    for (gamepad in gamepads.copy()) disconnectGamepad(gamepad, false);
    gamepads.resize(0);
    activeTouches.clear();
    downKeys.clear();
  }

  function onKeyDown(code:KeyCode, modifier:KeyModifier):Void {
    modifiers = modifier;
    final value:Int = code;
    final repeat = downKeys.exists(value);
    downKeys.set(value, true);
    if (!manager.enabled) return;
    flight.Signals.emitSignal(manager.onKeyDown, keyboardData(code, modifier, repeat));
  }

  function onKeyUp(code:KeyCode, modifier:KeyModifier):Void {
    modifiers = modifier;
    downKeys.remove((code : Int));
    if (!manager.enabled) return;
    flight.Signals.emitSignal(manager.onKeyUp, keyboardData(code, modifier, false));
  }

  function onMouseDown(x:Float, y:Float, button:MouseButton):Void {
    mouseX = x;
    mouseY = y;
    buttons |= mouseButtonMask(button);
    if (!manager.enabled) return;
    flight.Signals.emitSignal(manager.onPointerDown, pointerData(x, y, button, buttons, 'mouse', 0, 0, 0, 0.5, true));
  }

  function onMouseMove(x:Float, y:Float):Void {
    mouseX = x;
    mouseY = y;
    if (!manager.enabled) return;
    flight.Signals.emitSignal(manager.onPointerMove,
      pointerData(x, y, 0, buttons, 'mouse', 0, 0, 0, buttons == 0 ? 0 : 0.5, true));
  }

  function onMouseMoveRelative(x:Float, y:Float):Void {
    if (!manager.enabled) return;
    flight.Signals.emitSignal(manager.onPointerMoveRelative,
      pointerData(mouseX, mouseY, 0, buttons, 'mouse', 0, x, y, buttons == 0 ? 0 : 0.5, true));
  }

  function onMouseUp(x:Float, y:Float, button:Int):Void {
    mouseX = x;
    mouseY = y;
    buttons &= ~mouseButtonMask(button);
    if (!manager.enabled) return;
    flight.Signals.emitSignal(manager.onPointerUp, pointerData(x, y, button, buttons, 'mouse', 0, 0, 0, 0, true));
  }

  function onMouseWheel(deltaX:Float, deltaY:Float, mode:MouseWheelMode):Void {
    if (!manager.enabled) return;
    final data = pointerData(mouseX, mouseY, 0, buttons, 'mouse', 0, deltaX, deltaY, 0, true);
    data.wheelMode = switch (mode) {
      case PIXELS: 'pixels';
      case LINES: 'lines';
      case PAGES: 'pages';
      case UNKNOWN: 'unknown';
    };
    flight.Signals.emitSignal(manager.onWheel, data);
  }

  function onTextEdit(text:String, _start:Int, _length:Int):Void {
    if (manager.enabled) flight.Signals.emitSignal(manager.onTextEdit, {text: text, isComposing: true});
  }

  function onTextInput(text:String):Void {
    if (manager.enabled) flight.Signals.emitSignal(manager.onTextInput, {text: text, isComposing: false});
  }

  function onTouchStart(touch:Touch):Void {
    if (!ownsTouch(touch)) return;
    if (primaryTouch < 0) primaryTouch = touch.id;
    activeTouches.set(touch.id, true);
    if (!manager.enabled) return;
    flight.Signals.emitSignal(manager.onPointerDown, touchData(touch, primaryTouch == touch.id, true));
  }

  function onTouchMove(touch:Touch):Void {
    if (!ownsTouch(touch) || !manager.enabled) return;
    flight.Signals.emitSignal(manager.onPointerMove, touchData(touch, primaryTouch == touch.id, true));
  }

  function onTouchEnd(touch:Touch):Void {
    if (!ownsTouch(touch)) return;
    if (manager.enabled) flight.Signals.emitSignal(manager.onPointerUp, touchData(touch, primaryTouch == touch.id, false));
    releaseTouch(touch.id);
  }

  function onTouchCancel(touch:Touch):Void {
    if (!ownsTouch(touch)) return;
    if (manager.enabled) flight.Signals.emitSignal(manager.onPointerCancel, touchData(touch, primaryTouch == touch.id, false));
    releaseTouch(touch.id);
  }

  function ownsTouch(touch:Touch):Bool return window != null && (touchFilter == null || touchFilter(touch));

  function releaseTouch(id:Int):Void {
    activeTouches.remove(id);
    if (primaryTouch != id) return;
    primaryTouch = -1;
    for (active in activeTouches.keys()) {
      primaryTouch = active;
      break;
    }
  }

  function touchData(touch:Touch, primary:Bool, active:Bool):InputPointerData {
    final target = window;
    final width = target == null ? 0 : target.width;
    final height = target == null ? 0 : target.height;
    return pointerData(touch.x * width, touch.y * height, 0, active ? 1 : 0, 'touch', touch.id + 1,
      touch.dx * width, touch.dy * height, active ? touch.pressure : 0, primary);
  }

  function onGamepadConnect(gamepad:Gamepad):Void connectGamepad(gamepad);

  function connectGamepad(gamepad:Gamepad):Void {
    if (gamepads.indexOf(gamepad) >= 0) return;
    gamepads.push(gamepad);
    final handlers:LimeGamepadHandlers = {
      axis: onGamepadAxis.bind(gamepad),
      buttonDown: onGamepadButtonDown.bind(gamepad),
      buttonUp: onGamepadButtonUp.bind(gamepad),
      disconnect: onGamepadDisconnect.bind(gamepad),
    };
    gamepadHandlers.set(gamepad, handlers);
    gamepad.onAxisMove.add(handlers.axis);
    gamepad.onButtonDown.add(handlers.buttonDown);
    gamepad.onButtonUp.add(handlers.buttonUp);
    gamepad.onDisconnect.add(handlers.disconnect);
    if (manager.enabled) flight.Signals.emitSignal(manager.onGamepadConnect, gamepadConnectData(gamepad));
  }

  function disconnectGamepad(gamepad:Gamepad, emit:Bool):Void {
    final index = gamepads.indexOf(gamepad);
    if (index < 0) return;
    gamepads.splice(index, 1);
    final handlers = gamepadHandlers.get(gamepad);
    if (handlers != null) {
      gamepad.onAxisMove.remove(handlers.axis);
      gamepad.onButtonDown.remove(handlers.buttonDown);
      gamepad.onButtonUp.remove(handlers.buttonUp);
      gamepad.onDisconnect.remove(handlers.disconnect);
      gamepadHandlers.remove(gamepad);
    }
    if (emit && manager.enabled) flight.Signals.emitSignal(manager.onGamepadDisconnect, gamepadConnectData(gamepad));
  }

  function onGamepadDisconnect(gamepad:Gamepad):Void disconnectGamepad(gamepad, true);

  function onGamepadAxis(gamepad:Gamepad, axis:GamepadAxis, value:Float):Void {
    if (!manager.enabled) return;
    final data:InputGamepadAxisData = {
      gamepad: gamepad.id,
      axis: (axis : Int),
      value: value,
      timeStamp: now(),
    };
    flight.Signals.emitSignal(manager.onGamepadAxisMove, data);
  }

  function onGamepadButtonDown(gamepad:Gamepad, button:GamepadButton):Void emitGamepadButton(gamepad, button, 1);

  function onGamepadButtonUp(gamepad:Gamepad, button:GamepadButton):Void emitGamepadButton(gamepad, button, 0);

  function emitGamepadButton(gamepad:Gamepad, button:GamepadButton, value:Float):Void {
    if (!manager.enabled) return;
    final data:InputGamepadButtonData = {
      gamepad: gamepad.id,
      button: (button : Int),
      value: value,
      timeStamp: now(),
    };
    flight.Signals.emitSignal(value > 0 ? manager.onGamepadButtonDown : manager.onGamepadButtonUp, data);
  }

  static function gamepadConnectData(gamepad:Gamepad):InputGamepadConnectData return {
    gamepad: gamepad.id,
    id: gamepad.name == null ? '' : gamepad.name,
    mapping: 'standard',
  };

  function keyboardData(code:KeyCode, modifier:KeyModifier, repeat:Bool):InputKeyboardData return {
    altKey: modifier.altKey,
    capsLock: modifier.capsLock,
    code: domCode(code),
    ctrlKey: modifier.ctrlKey,
    key: domKey(code, modifier),
    keyCode: (code : Int),
    location: keyLocation(code),
    metaKey: modifier.metaKey,
    modifier: (modifier : Int),
    numLock: modifier.numLock,
    repeat: repeat,
    shiftKey: modifier.shiftKey,
    timeStamp: now(),
  };

  function pointerData(x:Float, y:Float, button:Float, buttonState:Int, pointerType:String, pointerId:Float,
      deltaX:Float, deltaY:Float, pressure:Float, primary:Bool):InputPointerData return {
    altKey: modifiers.altKey,
    button: button,
    buttons: buttonState,
    ctrlKey: modifiers.ctrlKey,
    deltaX: deltaX,
    deltaY: deltaY,
    height: 1,
    isPrimary: primary,
    metaKey: modifiers.metaKey,
    pointerId: pointerId,
    pointerType: pointerType,
    pressure: pressure,
    shiftKey: modifiers.shiftKey,
    tiltX: 0,
    tiltY: 0,
    timeStamp: now(),
    twist: 0,
    wheelMode: 'unknown',
    width: 1,
    x: x,
    y: y,
  };

  static function mouseButtonMask(button:Int):Int return switch (button) {
    case 0: 1;
    case 1: 4;
    case 2: 2;
    default: 0;
  };

  static function domKey(code:KeyCode, modifier:KeyModifier):String {
    final value:Int = code;
    if (value >= 0x20 && value <= 0x7E) {
      final char = String.fromCharCode(value);
      if (value >= 0x61 && value <= 0x7A) {
        return modifier.shiftKey != modifier.capsLock ? char.toUpperCase() : char;
      }
      if (!modifier.shiftKey) return char;
      return switch (char) {
        case '1': '!';
        case '2': '@';
        case '3': '#';
        case '4': '$';
        case '5': '%';
        case '6': '^';
        case '7': '&';
        case '8': '*';
        case '9': '(';
        case '0': ')';
        case '-': '_';
        case '=': '+';
        case '[': '{';
        case ']': '}';
        case '\\': '|';
        case ';': ':';
        case "'": '"';
        case ',': '<';
        case '.': '>';
        case '/': '?';
        case '`': '~';
        default: char;
      };
    }
    return switch (code) {
      case BACKSPACE: 'Backspace';
      case TAB: 'Tab';
      case RETURN, NUMPAD_ENTER: 'Enter';
      case ESCAPE: 'Escape';
      case DELETE: 'Delete';
      case INSERT: 'Insert';
      case HOME: 'Home';
      case END: 'End';
      case PAGE_UP: 'PageUp';
      case PAGE_DOWN: 'PageDown';
      case LEFT: 'ArrowLeft';
      case RIGHT: 'ArrowRight';
      case UP: 'ArrowUp';
      case DOWN: 'ArrowDown';
      case LEFT_SHIFT, RIGHT_SHIFT: 'Shift';
      case LEFT_CTRL, RIGHT_CTRL: 'Control';
      case LEFT_ALT, RIGHT_ALT: 'Alt';
      case LEFT_META, RIGHT_META: 'Meta';
      default: 'Unidentified';
    };
  }

  static function domCode(code:KeyCode):String {
    final value:Int = code;
    if (value >= 0x61 && value <= 0x7A) return 'Key' + String.fromCharCode(value - 32);
    if (value >= 0x30 && value <= 0x39) return 'Digit' + String.fromCharCode(value);
    return switch (code) {
      case BACKSPACE: 'Backspace';
      case TAB: 'Tab';
      case RETURN: 'Enter';
      case NUMPAD_ENTER: 'NumpadEnter';
      case ESCAPE: 'Escape';
      case SPACE: 'Space';
      case DELETE: 'Delete';
      case INSERT: 'Insert';
      case HOME: 'Home';
      case END: 'End';
      case PAGE_UP: 'PageUp';
      case PAGE_DOWN: 'PageDown';
      case LEFT: 'ArrowLeft';
      case RIGHT: 'ArrowRight';
      case UP: 'ArrowUp';
      case DOWN: 'ArrowDown';
      case LEFT_SHIFT: 'ShiftLeft';
      case RIGHT_SHIFT: 'ShiftRight';
      case LEFT_CTRL: 'ControlLeft';
      case RIGHT_CTRL: 'ControlRight';
      case LEFT_ALT: 'AltLeft';
      case RIGHT_ALT: 'AltRight';
      case LEFT_META: 'MetaLeft';
      case RIGHT_META: 'MetaRight';
      default: '';
    };
  }

  static function keyLocation(code:KeyCode):Float return switch (code) {
    case LEFT_SHIFT, LEFT_CTRL, LEFT_ALT, LEFT_META: 1;
    case RIGHT_SHIFT, RIGHT_CTRL, RIGHT_ALT, RIGHT_META: 2;
    case NUMPAD_0, NUMPAD_1, NUMPAD_2, NUMPAD_3, NUMPAD_4, NUMPAD_5, NUMPAD_6, NUMPAD_7, NUMPAD_8,
      NUMPAD_9, NUMPAD_ENTER, NUMPAD_DIVIDE, NUMPAD_MULTIPLY, NUMPAD_MINUS, NUMPAD_PLUS, NUMPAD_PERIOD: 3;
    default: 0;
  };

  static inline function now():Float return System.getTimer();
}

private typedef LimeGamepadHandlers = {
  var axis:GamepadAxis->Float->Void;
  var buttonDown:GamepadButton->Void;
  var buttonUp:GamepadButton->Void;
  var disconnect:Void->Void;
}
#end
