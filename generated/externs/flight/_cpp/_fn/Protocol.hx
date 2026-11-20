package flight._cpp._fn;

extern class Protocol {
	@:native("flight_create_protocol_handler")
	public static function createProtocolHandler():flight._cpp.ProtocolHandler;
	@:native("flight_create_protocol_url")
	public static function createProtocolUrl(parts:flight._cpp.ProtocolUrlParts):cpp.ConstCharStar;
	@:native("flight_attach_protocol_handler")
	public static function attachProtocolHandler(hostProtocolOpen:flight._cpp.HostProtocolOpenCapability, handler:flight._cpp.ProtocolHandler):Void;
	@:native("flight_detach_protocol_handler")
	public static function detachProtocolHandler(handler:flight._cpp.ProtocolHandler):Void;
	@:native("flight_dispose_protocol_handler")
	public static function disposeProtocolHandler(handler:flight._cpp.ProtocolHandler):Void;
	@:native("flight_get_protocol_launch_url")
	public static function getProtocolLaunchUrl(hostProtocolLaunch:flight._cpp.HostProtocolLaunchCapability):cpp.ConstCharStar;
	@:native("flight_get_registered_protocol_schemes")
	public static function getRegisteredProtocolSchemes(out:cpp.Star<cpp.Void>, hostProtocolRegistration:flight._cpp.HostProtocolRegistrationCapability):Void;
	@:native("flight_is_protocol_scheme_default")
	public static function isProtocolSchemeDefault(hostProtocolDefault:flight._cpp.HostProtocolDefaultCapability, scheme:cpp.ConstCharStar):Bool;
	@:native("flight_is_protocol_scheme_registered")
	public static function isProtocolSchemeRegistered(hostProtocolRegistrationQuery:flight._cpp.HostProtocolRegistrationQueryCapability, scheme:cpp.ConstCharStar):Bool;
	@:native("flight_is_valid_protocol_scheme")
	public static function isValidProtocolScheme(scheme:cpp.ConstCharStar):Bool;
	@:native("flight_parse_protocol_url")
	public static function parseProtocolUrl(url:cpp.ConstCharStar):flight._cpp.ParsedProtocolUrl;
	@:native("flight_register_protocol_scheme")
	public static function registerProtocolScheme(hostProtocolRegistration:flight._cpp.HostProtocolRegistrationCapability, scheme:cpp.ConstCharStar):Bool;
	@:native("flight_register_protocol_schemes")
	public static function registerProtocolSchemes(hostProtocolRegistration:flight._cpp.HostProtocolRegistrationCapability, schemes:cpp.Star<cpp.Void>, schemesLen:Int):Bool;
	@:native("flight_remove_protocol_scheme_as_default")
	public static function removeProtocolSchemeAsDefault(hostProtocolDefault:flight._cpp.HostProtocolDefaultCapability, scheme:cpp.ConstCharStar):Bool;
	@:native("flight_set_protocol_scheme_as_default")
	public static function setProtocolSchemeAsDefault(hostProtocolDefault:flight._cpp.HostProtocolDefaultCapability, scheme:cpp.ConstCharStar):Bool;
	@:native("flight_unregister_protocol_scheme")
	public static function unregisterProtocolScheme(hostProtocolUnregistration:flight._cpp.HostProtocolUnregistrationCapability, scheme:cpp.ConstCharStar):Bool;
	@:native("flight_unregister_protocol_schemes")
	public static function unregisterProtocolSchemes(hostProtocolUnregistration:flight._cpp.HostProtocolUnregistrationCapability, schemes:cpp.Star<cpp.Void>, schemesLen:Int):Bool;
	@:native("flight_free_protocol_handler")
	public static function freeProtocolHandler(ptr:flight._cpp.ProtocolHandler):Void;
	@:native("flight_free_parsed_protocol_url")
	public static function freeParsedProtocolUrl(ptr:flight._cpp.ParsedProtocolUrl):Void;
}
