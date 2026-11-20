package flight._cpp._fn;

extern class Haptics {
	@:native("flight_cancel_device_vibration")
	public static function cancelDeviceVibration(hostHaptics:flight._cpp.HostHapticsCapability):Bool;
	@:native("flight_get_haptics_capabilities")
	public static function getHapticsCapabilities(out:flight._cpp.HapticsCapabilities, hostHaptics:flight._cpp.HostHapticsCapability):Void;
	@:native("flight_is_haptics_supported")
	public static function isHapticsSupported(hostHaptics:flight._cpp.HostHapticsCapability):Bool;
	@:native("flight_prepare_haptics")
	public static function prepareHaptics(hostHaptics:flight._cpp.HostHapticsCapability):Void;
	@:native("flight_trigger_haptic_impact")
	public static function triggerHapticImpact(hostHaptics:flight._cpp.HostHapticsCapability, style:Int, intensity:Single):Bool;
	@:native("flight_trigger_haptic_notification")
	public static function triggerHapticNotification(hostHaptics:flight._cpp.HostHapticsCapability, type:Int):Bool;
	@:native("flight_trigger_haptic_selection")
	public static function triggerHapticSelection(hostHaptics:flight._cpp.HostHapticsCapability):Bool;
	@:native("flight_vibrate_device")
	public static function vibrateDevice(hostHaptics:flight._cpp.HostHapticsCapability, durationMs:Single):Bool;
	@:native("flight_vibrate_device_pattern")
	public static function vibrateDevicePattern(hostHaptics:flight._cpp.HostHapticsCapability, pattern:cpp.Star<cpp.Void>):Bool;
	@:native("flight_vibrate_device_waveform")
	public static function vibrateDeviceWaveform(hostHaptics:flight._cpp.HostHapticsCapability, timings:cpp.Star<cpp.Void>, amplitudes:cpp.Star<cpp.Void>, repeat:Int):Bool;
}
