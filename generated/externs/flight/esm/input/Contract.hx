package flight.esm.input;

#if (js && flight_esm)
@:jsRequire("@flighthq/input/contract")
extern class Contract {
  public static final GamepadAxisKind:{ StickLeftX:String, StickLeftY:String, StickRightX:String, StickRightY:String };
  public static final GamepadButtonKind:{ ButtonEast:String, ButtonNorth:String, ButtonSouth:String, ButtonWest:String, DpadDown:String, DpadLeft:String, DpadRight:String, DpadUp:String, Home:String, Select:String, ShoulderLeft:String, ShoulderRight:String, Start:String, StickLeft:String, StickRight:String, Touchpad:String, TriggerLeft:String, TriggerRight:String };
  public static final GamepadMapping:{ Standard:String, Raw:String, Unspecified:String };
  public static final KeyCode:{ A:Float, AGAIN:Float, ALT_ERASE:Float, AMPERSAND:Float, APPLICATION:Float, APP_CONTROL_BACK:Float, APP_CONTROL_BOOKMARKS:Float, APP_CONTROL_FORWARD:Float, APP_CONTROL_HOME:Float, APP_CONTROL_REFRESH:Float, APP_CONTROL_SEARCH:Float, APP_CONTROL_STOP:Float, ASTERISK:Float, AT:Float, AUDIO_MUTE:Float, AUDIO_NEXT:Float, AUDIO_PLAY:Float, AUDIO_PREVIOUS:Float, AUDIO_STOP:Float, B:Float, BACKLIGHT_DOWN:Float, BACKLIGHT_TOGGLE:Float, BACKLIGHT_UP:Float, BACKSLASH:Float, BACKSPACE:Float, BRIGHTNESS_DOWN:Float, BRIGHTNESS_UP:Float, C:Float, CALCULATOR:Float, CANCEL:Float, CAPS_LOCK:Float, CARET:Float, CLEAR:Float, CLEAR_AGAIN:Float, COLON:Float, COMMA:Float, COMPUTER:Float, COPY:Float, CRSEL:Float, CURRENCY_SUBUNIT:Float, CURRENCY_UNIT:Float, CUT:Float, D:Float, DECIMAL_SEPARATOR:Float, DELETE:Float, DISPLAY_SWITCH:Float, DOLLAR:Float, DOWN:Float, E:Float, EJECT:Float, END:Float, EQUALS:Float, ESCAPE:Float, EXCLAMATION:Float, EXECUTE:Float, EXSEL:Float, F:Float, F1:Float, F2:Float, F3:Float, F4:Float, F5:Float, F6:Float, F7:Float, F8:Float, F9:Float, F10:Float, F11:Float, F12:Float, F13:Float, F14:Float, F15:Float, F16:Float, F17:Float, F18:Float, F19:Float, F20:Float, F21:Float, F22:Float, F23:Float, F24:Float, FIND:Float, G:Float, GRAVE:Float, GREATER_THAN:Float, H:Float, HASH:Float, HELP:Float, HOME:Float, I:Float, INSERT:Float, J:Float, K:Float, L:Float, LEFT:Float, LEFT_ALT:Float, LEFT_BRACKET:Float, LEFT_CTRL:Float, LEFT_META:Float, LEFT_PARENTHESIS:Float, LEFT_SHIFT:Float, LESS_THAN:Float, M:Float, MAIL:Float, MEDIA_SELECT:Float, MENU:Float, MINUS:Float, MODE:Float, MUTE:Float, N:Float, NUMPAD_0:Float, NUMPAD_00:Float, NUMPAD_000:Float, NUMPAD_1:Float, NUMPAD_2:Float, NUMPAD_3:Float, NUMPAD_4:Float, NUMPAD_5:Float, NUMPAD_6:Float, NUMPAD_7:Float, NUMPAD_8:Float, NUMPAD_9:Float, NUMPAD_A:Float, NUMPAD_AMPERSAND:Float, NUMPAD_AT:Float, NUMPAD_B:Float, NUMPAD_BACKSPACE:Float, NUMPAD_BINARY:Float, NUMPAD_C:Float, NUMPAD_CLEAR:Float, NUMPAD_CLEAR_ENTRY:Float, NUMPAD_COLON:Float, NUMPAD_COMMA:Float, NUMPAD_D:Float, NUMPAD_DECIMAL:Float, NUMPAD_DIVIDE:Float, NUMPAD_DOUBLE_AMPERSAND:Float, NUMPAD_DOUBLE_VERTICAL_BAR:Float, NUMPAD_E:Float, NUMPAD_ENTER:Float, NUMPAD_EQUALS:Float, NUMPAD_EXCLAMATION:Float, NUMPAD_F:Float, NUMPAD_GREATER_THAN:Float, NUMPAD_HASH:Float, NUMPAD_HEXADECIMAL:Float, NUMPAD_LEFT_BRACE:Float, NUMPAD_LEFT_PARENTHESIS:Float, NUMPAD_LESS_THAN:Float, NUMPAD_MEM_ADD:Float, NUMPAD_MEM_CLEAR:Float, NUMPAD_MEM_DIVIDE:Float, NUMPAD_MEM_MULTIPLY:Float, NUMPAD_MEM_RECALL:Float, NUMPAD_MEM_STORE:Float, NUMPAD_MEM_SUBTRACT:Float, NUMPAD_MINUS:Float, NUMPAD_MULTIPLY:Float, NUMPAD_OCTAL:Float, NUMPAD_PERCENT:Float, NUMPAD_PERIOD:Float, NUMPAD_PLUS:Float, NUMPAD_PLUS_MINUS:Float, NUMPAD_POWER:Float, NUMPAD_RIGHT_BRACE:Float, NUMPAD_RIGHT_PARENTHESIS:Float, NUMPAD_SPACE:Float, NUMPAD_TAB:Float, NUMPAD_VERTICAL_BAR:Float, NUMPAD_XOR:Float, NUM_LOCK:Float, NUMBER_0:Float, NUMBER_1:Float, NUMBER_2:Float, NUMBER_3:Float, NUMBER_4:Float, NUMBER_5:Float, NUMBER_6:Float, NUMBER_7:Float, NUMBER_8:Float, NUMBER_9:Float, O:Float, OPER:Float, OUT:Float, P:Float, PAGE_DOWN:Float, PAGE_UP:Float, PASTE:Float, PAUSE:Float, PERCENT:Float, PERIOD:Float, PLUS:Float, POWER:Float, PRINT_SCREEN:Float, PRIOR:Float, Q:Float, QUESTION:Float, QUOTE:Float, R:Float, RETURN:Float, RETURN2:Float, RIGHT:Float, RIGHT_ALT:Float, RIGHT_BRACKET:Float, RIGHT_CTRL:Float, RIGHT_META:Float, RIGHT_PARENTHESIS:Float, RIGHT_SHIFT:Float, S:Float, SCROLL_LOCK:Float, SELECT:Float, SEMICOLON:Float, SEPARATOR:Float, SINGLE_QUOTE:Float, SLASH:Float, SLEEP:Float, SPACE:Float, STOP:Float, SYSTEM_REQUEST:Float, T:Float, TAB:Float, THOUSAND_SEPARATOR:Float, U:Float, UNDO:Float, UNDERSCORE:Float, UNKNOWN:Float, UP:Float, V:Float, VOLUME_DOWN:Float, VOLUME_UP:Float, W:Float, WWW:Float, X:Float, Y:Float, Z:Float };
  public static final KeyModifier:{ ALT:Float, CAPS_LOCK:Float, CTRL:Float, LEFT_ALT:Float, LEFT_CTRL:Float, LEFT_META:Float, LEFT_SHIFT:Float, META:Float, MODE:Float, NONE:Float, NUM_LOCK:Float, RIGHT_ALT:Float, RIGHT_CTRL:Float, RIGHT_META:Float, RIGHT_SHIFT:Float, SHIFT:Float };
  public static function advanceInputKeyRepeatTimer(timer:flight.esm.types.input.Types.InputKeyRepeatTimerRaw, nowMs:Float):Void;
  public static function applyGamepadAxisDeadZone(value:Float, deadZone:Float):Float;
  public static function applyGamepadStickDeadZone(out:flight.esm.types.input.Types.GamepadStickOutput, x:Float, y:Float, deadZone:Float):Void;
  public static function attachGamepadInput(hostInputIngress:flight.esm.types.input.Types.HostInputIngressCapability, manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource, ?options:Null<flight.esm.types.input.Types.AttachInputOptions>):Void;
  public static function attachKeyboardInput(hostInputIngress:flight.esm.types.input.Types.HostInputIngressCapability, manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource, ?options:Null<flight.esm.types.input.Types.AttachInputOptions>):Void;
  public static function attachPointerInput(hostInputIngress:flight.esm.types.input.Types.HostInputIngressCapability, manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource, ?options:Null<flight.esm.types.input.Types.AttachInputOptions>):Void;
  public static function attachRelativePointerInput(hostInputIngress:flight.esm.types.input.Types.HostInputIngressCapability, manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource, ?options:Null<flight.esm.types.input.Types.AttachInputOptions>):Void;
  public static function attachTextInput(hostInputIngress:flight.esm.types.input.Types.HostInputIngressCapability, manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource, ?options:Null<flight.esm.types.input.Types.AttachInputOptions>):Void;
  public static function attachWheelInput(hostInputIngress:flight.esm.types.input.Types.HostInputIngressCapability, manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource, ?options:Null<flight.esm.types.input.Types.AttachInputOptions>):Void;
  public static function connectInputStateToInputManager(state:flight.esm.types.input.Types.InputStateRaw, manager:flight.esm.types.input.Types.InputManagerRaw):flight.esm.types.input.Types.InputDisposer;
  public static function createInputKeyRepeatTimer(options:flight.esm.types.input.Types.InputKeyRepeatOptions):flight.esm.types.input.Types.InputKeyRepeatTimerRaw;
  public static function createInputManager():flight.esm.types.input.Types.InputManagerRaw;
  public static function createInputSignals():flight.esm.types.input.Types.InputSignalsRaw;
  public static function createInputState():flight.esm.types.input.Types.InputStateRaw;
  public static function createInputTargetHandle():flight.esm.types.input.Types.InputTargetHandleRaw;
  public static function detachGamepadInput(manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource):Void;
  public static function detachKeyboardInput(manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource):Void;
  public static function detachPointerInput(manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource):Void;
  public static function detachRelativePointerInput(manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource):Void;
  public static function detachTextInput(manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource):Void;
  public static function detachWheelInput(manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource):Void;
  public static function endInputStateFrame(state:flight.esm.types.input.Types.InputStateRaw):Void;
  public static function getGamepadAxisKindString(value:flight.esm.types.input.Types.GamepadAxisKind):String;
  public static function getGamepadAxisName(mapping:flight.esm.types.input.Types.GamepadMapping, index:Float):Null<String>;
  public static function getGamepadButtonKindString(value:flight.esm.types.input.Types.GamepadButtonKind):String;
  public static function getGamepadButtonName(mapping:flight.esm.types.input.Types.GamepadMapping, index:Float):Null<String>;
  public static function getGamepadMappingString(value:flight.esm.types.input.Types.GamepadMapping):String;
  public static function getInputGamepadAxis(state:flight.esm.types.input.Types.InputStateRaw, gamepad:Float, axis:Float):Float;
  public static function getInputPointerLockExitReasonString(value:flight.esm.types.input.Types.InputPointerLockExitReason):String;
  public static function getInputPointerLockRequestReasonString(value:flight.esm.types.input.Types.InputPointerLockRequestReason):String;
  public static function getMouseWheelModeString(value:flight.esm.types.input.Types.MouseWheelMode):String;
  public static function getPointerTypeString(value:flight.esm.types.input.Types.PointerType):String;
  public static function initializeInputKeyRepeatTimer(out:flight.esm.types.input.Types.InputKeyRepeatTimerRaw, options:flight.esm.types.input.Types.InputKeyRepeatOptions):Void;
  public static function initializeInputManager(out:flight.esm.types.input.Types.InputManagerRaw):Void;
  public static function initializeInputSignals(out:flight.esm.types.input.Types.InputSignalsRaw):Void;
  public static function initializeInputState(out:flight.esm.types.input.Types.InputStateRaw):Void;
  public static function initializeInputTargetHandle(_out:flight.esm.types.input.Types.InputTargetHandleRaw):Void;
  public static function isInputGamepadButtonDown(state:flight.esm.types.input.Types.InputStateRaw, gamepad:Float, button:Float):Bool;
  public static function isInputKeyDown(state:flight.esm.types.input.Types.InputStateRaw, keyCode:Float):Bool;
  public static function isInputPointerButtonDown(state:flight.esm.types.input.Types.InputStateRaw, pointerId:Float, button:Float):Bool;
  public static function parseGamepadAxisKind(value:String):Null<String>;
  public static function parseGamepadButtonKind(value:String):Null<String>;
  public static function parseGamepadMapping(value:String):Null<String>;
  public static function parseInputPointerLockExitReason(value:String):Null<String>;
  public static function parseInputPointerLockRequestReason(value:String):Null<String>;
  public static function parseMouseWheelMode(value:String):Null<String>;
  public static function parsePointerType(value:String):Null<String>;
  public static function startInputKeyRepeatTimer(timer:flight.esm.types.input.Types.InputKeyRepeatTimerRaw, callback_:flight.esm.types.input.Types.InputRepeatCallback, nowMs:Float):Void;
  public static function stopInputKeyRepeatTimer(timer:flight.esm.types.input.Types.InputKeyRepeatTimerRaw):Void;
  public static function wasInputGamepadButtonPressed(state:flight.esm.types.input.Types.InputStateRaw, gamepad:Float, button:Float):Bool;
  public static function wasInputGamepadButtonReleased(state:flight.esm.types.input.Types.InputStateRaw, gamepad:Float, button:Float):Bool;
  public static function wasInputKeyPressed(state:flight.esm.types.input.Types.InputStateRaw, keyCode:Float):Bool;
  public static function wasInputKeyReleased(state:flight.esm.types.input.Types.InputStateRaw, keyCode:Float):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
