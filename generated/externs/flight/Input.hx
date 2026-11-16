package flight;

#if (js && flight_esm)
extern inline function attachGamepadInput(hostInputIngress:HostInputIngressCapability, manager:Dynamic, source:InputIngressSource, options:Null<AttachInputOptions>):Void {
	flight._js._fn.Input.attachGamepadInput(hostInputIngress, manager, source, options);
}
#else
extern inline function attachGamepadInput(hostInputIngress:HostInputIngressCapability, manager:Dynamic, source:InputIngressSource, options:AttachInputOptions):Void {
#if hl
	flight._hl._fn.Input.attachGamepadInput(hostInputIngress, manager, source, options);
#elseif cpp
	flight._cpp._fn.Input.attachGamepadInput(hostInputIngress, manager, source, options);
#elseif (js && flight_esm)
	flight._js._fn.Input.attachGamepadInput(hostInputIngress, manager, source, options);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachKeyboardInput(hostInputIngress:HostInputIngressCapability, manager:Dynamic, source:InputIngressSource, options:Null<AttachInputOptions>):Void {
	flight._js._fn.Input.attachKeyboardInput(hostInputIngress, manager, source, options);
}
#else
extern inline function attachKeyboardInput(hostInputIngress:HostInputIngressCapability, manager:Dynamic, source:InputIngressSource, options:AttachInputOptions):Void {
#if hl
	flight._hl._fn.Input.attachKeyboardInput(hostInputIngress, manager, source, options);
#elseif cpp
	flight._cpp._fn.Input.attachKeyboardInput(hostInputIngress, manager, source, options);
#elseif (js && flight_esm)
	flight._js._fn.Input.attachKeyboardInput(hostInputIngress, manager, source, options);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachPointerInput(hostInputIngress:HostInputIngressCapability, manager:Dynamic, source:InputIngressSource, options:Null<AttachInputOptions>):Void {
	flight._js._fn.Input.attachPointerInput(hostInputIngress, manager, source, options);
}
#else
extern inline function attachPointerInput(hostInputIngress:HostInputIngressCapability, manager:Dynamic, source:InputIngressSource, options:AttachInputOptions):Void {
#if hl
	flight._hl._fn.Input.attachPointerInput(hostInputIngress, manager, source, options);
#elseif cpp
	flight._cpp._fn.Input.attachPointerInput(hostInputIngress, manager, source, options);
#elseif (js && flight_esm)
	flight._js._fn.Input.attachPointerInput(hostInputIngress, manager, source, options);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachRelativePointerInput(hostInputIngress:HostInputIngressCapability, manager:Dynamic, source:InputIngressSource, options:Null<AttachInputOptions>):Void {
	flight._js._fn.Input.attachRelativePointerInput(hostInputIngress, manager, source, options);
}
#else
extern inline function attachRelativePointerInput(hostInputIngress:HostInputIngressCapability, manager:Dynamic, source:InputIngressSource, options:AttachInputOptions):Void {
#if hl
	flight._hl._fn.Input.attachRelativePointerInput(hostInputIngress, manager, source, options);
#elseif cpp
	flight._cpp._fn.Input.attachRelativePointerInput(hostInputIngress, manager, source, options);
#elseif (js && flight_esm)
	flight._js._fn.Input.attachRelativePointerInput(hostInputIngress, manager, source, options);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachTextInput(hostInputIngress:HostInputIngressCapability, manager:Dynamic, source:InputIngressSource, options:Null<AttachInputOptions>):Void {
	flight._js._fn.Input.attachTextInput(hostInputIngress, manager, source, options);
}
#else
extern inline function attachTextInput(hostInputIngress:HostInputIngressCapability, manager:Dynamic, source:InputIngressSource, options:AttachInputOptions):Void {
#if hl
	flight._hl._fn.Input.attachTextInput(hostInputIngress, manager, source, options);
#elseif cpp
	flight._cpp._fn.Input.attachTextInput(hostInputIngress, manager, source, options);
#elseif (js && flight_esm)
	flight._js._fn.Input.attachTextInput(hostInputIngress, manager, source, options);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachWheelInput(hostInputIngress:HostInputIngressCapability, manager:Dynamic, source:InputIngressSource, options:Null<AttachInputOptions>):Void {
	flight._js._fn.Input.attachWheelInput(hostInputIngress, manager, source, options);
}
#else
extern inline function attachWheelInput(hostInputIngress:HostInputIngressCapability, manager:Dynamic, source:InputIngressSource, options:AttachInputOptions):Void {
#if hl
	flight._hl._fn.Input.attachWheelInput(hostInputIngress, manager, source, options);
#elseif cpp
	flight._cpp._fn.Input.attachWheelInput(hostInputIngress, manager, source, options);
#elseif (js && flight_esm)
	flight._js._fn.Input.attachWheelInput(hostInputIngress, manager, source, options);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachGamepadInput(manager:Dynamic, source:InputIngressSource):Void {
	flight._js._fn.Input.detachGamepadInput(manager, source);
}
#else
extern inline function detachGamepadInput(manager:Dynamic, source:InputIngressSource):Void {
#if hl
	flight._hl._fn.Input.detachGamepadInput(manager, source);
#elseif cpp
	flight._cpp._fn.Input.detachGamepadInput(manager, source);
#elseif (js && flight_esm)
	flight._js._fn.Input.detachGamepadInput(manager, source);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachKeyboardInput(manager:Dynamic, source:InputIngressSource):Void {
	flight._js._fn.Input.detachKeyboardInput(manager, source);
}
#else
extern inline function detachKeyboardInput(manager:Dynamic, source:InputIngressSource):Void {
#if hl
	flight._hl._fn.Input.detachKeyboardInput(manager, source);
#elseif cpp
	flight._cpp._fn.Input.detachKeyboardInput(manager, source);
#elseif (js && flight_esm)
	flight._js._fn.Input.detachKeyboardInput(manager, source);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachPointerInput(manager:Dynamic, source:InputIngressSource):Void {
	flight._js._fn.Input.detachPointerInput(manager, source);
}
#else
extern inline function detachPointerInput(manager:Dynamic, source:InputIngressSource):Void {
#if hl
	flight._hl._fn.Input.detachPointerInput(manager, source);
#elseif cpp
	flight._cpp._fn.Input.detachPointerInput(manager, source);
#elseif (js && flight_esm)
	flight._js._fn.Input.detachPointerInput(manager, source);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachRelativePointerInput(manager:Dynamic, source:InputIngressSource):Void {
	flight._js._fn.Input.detachRelativePointerInput(manager, source);
}
#else
extern inline function detachRelativePointerInput(manager:Dynamic, source:InputIngressSource):Void {
#if hl
	flight._hl._fn.Input.detachRelativePointerInput(manager, source);
#elseif cpp
	flight._cpp._fn.Input.detachRelativePointerInput(manager, source);
#elseif (js && flight_esm)
	flight._js._fn.Input.detachRelativePointerInput(manager, source);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachTextInput(manager:Dynamic, source:InputIngressSource):Void {
	flight._js._fn.Input.detachTextInput(manager, source);
}
#else
extern inline function detachTextInput(manager:Dynamic, source:InputIngressSource):Void {
#if hl
	flight._hl._fn.Input.detachTextInput(manager, source);
#elseif cpp
	flight._cpp._fn.Input.detachTextInput(manager, source);
#elseif (js && flight_esm)
	flight._js._fn.Input.detachTextInput(manager, source);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachWheelInput(manager:Dynamic, source:InputIngressSource):Void {
	flight._js._fn.Input.detachWheelInput(manager, source);
}
#else
extern inline function detachWheelInput(manager:Dynamic, source:InputIngressSource):Void {
#if hl
	flight._hl._fn.Input.detachWheelInput(manager, source);
#elseif cpp
	flight._cpp._fn.Input.detachWheelInput(manager, source);
#elseif (js && flight_esm)
	flight._js._fn.Input.detachWheelInput(manager, source);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyGamepadAxisDeadZone(value:Float, deadZone:Float):Float {
	return flight._js._fn.Input.applyGamepadAxisDeadZone(value, deadZone);
}
#else
extern inline function applyGamepadAxisDeadZone(value:Float, deadZone:Float):Float {
#if hl
	return flight._hl._fn.Input.applyGamepadAxisDeadZone(value, deadZone);
#elseif cpp
	return flight._cpp._fn.Input.applyGamepadAxisDeadZone(value, deadZone);
#elseif (js && flight_esm)
	return flight._js._fn.Input.applyGamepadAxisDeadZone(value, deadZone);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyGamepadStickDeadZone(out:GamepadStickOutput, x:Float, y:Float, deadZone:Float):Void {
	flight._js._fn.Input.applyGamepadStickDeadZone(out, x, y, deadZone);
}
#else
extern inline function applyGamepadStickDeadZone(out:GamepadStickOutput, x:Float, y:Float, deadZone:Float):Void {
#if hl
	flight._hl._fn.Input.applyGamepadStickDeadZone(out, x, y, deadZone);
#elseif cpp
	flight._cpp._fn.Input.applyGamepadStickDeadZone(out, x, y, deadZone);
#elseif (js && flight_esm)
	flight._js._fn.Input.applyGamepadStickDeadZone(out, x, y, deadZone);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGamepadAxisName(mapping:Dynamic, index:Int):Null<Dynamic> {
	return flight._js._fn.Input.getGamepadAxisName(mapping, index);
}
#else
extern inline function getGamepadAxisName(mapping:flight.GamepadMapping, index:Int):Int {
#if hl
	return flight._hl._fn.Input.getGamepadAxisName(mapping, index);
#elseif cpp
	return flight._cpp._fn.Input.getGamepadAxisName(mapping, index);
#elseif (js && flight_esm)
	return flight._js._fn.Input.getGamepadAxisName(mapping, index);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGamepadButtonName(mapping:Dynamic, index:Int):Null<Dynamic> {
	return flight._js._fn.Input.getGamepadButtonName(mapping, index);
}
#else
extern inline function getGamepadButtonName(mapping:flight.GamepadMapping, index:Int):Int {
#if hl
	return flight._hl._fn.Input.getGamepadButtonName(mapping, index);
#elseif cpp
	return flight._cpp._fn.Input.getGamepadButtonName(mapping, index);
#elseif (js && flight_esm)
	return flight._js._fn.Input.getGamepadButtonName(mapping, index);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createInputManager():Dynamic {
	return flight._js._fn.Input.createInputManager();
}
#else
extern inline function createInputManager():Dynamic {
#if hl
	return flight._hl._fn.Input.createInputManager();
#elseif cpp
	return flight._cpp._fn.Input.createInputManager();
#elseif (js && flight_esm)
	return flight._js._fn.Input.createInputManager();
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createInputState():Dynamic {
	return flight._js._fn.Input.createInputState();
}
#else
extern inline function createInputState():Dynamic {
#if hl
	return flight._hl._fn.Input.createInputState();
#elseif cpp
	return flight._cpp._fn.Input.createInputState();
#elseif (js && flight_esm)
	return flight._js._fn.Input.createInputState();
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function connectInputStateToInputManager(state:Dynamic, manager:Dynamic):InputDisposer {
	return flight._js._fn.Input.connectInputStateToInputManager(state, manager);
}
#else
extern inline function connectInputStateToInputManager(state:Dynamic, manager:Dynamic):InputDisposer {
#if hl
	return flight._hl._fn.Input.connectInputStateToInputManager(state, manager);
#elseif cpp
	return flight._cpp._fn.Input.connectInputStateToInputManager(state, manager);
#elseif (js && flight_esm)
	return flight._js._fn.Input.connectInputStateToInputManager(state, manager);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function endInputStateFrame(state:Dynamic):Void {
	flight._js._fn.Input.endInputStateFrame(state);
}
#else
extern inline function endInputStateFrame(state:Dynamic):Void {
#if hl
	flight._hl._fn.Input.endInputStateFrame(state);
#elseif cpp
	flight._cpp._fn.Input.endInputStateFrame(state);
#elseif (js && flight_esm)
	flight._js._fn.Input.endInputStateFrame(state);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getInputGamepadAxis(state:Dynamic, gamepad:Int, axis:Int):Float {
	return flight._js._fn.Input.getInputGamepadAxis(state, gamepad, axis);
}
#else
extern inline function getInputGamepadAxis(state:Dynamic, gamepad:Int, axis:Int):Float {
#if hl
	return flight._hl._fn.Input.getInputGamepadAxis(state, gamepad, axis);
#elseif cpp
	return flight._cpp._fn.Input.getInputGamepadAxis(state, gamepad, axis);
#elseif (js && flight_esm)
	return flight._js._fn.Input.getInputGamepadAxis(state, gamepad, axis);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isInputGamepadButtonDown(state:Dynamic, gamepad:Int, button:Int):Bool {
	return flight._js._fn.Input.isInputGamepadButtonDown(state, gamepad, button);
}
#else
extern inline function isInputGamepadButtonDown(state:Dynamic, gamepad:Int, button:Int):Bool {
#if hl
	return flight._hl._fn.Input.isInputGamepadButtonDown(state, gamepad, button);
#elseif cpp
	return flight._cpp._fn.Input.isInputGamepadButtonDown(state, gamepad, button);
#elseif (js && flight_esm)
	return flight._js._fn.Input.isInputGamepadButtonDown(state, gamepad, button);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isInputKeyDown(state:Dynamic, keyCode:Int):Bool {
	return flight._js._fn.Input.isInputKeyDown(state, keyCode);
}
#else
extern inline function isInputKeyDown(state:Dynamic, keyCode:Int):Bool {
#if hl
	return flight._hl._fn.Input.isInputKeyDown(state, keyCode);
#elseif cpp
	return flight._cpp._fn.Input.isInputKeyDown(state, keyCode);
#elseif (js && flight_esm)
	return flight._js._fn.Input.isInputKeyDown(state, keyCode);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isInputPointerButtonDown(state:Dynamic, pointerId:Int, button:Int):Bool {
	return flight._js._fn.Input.isInputPointerButtonDown(state, pointerId, button);
}
#else
extern inline function isInputPointerButtonDown(state:Dynamic, pointerId:Int, button:Int):Bool {
#if hl
	return flight._hl._fn.Input.isInputPointerButtonDown(state, pointerId, button);
#elseif cpp
	return flight._cpp._fn.Input.isInputPointerButtonDown(state, pointerId, button);
#elseif (js && flight_esm)
	return flight._js._fn.Input.isInputPointerButtonDown(state, pointerId, button);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function wasInputGamepadButtonPressed(state:Dynamic, gamepad:Int, button:Int):Bool {
	return flight._js._fn.Input.wasInputGamepadButtonPressed(state, gamepad, button);
}
#else
extern inline function wasInputGamepadButtonPressed(state:Dynamic, gamepad:Int, button:Int):Bool {
#if hl
	return flight._hl._fn.Input.wasInputGamepadButtonPressed(state, gamepad, button);
#elseif cpp
	return flight._cpp._fn.Input.wasInputGamepadButtonPressed(state, gamepad, button);
#elseif (js && flight_esm)
	return flight._js._fn.Input.wasInputGamepadButtonPressed(state, gamepad, button);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function wasInputGamepadButtonReleased(state:Dynamic, gamepad:Int, button:Int):Bool {
	return flight._js._fn.Input.wasInputGamepadButtonReleased(state, gamepad, button);
}
#else
extern inline function wasInputGamepadButtonReleased(state:Dynamic, gamepad:Int, button:Int):Bool {
#if hl
	return flight._hl._fn.Input.wasInputGamepadButtonReleased(state, gamepad, button);
#elseif cpp
	return flight._cpp._fn.Input.wasInputGamepadButtonReleased(state, gamepad, button);
#elseif (js && flight_esm)
	return flight._js._fn.Input.wasInputGamepadButtonReleased(state, gamepad, button);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function wasInputKeyPressed(state:Dynamic, keyCode:Int):Bool {
	return flight._js._fn.Input.wasInputKeyPressed(state, keyCode);
}
#else
extern inline function wasInputKeyPressed(state:Dynamic, keyCode:Int):Bool {
#if hl
	return flight._hl._fn.Input.wasInputKeyPressed(state, keyCode);
#elseif cpp
	return flight._cpp._fn.Input.wasInputKeyPressed(state, keyCode);
#elseif (js && flight_esm)
	return flight._js._fn.Input.wasInputKeyPressed(state, keyCode);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function wasInputKeyReleased(state:Dynamic, keyCode:Int):Bool {
	return flight._js._fn.Input.wasInputKeyReleased(state, keyCode);
}
#else
extern inline function wasInputKeyReleased(state:Dynamic, keyCode:Int):Bool {
#if hl
	return flight._hl._fn.Input.wasInputKeyReleased(state, keyCode);
#elseif cpp
	return flight._cpp._fn.Input.wasInputKeyReleased(state, keyCode);
#elseif (js && flight_esm)
	return flight._js._fn.Input.wasInputKeyReleased(state, keyCode);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createInputTargetHandle():Dynamic {
	return flight._js._fn.Input.createInputTargetHandle();
}
#else
extern inline function createInputTargetHandle():Dynamic {
#if hl
	return flight._hl._fn.Input.createInputTargetHandle();
#elseif cpp
	return flight._cpp._fn.Input.createInputTargetHandle();
#elseif (js && flight_esm)
	return flight._js._fn.Input.createInputTargetHandle();
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createInputKeyRepeatTimer(options:InputKeyRepeatOptions):Dynamic {
	return flight._js._fn.Input.createInputKeyRepeatTimer(options);
}
#else
extern inline function createInputKeyRepeatTimer(options:InputKeyRepeatOptions):Dynamic {
#if hl
	return flight._hl._fn.Input.createInputKeyRepeatTimer(options);
#elseif cpp
	return flight._cpp._fn.Input.createInputKeyRepeatTimer(options);
#elseif (js && flight_esm)
	return flight._js._fn.Input.createInputKeyRepeatTimer(options);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function advanceInputKeyRepeatTimer(timer:Dynamic, nowMs:Float):Void {
	flight._js._fn.Input.advanceInputKeyRepeatTimer(timer, nowMs);
}
#else
extern inline function advanceInputKeyRepeatTimer(timer:Dynamic, nowMs:Float):Void {
#if hl
	flight._hl._fn.Input.advanceInputKeyRepeatTimer(timer, nowMs);
#elseif cpp
	flight._cpp._fn.Input.advanceInputKeyRepeatTimer(timer, nowMs);
#elseif (js && flight_esm)
	flight._js._fn.Input.advanceInputKeyRepeatTimer(timer, nowMs);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function startInputKeyRepeatTimer(timer:Dynamic, callback_:InputRepeatCallback, nowMs:Float):Void {
	flight._js._fn.Input.startInputKeyRepeatTimer(timer, callback_, nowMs);
}
#else
extern inline function startInputKeyRepeatTimer(timer:Dynamic, callback_:InputRepeatCallback, nowMs:Float):Void {
#if hl
	flight._hl._fn.Input.startInputKeyRepeatTimer(timer, callback_, nowMs);
#elseif cpp
	flight._cpp._fn.Input.startInputKeyRepeatTimer(timer, callback_, nowMs);
#elseif (js && flight_esm)
	flight._js._fn.Input.startInputKeyRepeatTimer(timer, callback_, nowMs);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function stopInputKeyRepeatTimer(timer:Dynamic):Void {
	flight._js._fn.Input.stopInputKeyRepeatTimer(timer);
}
#else
extern inline function stopInputKeyRepeatTimer(timer:Dynamic):Void {
#if hl
	flight._hl._fn.Input.stopInputKeyRepeatTimer(timer);
#elseif cpp
	flight._cpp._fn.Input.stopInputKeyRepeatTimer(timer);
#elseif (js && flight_esm)
	flight._js._fn.Input.stopInputKeyRepeatTimer(timer);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeInputDisposer(ptr:InputDisposer):Void {
	flight._js._fn.Input.freeInputDisposer(ptr);
}
#else
extern inline function freeInputDisposer(ptr:InputDisposer):Void {
#if hl
	flight._hl._fn.Input.freeInputDisposer(ptr);
#elseif cpp
	flight._cpp._fn.Input.freeInputDisposer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Input.freeInputDisposer(ptr);
#else
	#error "flight.Input: no backend for this target."
#end
}
#end
