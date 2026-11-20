package flight._hl._fn;

extern class Useragent {
	@:hlNative("flight", "flight_detect_endianness")
	public static function detectEndianness():Int;
	@:hlNative("flight", "flight_parse_user_agent_arch")
	public static function parseUserAgentArch(ua:hl.Bytes, uadPlatform:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_parse_user_agent_engine")
	public static function parseUserAgentEngine(ua:hl.Bytes):Int;
	@:hlNative("flight", "flight_parse_user_agent_engine_version")
	public static function parseUserAgentEngineVersion(ua:hl.Bytes, engine:Int):hl.Bytes;
	@:hlNative("flight", "flight_parse_user_agent_kind")
	public static function parseUserAgentKind(name:Int):Int;
	@:hlNative("flight", "flight_parse_user_agent_name")
	public static function parseUserAgentName(ua:hl.Bytes):Int;
	@:hlNative("flight", "flight_parse_user_agent_pointer_width")
	public static function parseUserAgentPointerWidth(arch:hl.Bytes):flight._hl.UserAgentPointerWidth;
	@:hlNative("flight", "flight_parse_user_agent_version")
	public static function parseUserAgentVersion(ua:hl.Bytes, name:Int):hl.Bytes;
	@:hlNative("flight", "flight_parse_user_agent_form_factor")
	public static function parseUserAgentFormFactor(ua:hl.Bytes, maxTouchPoints:Int):flight._hl.DeviceFormFactor;
	@:hlNative("flight", "flight_parse_user_agent_os_name")
	public static function parseUserAgentOsName(ua:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_parse_user_agent_os_version")
	public static function parseUserAgentOsVersion(ua:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_free_user_agent_pointer_width")
	public static function freeUserAgentPointerWidth(ptr:flight._hl.UserAgentPointerWidth):Void;
	@:hlNative("flight", "flight_free_device_form_factor")
	public static function freeDeviceFormFactor(ptr:flight._hl.DeviceFormFactor):Void;
}
