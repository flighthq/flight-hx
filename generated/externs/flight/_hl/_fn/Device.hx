package flight._hl._fn;

extern class Device {
	@:hlNative("flight", "flight_get_device_capabilities")
	public static function getDeviceCapabilities(out:flight._hl.DeviceCapabilities, hostDevice:flight._hl.HostDeviceCapability):Void;
	@:hlNative("flight", "flight_get_device_display_metrics")
	public static function getDeviceDisplayMetrics(out:flight._hl.DeviceDisplayMetrics, hostDevice:flight._hl.HostDeviceCapability):Void;
	@:hlNative("flight", "flight_get_device_id")
	public static function getDeviceId(hostDevice:flight._hl.HostDeviceCapability):hl.Bytes;
	@:hlNative("flight", "flight_get_device_info")
	public static function getDeviceInfo(out:flight._hl.DeviceInfo, hostDevice:flight._hl.HostDeviceCapability):Void;
	@:hlNative("flight", "flight_get_safe_area_insets")
	public static function getSafeAreaInsets(out:flight._hl.SafeAreaInsets, hostDevice:flight._hl.HostDeviceCapability):Void;
	@:hlNative("flight", "flight_refresh_device_info")
	public static function refreshDeviceInfo(hostDevice:flight._hl.HostDeviceCapability):Void;
	@:hlNative("flight", "flight_free_device_capabilities")
	public static function freeDeviceCapabilities(ptr:flight._hl.DeviceCapabilities):Void;
	@:hlNative("flight", "flight_free_device_display_metrics")
	public static function freeDeviceDisplayMetrics(ptr:flight._hl.DeviceDisplayMetrics):Void;
	@:hlNative("flight", "flight_free_device_info")
	public static function freeDeviceInfo(ptr:flight._hl.DeviceInfo):Void;
	@:hlNative("flight", "flight_free_safe_area_insets")
	public static function freeSafeAreaInsets(ptr:flight._hl.SafeAreaInsets):Void;
}
