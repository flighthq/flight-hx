package flight._js._fn;

@:jsRequire("@flighthq/device")
extern class Device {
	@:native("getDeviceCapabilities")
	public static function getDeviceCapabilities(out:flight._js.DeviceCapabilities, hostDevice:flight._js.HostDeviceCapability):Void;
	@:native("getDeviceDisplayMetrics")
	public static function getDeviceDisplayMetrics(out:flight._js.DeviceDisplayMetrics, hostDevice:flight._js.HostDeviceCapability):Void;
	@:native("getDeviceId")
	public static function getDeviceId(hostDevice:flight._js.HostDeviceCapability):String;
	@:native("getDeviceInfo")
	public static function getDeviceInfo(out:flight._js.DeviceInfo, hostDevice:flight._js.HostDeviceCapability):Void;
	@:native("getSafeAreaInsets")
	public static function getSafeAreaInsets(out:flight._js.SafeAreaInsets, hostDevice:flight._js.HostDeviceCapability):Void;
	@:native("refreshDeviceInfo")
	public static function refreshDeviceInfo(hostDevice:flight._js.HostDeviceCapability):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeDeviceCapabilities(ptr:flight._js.DeviceCapabilities):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeDeviceDisplayMetrics(ptr:flight._js.DeviceDisplayMetrics):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeDeviceInfo(ptr:flight._js.DeviceInfo):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSafeAreaInsets(ptr:flight._js.SafeAreaInsets):Void {}
}
