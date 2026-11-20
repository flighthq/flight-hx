package flight._cpp._fn;

extern class Platform {
	@:native("flight_create_platform_info")
	public static function createPlatformInfo():flight._cpp.PlatformInfo;
	@:native("flight_compare_platform_versions")
	public static function comparePlatformVersions(a:cpp.ConstCharStar, b:cpp.ConstCharStar):Int;
	@:native("flight_get_platform_engine")
	public static function getPlatformEngine(hostPlatform:flight._cpp.HostPlatformCapability):Int;
	@:native("flight_get_platform_info")
	public static function getPlatformInfo(out:flight._cpp.PlatformInfo, hostPlatform:flight._cpp.HostPlatformCapability):Void;
	@:native("flight_get_platform_kind")
	public static function getPlatformKind(hostPlatform:flight._cpp.HostPlatformCapability):Int;
	@:native("flight_get_platform_name")
	public static function getPlatformName(hostPlatform:flight._cpp.HostPlatformCapability):Int;
	@:native("flight_get_platform_runtime")
	public static function getPlatformRuntime(hostPlatform:flight._cpp.HostPlatformCapability):Int;
	@:native("flight_is_platform_desktop")
	public static function isPlatformDesktop(hostPlatform:flight._cpp.HostPlatformCapability):Bool;
	@:native("flight_is_platform_mobile")
	public static function isPlatformMobile(hostPlatform:flight._cpp.HostPlatformCapability):Bool;
	@:native("flight_is_platform_native")
	public static function isPlatformNative(hostPlatform:flight._cpp.HostPlatformCapability):Bool;
	@:native("flight_is_platform_touch")
	public static function isPlatformTouch(hostPlatform:flight._cpp.HostPlatformCapability):Bool;
	@:native("flight_is_platform_version_at_least")
	public static function isPlatformVersionAtLeast(hostPlatform:flight._cpp.HostPlatformCapability, minimum:cpp.ConstCharStar):Bool;
	@:native("flight_is_platform_web")
	public static function isPlatformWeb(hostPlatform:flight._cpp.HostPlatformCapability):Bool;
	@:native("flight_free_platform_info")
	public static function freePlatformInfo(ptr:flight._cpp.PlatformInfo):Void;
}
