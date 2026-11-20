package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/input")
extern class Input {
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
  public static function createInputState():flight.esm.types.input.Types.InputStateRaw;
  public static function createInputTargetHandle():flight.esm.types.input.Types.InputTargetHandleRaw;
  public static function detachGamepadInput(manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource):Void;
  public static function detachKeyboardInput(manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource):Void;
  public static function detachPointerInput(manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource):Void;
  public static function detachRelativePointerInput(manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource):Void;
  public static function detachTextInput(manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource):Void;
  public static function detachWheelInput(manager:flight.esm.types.input.Types.InputManagerRaw, source:flight.esm.types.host.Types.InputIngressSource):Void;
  public static function endInputStateFrame(state:flight.esm.types.input.Types.InputStateRaw):Void;
  public static function getGamepadAxisName(mapping:flight.esm.types.input.Types.GamepadMapping, index:Float):Null<String>;
  public static function getGamepadButtonName(mapping:flight.esm.types.input.Types.GamepadMapping, index:Float):Null<String>;
  public static function getInputGamepadAxis(state:flight.esm.types.input.Types.InputStateRaw, gamepad:Float, axis:Float):Float;
  public static function isInputGamepadButtonDown(state:flight.esm.types.input.Types.InputStateRaw, gamepad:Float, button:Float):Bool;
  public static function isInputKeyDown(state:flight.esm.types.input.Types.InputStateRaw, keyCode:Float):Bool;
  public static function isInputPointerButtonDown(state:flight.esm.types.input.Types.InputStateRaw, pointerId:Float, button:Float):Bool;
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
