package flight.esm.types.input;

#if (js && flight_esm)
typedef AttachInputOptions = { ?preventDefault:Null<Bool> };

typedef GamepadAxisKind = String;

typedef GamepadButtonKind = String;

typedef GamepadMapping = String;

typedef GamepadStickOutput = { x:Float, y:Float };

typedef HostInputCapabilities = { ?dropFile:Null<flight.esm.types.input.Types.HostInputDropFileCapability>, ?focus:Null<flight.esm.types.input.Types.HostInputFocusCapability>, ?ingress:Null<flight.esm.types.input.Types.HostInputIngressCapability>, ?pointerLock:Null<flight.esm.types.input.Types.HostInputPointerLockCapability>, ?target:Null<flight.esm.types.input.Types.HostInputTargetCapability> };

typedef HostInputDropFileCapability = { provider:Dynamic, subscribe:((arg0:flight.esm.types.input.Types.InputTargetHandleRaw, arg1:Dynamic) -> flight.esm.types.input.Types.InputIngressRelease) };

typedef HostInputFocusCapability = { provider:Dynamic, subscribe:((arg0:flight.esm.types.input.Types.InputTargetHandleRaw, arg1:Dynamic, arg2:Dynamic) -> flight.esm.types.input.Types.InputIngressRelease) };

typedef HostInputIngressCapability = { provider:Dynamic, attachGamepad:flight.esm.types.input.Types.InputIngressAttach, attachKeyboard:flight.esm.types.input.Types.InputIngressAttach, attachPointer:flight.esm.types.input.Types.InputIngressAttach, attachRelativePointer:flight.esm.types.input.Types.InputIngressAttach, attachText:flight.esm.types.input.Types.InputIngressAttach, attachWheel:flight.esm.types.input.Types.InputIngressAttach };

typedef HostInputPointerLockCapability = { provider:Dynamic, exit:(() -> flight.esm.types.input.Types.InputPointerLockExitFuture), request:((arg0:flight.esm.types.input.Types.InputTargetHandleRaw) -> flight.esm.types.input.Types.InputPointerLockRequestFuture) };

typedef HostInputTargetCapability = { provider:Dynamic, prepare:((arg0:flight.esm.types.input.Types.InputTargetHandleRaw) -> Void) };

typedef InputDisposer = (() -> Void);

typedef InputGamepadAxisData = { axis:Float, gamepad:Float, timeStamp:Float, value:Float };

typedef InputGamepadButtonData = { button:Float, gamepad:Float, timeStamp:Float, value:Float };

typedef InputGamepadConnectData = { gamepad:Float, id:String, mapping:flight.esm.types.input.Types.GamepadMapping };

typedef InputIngressAttach = ((arg0:flight.esm.types.host.Types.InputIngressSource, arg1:flight.esm.types.input.Types.InputIngressSink, ?arg2:Null<flight.esm.types.input.Types.AttachInputOptions>) -> flight.esm.types.input.Types.InputIngressRelease);

typedef InputIngressRelease = (() -> Void);

typedef InputIngressSink = { gamepadAxisMove:((arg0:flight.esm.types.input.Types.InputGamepadAxisData) -> Void), gamepadButtonDown:((arg0:flight.esm.types.input.Types.InputGamepadButtonData) -> Void), gamepadButtonUp:((arg0:flight.esm.types.input.Types.InputGamepadButtonData) -> Void), gamepadConnect:((arg0:flight.esm.types.input.Types.InputGamepadConnectData) -> Void), gamepadDisconnect:((arg0:flight.esm.types.input.Types.InputGamepadConnectData) -> Void), isEnabled:(() -> Bool), keyDown:((arg0:flight.esm.types.input.Types.InputKeyboardData) -> Void), keyUp:((arg0:flight.esm.types.input.Types.InputKeyboardData) -> Void), pointerCancel:((arg0:flight.esm.types.input.Types.InputPointerData) -> Void), pointerDown:((arg0:flight.esm.types.input.Types.InputPointerData) -> Void), pointerMove:((arg0:flight.esm.types.input.Types.InputPointerData) -> Void), pointerMoveRelative:((arg0:flight.esm.types.input.Types.InputPointerData) -> Void), pointerUp:((arg0:flight.esm.types.input.Types.InputPointerData) -> Void), textEdit:((arg0:flight.esm.types.input.Types.InputTextData) -> Void), textInput:((arg0:flight.esm.types.input.Types.InputTextData) -> Void), wheel:((arg0:flight.esm.types.input.Types.InputPointerData) -> Void) };

