package flight;

#if (js && flight_esm)
extern inline function cancelDeviceVibration(hostHaptics:HostHapticsCapability):Bool {
	return flight._js._fn.Haptics.cancelDeviceVibration(hostHaptics);
}
#else
extern inline function cancelDeviceVibration(hostHaptics:HostHapticsCapability):Bool {
#if hl
	return flight._hl._fn.Haptics.cancelDeviceVibration(hostHaptics);
#elseif cpp
	return flight._cpp._fn.Haptics.cancelDeviceVibration(hostHaptics);
#elseif (js && flight_esm)
	return flight._js._fn.Haptics.cancelDeviceVibration(hostHaptics);
#else
	#error "flight.Haptics: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getHapticsCapabilities(out:HapticsCapabilities, hostHaptics:HostHapticsCapability):Void {
	flight._js._fn.Haptics.getHapticsCapabilities(out, hostHaptics);
}
#else
extern inline function getHapticsCapabilities(out:HapticsCapabilities, hostHaptics:HostHapticsCapability):Void {
#if hl
	flight._hl._fn.Haptics.getHapticsCapabilities(out, hostHaptics);
#elseif cpp
	flight._cpp._fn.Haptics.getHapticsCapabilities(out, hostHaptics);
#elseif (js && flight_esm)
	flight._js._fn.Haptics.getHapticsCapabilities(out, hostHaptics);
#else
	#error "flight.Haptics: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isHapticsSupported(hostHaptics:HostHapticsCapability):Bool {
	return flight._js._fn.Haptics.isHapticsSupported(hostHaptics);
}
#else
extern inline function isHapticsSupported(hostHaptics:HostHapticsCapability):Bool {
#if hl
	return flight._hl._fn.Haptics.isHapticsSupported(hostHaptics);
#elseif cpp
	return flight._cpp._fn.Haptics.isHapticsSupported(hostHaptics);
#elseif (js && flight_esm)
	return flight._js._fn.Haptics.isHapticsSupported(hostHaptics);
#else
	#error "flight.Haptics: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function prepareHaptics(hostHaptics:HostHapticsCapability):Void {
	flight._js._fn.Haptics.prepareHaptics(hostHaptics);
}
#else
extern inline function prepareHaptics(hostHaptics:HostHapticsCapability):Void {
#if hl
	flight._hl._fn.Haptics.prepareHaptics(hostHaptics);
#elseif cpp
	flight._cpp._fn.Haptics.prepareHaptics(hostHaptics);
#elseif (js && flight_esm)
	flight._js._fn.Haptics.prepareHaptics(hostHaptics);
#else
	#error "flight.Haptics: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function triggerHapticImpact(hostHaptics:HostHapticsCapability, style:Dynamic, intensity:Null<Float>):Bool {
	return flight._js._fn.Haptics.triggerHapticImpact(hostHaptics, style, intensity);
}
#else
extern inline function triggerHapticImpact(hostHaptics:HostHapticsCapability, style:flight.HapticImpactStyle, intensity:Float):Bool {
#if hl
	return flight._hl._fn.Haptics.triggerHapticImpact(hostHaptics, style, intensity);
#elseif cpp
	return flight._cpp._fn.Haptics.triggerHapticImpact(hostHaptics, style, intensity);
#elseif (js && flight_esm)
	return flight._js._fn.Haptics.triggerHapticImpact(hostHaptics, style, intensity);
#else
	#error "flight.Haptics: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function triggerHapticNotification(hostHaptics:HostHapticsCapability, type:Dynamic):Bool {
	return flight._js._fn.Haptics.triggerHapticNotification(hostHaptics, type);
}
#else
extern inline function triggerHapticNotification(hostHaptics:HostHapticsCapability, type:flight.HapticNotificationType):Bool {
#if hl
	return flight._hl._fn.Haptics.triggerHapticNotification(hostHaptics, type);
#elseif cpp
	return flight._cpp._fn.Haptics.triggerHapticNotification(hostHaptics, type);
#elseif (js && flight_esm)
	return flight._js._fn.Haptics.triggerHapticNotification(hostHaptics, type);
#else
	#error "flight.Haptics: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function triggerHapticSelection(hostHaptics:HostHapticsCapability):Bool {
	return flight._js._fn.Haptics.triggerHapticSelection(hostHaptics);
}
#else
extern inline function triggerHapticSelection(hostHaptics:HostHapticsCapability):Bool {
#if hl
	return flight._hl._fn.Haptics.triggerHapticSelection(hostHaptics);
#elseif cpp
	return flight._cpp._fn.Haptics.triggerHapticSelection(hostHaptics);
#elseif (js && flight_esm)
	return flight._js._fn.Haptics.triggerHapticSelection(hostHaptics);
#else
	#error "flight.Haptics: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function vibrateDevice(hostHaptics:HostHapticsCapability, durationMs:Float):Bool {
	return flight._js._fn.Haptics.vibrateDevice(hostHaptics, durationMs);
}
#else
extern inline function vibrateDevice(hostHaptics:HostHapticsCapability, durationMs:Float):Bool {
#if hl
	return flight._hl._fn.Haptics.vibrateDevice(hostHaptics, durationMs);
#elseif cpp
	return flight._cpp._fn.Haptics.vibrateDevice(hostHaptics, durationMs);
#elseif (js && flight_esm)
	return flight._js._fn.Haptics.vibrateDevice(hostHaptics, durationMs);
#else
	#error "flight.Haptics: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function vibrateDevicePattern(hostHaptics:HostHapticsCapability, pattern:Dynamic):Bool {
	return flight._js._fn.Haptics.vibrateDevicePattern(hostHaptics, pattern);
}
#else
extern inline function vibrateDevicePattern(hostHaptics:HostHapticsCapability, pattern:Dynamic):Bool {
#if hl
	return flight._hl._fn.Haptics.vibrateDevicePattern(hostHaptics, pattern);
#elseif cpp
	return flight._cpp._fn.Haptics.vibrateDevicePattern(hostHaptics, pattern);
#elseif (js && flight_esm)
	return flight._js._fn.Haptics.vibrateDevicePattern(hostHaptics, pattern);
#else
	#error "flight.Haptics: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function vibrateDeviceWaveform(hostHaptics:HostHapticsCapability, timings:Dynamic, amplitudes:Dynamic, repeat:Null<Int>):Bool {
	return flight._js._fn.Haptics.vibrateDeviceWaveform(hostHaptics, timings, amplitudes, repeat);
}
#else
extern inline function vibrateDeviceWaveform(hostHaptics:HostHapticsCapability, timings:Dynamic, amplitudes:Dynamic, repeat:Int):Bool {
#if hl
	return flight._hl._fn.Haptics.vibrateDeviceWaveform(hostHaptics, timings, amplitudes, repeat);
#elseif cpp
	return flight._cpp._fn.Haptics.vibrateDeviceWaveform(hostHaptics, timings, amplitudes, repeat);
#elseif (js && flight_esm)
	return flight._js._fn.Haptics.vibrateDeviceWaveform(hostHaptics, timings, amplitudes, repeat);
#else
	#error "flight.Haptics: no backend for this target."
#end
}
#end
