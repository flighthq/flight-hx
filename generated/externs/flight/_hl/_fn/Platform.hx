package flight._hl._fn;

extern class Platform {
	@:hlNative("flight", "flight_create_platform_info")
	public static function createPlatformInfo():flight._hl.PlatformInfo;
	@:hlNative("flight", "flight_compare_platform_versions")
	public static function comparePlatformVersions(a:hl.Bytes, b:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_platform_engine")
	public static function getPlatformEngine(hostPlatform:flight._hl.HostPlatformCapability):Int;
	@:hlNative("flight", "flight_get_platform_info")
	public static function getPlatformInfo(out:flight._hl.PlatformInfo, hostPlatform:flight._hl.HostPlatformCapability):Void;
	@:hlNative("flight", "flight_get_platform_kind")
	public static function getPlatformKind(hostPlatform:flight._hl.HostPlatformCapability):Int;
	@:hlNative("flight", "flight_get_platform_name")
	public static function getPlatformName(hostPlatform:flight._hl.HostPlatformCapability):Int;
	@:hlNative("flight", "flight_get_platform_runtime")
	public static function getPlatformRuntime(hostPlatform:flight._hl.HostPlatformCapability):Int;
	@:hlNative("flight", "flight_is_platform_desktop")
	public static function isPlatformDesktop(hostPlatform:flight._hl.HostPlatformCapability):Bool;
	@:hlNative("flight", "flight_is_platform_mobile")
	public static function isPlatformMobile(hostPlatform:flight._hl.HostPlatformCapability):Bool;
	@:hlNative("flight", "flight_is_platform_native")
	public static function isPlatformNative(hostPlatform:flight._hl.HostPlatformCapability):Bool;
	@:hlNative("flight", "flight_is_platform_touch")
	public static function isPlatformTouch(hostPlatform:flight._hl.HostPlatformCapability):Bool;
	@:hlNative("flight", "flight_is_platform_version_at_least")
	public static function isPlatformVersionAtLeast(hostPlatform:flight._hl.HostPlatformCapability, minimum:hl.Bytes):Bool;
	@:hlNative("flight", "flight_is_platform_web")
	public static function isPlatformWeb(hostPlatform:flight._hl.HostPlatformCapability):Bool;
	@:hlNative("flight", "flight_free_platform_info")
	public static function freePlatformInfo(ptr:flight._hl.PlatformInfo):Void;
}
