// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

inline function applyGamepadAxisDeadZone(value:Float, deadZone:Float):Float {
  return flight._cpp._fn.Input.applyGamepadAxisDeadZone(value, deadZone);
}

extern inline function createInputManager():flight.InputManager {
  return flight._cpp._fn.Input.createInputManager();
}

extern inline function createInputSignals():flight.InputSignals {
  return flight._cpp._fn.Input.createInputSignals();
}

extern inline function createInputState():flight.InputState {
  return flight._cpp._fn.Input.createInputState();
}

extern inline function endInputStateFrame(state:flight.InputState):Void {
  flight._cpp._fn.Input.endInputStateFrame(state);
}

extern inline function getInputGamepadAxis(state:flight.InputState, gamepad:Float, axis:Float):Float {
  return flight._cpp._fn.Input.getInputGamepadAxis(state, gamepad, axis);
}

extern inline function isInputGamepadButtonDown(state:flight.InputState, gamepad:Float, button:Float):Bool {
  return flight._cpp._fn.Input.isInputGamepadButtonDown(state, gamepad, button);
}

extern inline function isInputKeyDown(state:flight.InputState, keyCode:Float):Bool {
  return flight._cpp._fn.Input.isInputKeyDown(state, keyCode);
}

extern inline function isInputPointerButtonDown(state:flight.InputState, pointerId:Float, button:Float):Bool {
  return flight._cpp._fn.Input.isInputPointerButtonDown(state, pointerId, button);
}

extern inline function wasInputGamepadButtonPressed(state:flight.InputState, gamepad:Float, button:Float):Bool {
  return flight._cpp._fn.Input.wasInputGamepadButtonPressed(state, gamepad, button);
}

extern inline function wasInputGamepadButtonReleased(state:flight.InputState, gamepad:Float, button:Float):Bool {
  return flight._cpp._fn.Input.wasInputGamepadButtonReleased(state, gamepad, button);
}

extern inline function wasInputKeyPressed(state:flight.InputState, keyCode:Float):Bool {
  return flight._cpp._fn.Input.wasInputKeyPressed(state, keyCode);
}

extern inline function wasInputKeyReleased(state:flight.InputState, keyCode:Float):Bool {
  return flight._cpp._fn.Input.wasInputKeyReleased(state, keyCode);
}

extern inline function applyGamepadStickDeadZone(out:{ x:Float, y:Float }, x:Float, y:Float, deadZone:Float):Void {
  flight._cpp._attempt.Attempt_Input_applyGamepadStickDeadZone.applyGamepadStickDeadZone(out, x, y, deadZone);
}

extern inline function attachGamepadInput(hostInputIngress:flight.HostInputIngressCapability, manager:flight.InputManager, source:flight.InputIngressSource, ?options:flight.AttachInputOptions):Void {
  flight._cpp._attempt.Attempt_Input_attachGamepadInput.attachGamepadInput(hostInputIngress, manager, source, options);
}

extern inline function attachKeyboardInput(hostInputIngress:flight.HostInputIngressCapability, manager:flight.InputManager, source:flight.InputIngressSource, ?options:flight.AttachInputOptions):Void {
  flight._cpp._attempt.Attempt_Input_attachKeyboardInput.attachKeyboardInput(hostInputIngress, manager, source, options);
}

extern inline function attachPointerInput(hostInputIngress:flight.HostInputIngressCapability, manager:flight.InputManager, source:flight.InputIngressSource, ?options:flight.AttachInputOptions):Void {
  flight._cpp._attempt.Attempt_Input_attachPointerInput.attachPointerInput(hostInputIngress, manager, source, options);
}

extern inline function attachRelativePointerInput(hostInputIngress:flight.HostInputIngressCapability, manager:flight.InputManager, source:flight.InputIngressSource, ?options:flight.AttachInputOptions):Void {
  flight._cpp._attempt.Attempt_Input_attachRelativePointerInput.attachRelativePointerInput(hostInputIngress, manager, source, options);
}

