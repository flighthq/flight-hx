package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/device")
extern class Device {
  public static function createDeviceCapabilities():flight.esm.types.device.Types.DeviceCapabilities;
  public static function createDeviceDisplayMetrics():flight.esm.types.device.Types.DeviceDisplayMetrics;
  public static function createDeviceInfo():flight.esm.types.device.Types.DeviceInfo;
  public static function createSafeAreaInsets():flight.esm.types.device.Types.SafeAreaInsets;
  public static function getDeviceCapabilities(hostDevice:flight.esm.types.device.Types.HostDeviceCapability, out:flight.esm.types.device.Types.DeviceCapabilities):Void;
  public static function getDeviceDisplayMetrics(hostDevice:flight.esm.types.device.Types.HostDeviceCapability, out:flight.esm.types.device.Types.DeviceDisplayMetrics):Void;
  public static function getDeviceId(hostDevice:flight.esm.types.device.Types.HostDeviceCapability):String;
  public static function getDeviceInfo(hostDevice:flight.esm.types.device.Types.HostDeviceCapability, out:flight.esm.types.device.Types.DeviceInfo):Void;
  public static function getSafeAreaInsets(hostDevice:flight.esm.types.device.Types.HostDeviceCapability, out:flight.esm.types.device.Types.SafeAreaInsets):Void;
  public static function refreshDeviceInfo(hostDevice:flight.esm.types.device.Types.HostDeviceCapability):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
