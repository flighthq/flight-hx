package flight._js._fn;

@:jsRequire("@flighthq/haptics")
extern class Haptics {
	@:native("cancelDeviceVibration")
	public static function cancelDeviceVibration(hostHaptics:flight._js.HostHapticsCapability):Bool;
	@:native("getHapticsCapabilities")
	public static function getHapticsCapabilities(out:flight._js.HapticsCapabilities, hostHaptics:flight._js.HostHapticsCapability):Void;
	@:native("isHapticsSupported")
	public static function isHapticsSupported(hostHaptics:flight._js.HostHapticsCapability):Bool;
	@:native("prepareHaptics")
	public static function prepareHaptics(hostHaptics:flight._js.HostHapticsCapability):Void;
	@:native("triggerHapticImpact")
	public static function triggerHapticImpact(hostHaptics:flight._js.HostHapticsCapability, style:Dynamic, intensity:Null<Float>):Bool;
	@:native("triggerHapticNotification")
	public static function triggerHapticNotification(hostHaptics:flight._js.HostHapticsCapability, type:Dynamic):Bool;
	@:native("triggerHapticSelection")
	public static function triggerHapticSelection(hostHaptics:flight._js.HostHapticsCapability):Bool;
	@:native("vibrateDevice")
	public static function vibrateDevice(hostHaptics:flight._js.HostHapticsCapability, durationMs:Float):Bool;
	@:native("vibrateDevicePattern")
	public static function vibrateDevicePattern(hostHaptics:flight._js.HostHapticsCapability, pattern:Dynamic):Bool;
	@:native("vibrateDeviceWaveform")
	public static function vibrateDeviceWaveform(hostHaptics:flight._js.HostHapticsCapability, timings:Dynamic, amplitudes:Dynamic, repeat:Null<Int>):Bool;
}
