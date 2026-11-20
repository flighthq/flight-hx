package flight._cpp._fn;

extern class Device {
	@:native("flight_get_device_capabilities")
	public static function getDeviceCapabilities(out:flight._cpp.DeviceCapabilities, hostDevice:flight._cpp.HostDeviceCapability):Void;
	@:native("flight_get_device_display_metrics")
	public static function getDeviceDisplayMetrics(out:flight._cpp.DeviceDisplayMetrics, hostDevice:flight._cpp.HostDeviceCapability):Void;
	@:native("flight_get_device_id")
	public static function getDeviceId(hostDevice:flight._cpp.HostDeviceCapability):cpp.ConstCharStar;
	@:native("flight_get_device_info")
	public static function getDeviceInfo(out:flight._cpp.DeviceInfo, hostDevice:flight._cpp.HostDeviceCapability):Void;
	@:native("flight_get_safe_area_insets")
	public static function getSafeAreaInsets(out:flight._cpp.SafeAreaInsets, hostDevice:flight._cpp.HostDeviceCapability):Void;
	@:native("flight_refresh_device_info")
	public static function refreshDeviceInfo(hostDevice:flight._cpp.HostDeviceCapability):Void;
	@:native("flight_free_device_capabilities")
	public static function freeDeviceCapabilities(ptr:flight._cpp.DeviceCapabilities):Void;
	@:native("flight_free_device_display_metrics")
	public static function freeDeviceDisplayMetrics(ptr:flight._cpp.DeviceDisplayMetrics):Void;
	@:native("flight_free_device_info")
	public static function freeDeviceInfo(ptr:flight._cpp.DeviceInfo):Void;
	@:native("flight_free_safe_area_insets")
	public static function freeSafeAreaInsets(ptr:flight._cpp.SafeAreaInsets):Void;
}
