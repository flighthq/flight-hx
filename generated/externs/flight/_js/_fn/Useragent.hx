package flight._js._fn;

@:jsRequire("@flighthq/useragent")
extern class Useragent {
	@:native("detectEndianness")
	public static function detectEndianness():Dynamic;
	@:native("parseUserAgentArch")
	public static function parseUserAgentArch(ua:String, uadPlatform:Null<String>):String;
	@:native("parseUserAgentEngine")
	public static function parseUserAgentEngine(ua:String):Dynamic;
	@:native("parseUserAgentEngineVersion")
	public static function parseUserAgentEngineVersion(ua:String, engine:Dynamic):String;
	@:native("parseUserAgentKind")
	public static function parseUserAgentKind(name:Dynamic):Dynamic;
	@:native("parseUserAgentName")
	public static function parseUserAgentName(ua:String):Dynamic;
	@:native("parseUserAgentPointerWidth")
	public static function parseUserAgentPointerWidth(arch:String):flight._js.UserAgentPointerWidth;
	@:native("parseUserAgentVersion")
	public static function parseUserAgentVersion(ua:String, name:Dynamic):String;
	@:native("parseUserAgentFormFactor")
	public static function parseUserAgentFormFactor(ua:String, maxTouchPoints:Int):flight._js.DeviceFormFactor;
	@:native("parseUserAgentOsName")
	public static function parseUserAgentOsName(ua:String):String;
	@:native("parseUserAgentOsVersion")
	public static function parseUserAgentOsVersion(ua:String):String;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeUserAgentPointerWidth(ptr:flight._js.UserAgentPointerWidth):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeDeviceFormFactor(ptr:flight._js.DeviceFormFactor):Void {}
}
