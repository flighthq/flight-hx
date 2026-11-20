package flight;

#if (js && flight_esm)
extern inline function createSoftKeyboard():SoftKeyboard {
	return flight._js._fn.Keyboard.createSoftKeyboard();
}
#else
extern inline function createSoftKeyboard():SoftKeyboard {
#if hl
	return flight._hl._fn.Keyboard.createSoftKeyboard();
#elseif cpp
	return flight._cpp._fn.Keyboard.createSoftKeyboard();
#elseif (js && flight_esm)
	return flight._js._fn.Keyboard.createSoftKeyboard();
#else
	#error "flight.Keyboard: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachSoftKeyboard(keyboard:SoftKeyboard):Void {
	flight._js._fn.Keyboard.detachSoftKeyboard(keyboard);
}
#else
extern inline function detachSoftKeyboard(keyboard:SoftKeyboard):Void {
#if hl
	flight._hl._fn.Keyboard.detachSoftKeyboard(keyboard);
#elseif cpp
	flight._cpp._fn.Keyboard.detachSoftKeyboard(keyboard);
#elseif (js && flight_esm)
	flight._js._fn.Keyboard.detachSoftKeyboard(keyboard);
#else
	#error "flight.Keyboard: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeSoftKeyboard(keyboard:SoftKeyboard):Void {
	flight._js._fn.Keyboard.disposeSoftKeyboard(keyboard);
}
#else
extern inline function disposeSoftKeyboard(keyboard:SoftKeyboard):Void {
#if hl
	flight._hl._fn.Keyboard.disposeSoftKeyboard(keyboard);
#elseif cpp
	flight._cpp._fn.Keyboard.disposeSoftKeyboard(keyboard);
#elseif (js && flight_esm)
	flight._js._fn.Keyboard.disposeSoftKeyboard(keyboard);
#else
	#error "flight.Keyboard: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSoftKeyboardHeight(hostSoftKeyboardInfo:HostSoftKeyboardInfoCapability):Float {
	return flight._js._fn.Keyboard.getSoftKeyboardHeight(hostSoftKeyboardInfo);
}
#else
extern inline function getSoftKeyboardHeight(hostSoftKeyboardInfo:HostSoftKeyboardInfoCapability):Float {
#if hl
	return flight._hl._fn.Keyboard.getSoftKeyboardHeight(hostSoftKeyboardInfo);
#elseif cpp
	return flight._cpp._fn.Keyboard.getSoftKeyboardHeight(hostSoftKeyboardInfo);
#elseif (js && flight_esm)
	return flight._js._fn.Keyboard.getSoftKeyboardHeight(hostSoftKeyboardInfo);
#else
	#error "flight.Keyboard: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSoftKeyboardInfo(out:SoftKeyboardInfo, hostSoftKeyboardInfo:HostSoftKeyboardInfoCapability):Void {
	flight._js._fn.Keyboard.getSoftKeyboardInfo(out, hostSoftKeyboardInfo);
}
#else
extern inline function getSoftKeyboardInfo(out:SoftKeyboardInfo, hostSoftKeyboardInfo:HostSoftKeyboardInfoCapability):Void {
#if hl
	flight._hl._fn.Keyboard.getSoftKeyboardInfo(out, hostSoftKeyboardInfo);
#elseif cpp
	flight._cpp._fn.Keyboard.getSoftKeyboardInfo(out, hostSoftKeyboardInfo);
#elseif (js && flight_esm)
	flight._js._fn.Keyboard.getSoftKeyboardInfo(out, hostSoftKeyboardInfo);
#else
	#error "flight.Keyboard: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isSoftKeyboardVisible(hostSoftKeyboardInfo:HostSoftKeyboardInfoCapability):Bool {
	return flight._js._fn.Keyboard.isSoftKeyboardVisible(hostSoftKeyboardInfo);
}
#else
extern inline function isSoftKeyboardVisible(hostSoftKeyboardInfo:HostSoftKeyboardInfoCapability):Bool {
#if hl
	return flight._hl._fn.Keyboard.isSoftKeyboardVisible(hostSoftKeyboardInfo);
#elseif cpp
	return flight._cpp._fn.Keyboard.isSoftKeyboardVisible(hostSoftKeyboardInfo);
#elseif (js && flight_esm)
	return flight._js._fn.Keyboard.isSoftKeyboardVisible(hostSoftKeyboardInfo);
#else
	#error "flight.Keyboard: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSoftKeyboard(ptr:SoftKeyboard):Void {
	flight._js._fn.Keyboard.freeSoftKeyboard(ptr);
}
#else
extern inline function freeSoftKeyboard(ptr:SoftKeyboard):Void {
#if hl
	flight._hl._fn.Keyboard.freeSoftKeyboard(ptr);
#elseif cpp
	flight._cpp._fn.Keyboard.freeSoftKeyboard(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Keyboard.freeSoftKeyboard(ptr);
#else
	#error "flight.Keyboard: no backend for this target."
#end
}
#end
