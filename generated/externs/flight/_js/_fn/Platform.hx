package flight._js._fn;

@:jsRequire("@flighthq/platform")
extern class Platform {
	@:native("createPlatformInfo")
	public static function createPlatformInfo():flight._js.PlatformInfo;
	@:native("comparePlatformVersions")
	public static function comparePlatformVersions(a:String, b:String):Int;
	@:native("getPlatformEngine")
	public static function getPlatformEngine(hostPlatform:flight._js.HostPlatformCapability):Dynamic;
	@:native("getPlatformInfo")
	public static function getPlatformInfo(out:flight._js.PlatformInfo, hostPlatform:flight._js.HostPlatformCapability):Void;
	@:native("getPlatformKind")
	public static function getPlatformKind(hostPlatform:flight._js.HostPlatformCapability):Dynamic;
	@:native("getPlatformName")
	public static function getPlatformName(hostPlatform:flight._js.HostPlatformCapability):Dynamic;
	@:native("getPlatformRuntime")
	public static function getPlatformRuntime(hostPlatform:flight._js.HostPlatformCapability):Dynamic;
	@:native("isPlatformDesktop")
	public static function isPlatformDesktop(hostPlatform:flight._js.HostPlatformCapability):Bool;
	@:native("isPlatformMobile")
	public static function isPlatformMobile(hostPlatform:flight._js.HostPlatformCapability):Bool;
	@:native("isPlatformNative")
	public static function isPlatformNative(hostPlatform:flight._js.HostPlatformCapability):Bool;
	@:native("isPlatformTouch")
	public static function isPlatformTouch(hostPlatform:flight._js.HostPlatformCapability):Bool;
	@:native("isPlatformVersionAtLeast")
	public static function isPlatformVersionAtLeast(hostPlatform:flight._js.HostPlatformCapability, minimum:String):Bool;
	@:native("isPlatformWeb")
	public static function isPlatformWeb(hostPlatform:flight._js.HostPlatformCapability):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePlatformInfo(ptr:flight._js.PlatformInfo):Void {}
}