typedef InputKeyRepeatOptions = { delay:Float, interval:Float };

typedef InputKeyRepeatTimerRaw = Dynamic;

typedef InputKeyboardData = { altKey:Bool, capsLock:Bool, code:String, ctrlKey:Bool, key:String, keyCode:Float, location:Float, metaKey:Bool, modifier:Float, numLock:Bool, repeat:Bool, shiftKey:Bool, timeStamp:Float };

typedef InputManagerRaw = { enabled:Bool, onGamepadAxisMove:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputGamepadAxisData>, onGamepadButtonDown:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputGamepadButtonData>, onGamepadButtonUp:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputGamepadButtonData>, onGamepadConnect:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputGamepadConnectData>, onGamepadDisconnect:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputGamepadConnectData>, onKeyDown:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputKeyboardData>, onKeyUp:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputKeyboardData>, onPointerCancel:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData>, onPointerDown:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData>, onPointerMove:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData>, onPointerMoveRelative:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData>, onPointerUp:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData>, onTextEdit:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputTextData>, onTextInput:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputTextData>, onWheel:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData> };

typedef InputPointerData = { altKey:Bool, button:Float, buttons:Float, ctrlKey:Bool, deltaX:Float, deltaY:Float, height:Float, isPrimary:Bool, metaKey:Bool, pointerId:Float, pointerType:flight.esm.types.input.Types.PointerType, pressure:Float, shiftKey:Bool, tiltX:Float, tiltY:Float, timeStamp:Float, twist:Float, wheelMode:flight.esm.types.input.Types.MouseWheelMode, width:Float, x:Float, y:Float };

typedef InputPointerLockExitFuture = { then:Dynamic, finally:((?onfinally:Dynamic) -> js.lib.Promise<flight.esm.types.input.Types.InputPointerLockExitOutcome>) };

typedef InputPointerLockExitOutcome = { reason:flight.esm.types.input.Types.InputPointerLockExitReason };

typedef InputPointerLockExitReason = String;

typedef InputPointerLockRequestFuture = { then:Dynamic, finally:((?onfinally:Dynamic) -> js.lib.Promise<flight.esm.types.input.Types.InputPointerLockRequestOutcome>) };

typedef InputPointerLockRequestOutcome = { reason:flight.esm.types.input.Types.InputPointerLockRequestReason };

typedef InputPointerLockRequestReason = String;

typedef InputRepeatCallback = (() -> Void);

typedef InputSignalsRaw = { onGamepadAxisMove:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputGamepadAxisData>, onGamepadButtonDown:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputGamepadButtonData>, onGamepadButtonUp:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputGamepadButtonData>, onGamepadConnect:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputGamepadConnectData>, onGamepadDisconnect:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputGamepadConnectData>, onKeyDown:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputKeyboardData>, onKeyUp:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputKeyboardData>, onPointerCancel:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData>, onPointerDown:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData>, onPointerMove:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData>, onPointerMoveRelative:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData>, onPointerUp:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData>, onTextEdit:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputTextData>, onTextInput:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputTextData>, onWheel:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData> };

typedef InputStateRaw = { axisValues:js.lib.Map<Float, Float>, gamepadButtonsDown:js.lib.Set<Float>, justPressedGamepadButtons:js.lib.Set<Float>, justPressedKeys:js.lib.Set<Float>, justReleasedGamepadButtons:js.lib.Set<Float>, justReleasedKeys:js.lib.Set<Float>, keysDown:js.lib.Set<Float>, pointerButtonsDown:js.lib.Map<Float, Float> };

typedef InputTargetHandleRaw = Dynamic;

typedef InputTextData = { isComposing:Bool, text:String };

typedef KeyCode = Float;

typedef KeyModifier = Float;

typedef MouseWheelMode = String;

typedef PointerType = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
