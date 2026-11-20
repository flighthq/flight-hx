package flight._hl._fn;

extern class Protocol {
	@:hlNative("flight", "flight_create_protocol_handler")
	public static function createProtocolHandler():flight._hl.ProtocolHandler;
	@:hlNative("flight", "flight_create_protocol_url")
	public static function createProtocolUrl(parts:flight._hl.ProtocolUrlParts):hl.Bytes;
	@:hlNative("flight", "flight_attach_protocol_handler")
	public static function attachProtocolHandler(hostProtocolOpen:flight._hl.HostProtocolOpenCapability, handler:flight._hl.ProtocolHandler):Void;
	@:hlNative("flight", "flight_detach_protocol_handler")
	public static function detachProtocolHandler(handler:flight._hl.ProtocolHandler):Void;
	@:hlNative("flight", "flight_dispose_protocol_handler")
	public static function disposeProtocolHandler(handler:flight._hl.ProtocolHandler):Void;
	@:hlNative("flight", "flight_get_protocol_launch_url")
	public static function getProtocolLaunchUrl(hostProtocolLaunch:flight._hl.HostProtocolLaunchCapability):hl.Bytes;
	@:hlNative("flight", "flight_get_registered_protocol_schemes")
	public static function getRegisteredProtocolSchemes(out:hl.Bytes, hostProtocolRegistration:flight._hl.HostProtocolRegistrationCapability):Void;
	@:hlNative("flight", "flight_is_protocol_scheme_default")
	public static function isProtocolSchemeDefault(hostProtocolDefault:flight._hl.HostProtocolDefaultCapability, scheme:hl.Bytes):Bool;
	@:hlNative("flight", "flight_is_protocol_scheme_registered")
	public static function isProtocolSchemeRegistered(hostProtocolRegistrationQuery:flight._hl.HostProtocolRegistrationQueryCapability, scheme:hl.Bytes):Bool;
	@:hlNative("flight", "flight_is_valid_protocol_scheme")
	public static function isValidProtocolScheme(scheme:hl.Bytes):Bool;
	@:hlNative("flight", "flight_parse_protocol_url")
	public static function parseProtocolUrl(url:hl.Bytes):flight._hl.ParsedProtocolUrl;
	@:hlNative("flight", "flight_register_protocol_scheme")
	public static function registerProtocolScheme(hostProtocolRegistration:flight._hl.HostProtocolRegistrationCapability, scheme:hl.Bytes):Bool;
	@:hlNative("flight", "flight_register_protocol_schemes")
	public static function registerProtocolSchemes(hostProtocolRegistration:flight._hl.HostProtocolRegistrationCapability, schemes:hl.Bytes, schemesLen:Int):Bool;
	@:hlNative("flight", "flight_remove_protocol_scheme_as_default")
	public static function removeProtocolSchemeAsDefault(hostProtocolDefault:flight._hl.HostProtocolDefaultCapability, scheme:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_protocol_scheme_as_default")
	public static function setProtocolSchemeAsDefault(hostProtocolDefault:flight._hl.HostProtocolDefaultCapability, scheme:hl.Bytes):Bool;
	@:hlNative("flight", "flight_unregister_protocol_scheme")
	public static function unregisterProtocolScheme(hostProtocolUnregistration:flight._hl.HostProtocolUnregistrationCapability, scheme:hl.Bytes):Bool;
	@:hlNative("flight", "flight_unregister_protocol_schemes")
	public static function unregisterProtocolSchemes(hostProtocolUnregistration:flight._hl.HostProtocolUnregistrationCapability, schemes:hl.Bytes, schemesLen:Int):Bool;
	@:hlNative("flight", "flight_free_protocol_handler")
	public static function freeProtocolHandler(ptr:flight._hl.ProtocolHandler):Void;
	@:hlNative("flight", "flight_free_parsed_protocol_url")
	public static function freeParsedProtocolUrl(ptr:flight._hl.ParsedProtocolUrl):Void;
}
