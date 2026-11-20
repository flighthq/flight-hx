package flight.esm.input;

#if (js && flight_esm)
@:jsRequire("@flighthq/input/contract")
extern class Contract {
  public static final GamepadAxisKind:Dynamic;
  public static final GamepadButtonKind:Dynamic;
  public static final GamepadMapping:Dynamic;
  public static final KeyCode:Dynamic;
  public static final KeyModifier:Dynamic;
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
