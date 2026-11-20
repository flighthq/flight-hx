package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/haptics")
extern class Haptics {
  public static function cancelDeviceVibration(hostHaptics:flight.esm.types.haptics.Types.HostHapticsCapability):Bool;
  public static function getHapticsCapabilities(out:flight.esm.types.haptics.Types.HapticsCapabilities, hostHaptics:flight.esm.types.haptics.Types.HostHapticsCapability):Void;
  public static function isHapticsSupported(hostHaptics:flight.esm.types.haptics.Types.HostHapticsCapability):Bool;
  public static function prepareHaptics(hostHaptics:flight.esm.types.haptics.Types.HostHapticsCapability):Void;
  public static function triggerHapticImpact(hostHaptics:flight.esm.types.haptics.Types.HostHapticsCapability, style:flight.esm.types.haptics.Types.HapticImpactStyle, ?intensity:Null<Float>):Bool;
  public static function triggerHapticNotification(hostHaptics:flight.esm.types.haptics.Types.HostHapticsCapability, type:flight.esm.types.haptics.Types.HapticNotificationType):Bool;
  public static function triggerHapticSelection(hostHaptics:flight.esm.types.haptics.Types.HostHapticsCapability):Bool;
  public static function vibrateDevice(hostHaptics:flight.esm.types.haptics.Types.HostHapticsCapability, durationMs:Float):Bool;
  public static function vibrateDevicePattern(hostHaptics:flight.esm.types.haptics.Types.HostHapticsCapability, pattern:Array<Float>):Bool;
  public static function vibrateDeviceWaveform(hostHaptics:flight.esm.types.haptics.Types.HostHapticsCapability, timings:Array<Float>, amplitudes:Array<Float>, ?repeat:Null<Float>):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
