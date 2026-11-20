package flight._hl._fn;

extern class Haptics {
	@:hlNative("flight", "flight_cancel_device_vibration")
	public static function cancelDeviceVibration(hostHaptics:flight._hl.HostHapticsCapability):Bool;
	@:hlNative("flight", "flight_get_haptics_capabilities")
	public static function getHapticsCapabilities(out:flight._hl.HapticsCapabilities, hostHaptics:flight._hl.HostHapticsCapability):Void;
	@:hlNative("flight", "flight_is_haptics_supported")
	public static function isHapticsSupported(hostHaptics:flight._hl.HostHapticsCapability):Bool;
	@:hlNative("flight", "flight_prepare_haptics")
	public static function prepareHaptics(hostHaptics:flight._hl.HostHapticsCapability):Void;
	@:hlNative("flight", "flight_trigger_haptic_impact")
	public static function triggerHapticImpact(hostHaptics:flight._hl.HostHapticsCapability, style:Int, intensity:Single):Bool;
	@:hlNative("flight", "flight_trigger_haptic_notification")
	public static function triggerHapticNotification(hostHaptics:flight._hl.HostHapticsCapability, type:Int):Bool;
	@:hlNative("flight", "flight_trigger_haptic_selection")
	public static function triggerHapticSelection(hostHaptics:flight._hl.HostHapticsCapability):Bool;
	@:hlNative("flight", "flight_vibrate_device")
	public static function vibrateDevice(hostHaptics:flight._hl.HostHapticsCapability, durationMs:Single):Bool;
	@:hlNative("flight", "flight_vibrate_device_pattern")
	public static function vibrateDevicePattern(hostHaptics:flight._hl.HostHapticsCapability, pattern:hl.Bytes):Bool;
	@:hlNative("flight", "flight_vibrate_device_waveform")
	public static function vibrateDeviceWaveform(hostHaptics:flight._hl.HostHapticsCapability, timings:hl.Bytes, amplitudes:hl.Bytes, repeat:Int):Bool;
}
