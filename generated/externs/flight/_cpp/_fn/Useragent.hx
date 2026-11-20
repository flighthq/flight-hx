package flight._cpp._fn;

extern class Useragent {
	@:native("flight_detect_endianness")
	public static function detectEndianness():Int;
	@:native("flight_parse_user_agent_arch")
	public static function parseUserAgentArch(ua:cpp.ConstCharStar, uadPlatform:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_parse_user_agent_engine")
	public static function parseUserAgentEngine(ua:cpp.ConstCharStar):Int;
	@:native("flight_parse_user_agent_engine_version")
	public static function parseUserAgentEngineVersion(ua:cpp.ConstCharStar, engine:Int):cpp.ConstCharStar;
	@:native("flight_parse_user_agent_kind")
	public static function parseUserAgentKind(name:Int):Int;
	@:native("flight_parse_user_agent_name")
	public static function parseUserAgentName(ua:cpp.ConstCharStar):Int;
	@:native("flight_parse_user_agent_pointer_width")
	public static function parseUserAgentPointerWidth(arch:cpp.ConstCharStar):flight._cpp.UserAgentPointerWidth;
	@:native("flight_parse_user_agent_version")
	public static function parseUserAgentVersion(ua:cpp.ConstCharStar, name:Int):cpp.ConstCharStar;
	@:native("flight_parse_user_agent_form_factor")
	public static function parseUserAgentFormFactor(ua:cpp.ConstCharStar, maxTouchPoints:Int):flight._cpp.DeviceFormFactor;
	@:native("flight_parse_user_agent_os_name")
	public static function parseUserAgentOsName(ua:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_parse_user_agent_os_version")
	public static function parseUserAgentOsVersion(ua:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_free_user_agent_pointer_width")
	public static function freeUserAgentPointerWidth(ptr:flight._cpp.UserAgentPointerWidth):Void;
	@:native("flight_free_device_form_factor")
	public static function freeDeviceFormFactor(ptr:flight._cpp.DeviceFormFactor):Void;
}