extern inline function attachTextInput(hostInputIngress:flight.HostInputIngressCapability, manager:flight.InputManager, source:flight.InputIngressSource, ?options:flight.AttachInputOptions):Void {
  flight._cpp._attempt.Attempt_Input_attachTextInput.attachTextInput(hostInputIngress, manager, source, options);
}

extern inline function attachWheelInput(hostInputIngress:flight.HostInputIngressCapability, manager:flight.InputManager, source:flight.InputIngressSource, ?options:flight.AttachInputOptions):Void {
  flight._cpp._attempt.Attempt_Input_attachWheelInput.attachWheelInput(hostInputIngress, manager, source, options);
}

extern inline function connectInputStateToInputManager(state:flight.InputState, manager:flight.InputManager):()->Void {
  return flight._cpp._attempt.Attempt_Input_connectInputStateToInputManager.connectInputStateToInputManager(state, manager);
}

extern inline function createInputKeyRepeatTimer(options:flight.InputKeyRepeatOptions):flight.InputKeyRepeatTimer {
  return flight._cpp._attempt.Attempt_Input_createInputKeyRepeatTimer.createInputKeyRepeatTimer(options);
}

extern inline function detachGamepadInput(manager:flight.InputManager, source:flight.InputIngressSource):Void {
  flight._cpp._attempt.Attempt_Input_detachGamepadInput.detachGamepadInput(manager, source);
}

extern inline function detachKeyboardInput(manager:flight.InputManager, source:flight.InputIngressSource):Void {
  flight._cpp._attempt.Attempt_Input_detachKeyboardInput.detachKeyboardInput(manager, source);
}

extern inline function detachPointerInput(manager:flight.InputManager, source:flight.InputIngressSource):Void {
  flight._cpp._attempt.Attempt_Input_detachPointerInput.detachPointerInput(manager, source);
}

extern inline function detachRelativePointerInput(manager:flight.InputManager, source:flight.InputIngressSource):Void {
  flight._cpp._attempt.Attempt_Input_detachRelativePointerInput.detachRelativePointerInput(manager, source);
}

extern inline function detachTextInput(manager:flight.InputManager, source:flight.InputIngressSource):Void {
  flight._cpp._attempt.Attempt_Input_detachTextInput.detachTextInput(manager, source);
}

extern inline function detachWheelInput(manager:flight.InputManager, source:flight.InputIngressSource):Void {
  flight._cpp._attempt.Attempt_Input_detachWheelInput.detachWheelInput(manager, source);
}

extern inline function getGamepadAxisName(mapping:flight.GamepadMappingKind, index:Float):Null<flight.GamepadAxisKind> {
  return flight._cpp._attempt.Attempt_Input_getGamepadAxisName.getGamepadAxisName(mapping, index);
}

extern inline function getGamepadButtonName(mapping:flight.GamepadMappingKind, index:Float):Null<flight.GamepadButtonKind> {
  return flight._cpp._attempt.Attempt_Input_getGamepadButtonName.getGamepadButtonName(mapping, index);
}

extern inline function initializeInputKeyRepeatTimer(out:flight.EntityConstruction<flight.InputKeyRepeatTimer>, options:flight.InputKeyRepeatOptions):Void {
  flight._cpp._attempt.Attempt_Input_initializeInputKeyRepeatTimer.initializeInputKeyRepeatTimer(out, options);
}

extern inline function initializeInputManager(out:flight.EntityConstruction<flight.InputManager>):Void {
  flight._cpp._attempt.Attempt_Input_initializeInputManager.initializeInputManager(out);
}

extern inline function initializeInputSignals(out:flight.EntityConstruction<flight.InputSignals>):Void {
  flight._cpp._attempt.Attempt_Input_initializeInputSignals.initializeInputSignals(out);
}

extern inline function initializeInputState(out:flight.EntityConstruction<flight.InputState>):Void {
  flight._cpp._attempt.Attempt_Input_initializeInputState.initializeInputState(out);
}
