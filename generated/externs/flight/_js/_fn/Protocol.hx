package flight._js._fn;

@:jsRequire("@flighthq/protocol")
extern class Protocol {
	@:native("createProtocolHandler")
	public static function createProtocolHandler():flight._js.ProtocolHandler;
	@:native("createProtocolUrl")
	public static function createProtocolUrl(parts:flight._js.ProtocolUrlParts):String;
	@:native("attachProtocolHandler")
	public static function attachProtocolHandler(hostProtocolOpen:flight._js.HostProtocolOpenCapability, handler:flight._js.ProtocolHandler):Void;
	@:native("detachProtocolHandler")
	public static function detachProtocolHandler(handler:flight._js.ProtocolHandler):Void;
	@:native("disposeProtocolHandler")
	public static function disposeProtocolHandler(handler:flight._js.ProtocolHandler):Void;
	@:native("getProtocolLaunchUrl")
	public static function getProtocolLaunchUrl(hostProtocolLaunch:flight._js.HostProtocolLaunchCapability):Null<String>;
	@:native("getRegisteredProtocolSchemes")
	public static function getRegisteredProtocolSchemes(out:Dynamic, hostProtocolRegistration:flight._js.HostProtocolRegistrationCapability):Void;
	@:native("isProtocolSchemeDefault")
	public static function isProtocolSchemeDefault(hostProtocolDefault:flight._js.HostProtocolDefaultCapability, scheme:String):Bool;
	@:native("isProtocolSchemeRegistered")
	public static function isProtocolSchemeRegistered(hostProtocolRegistrationQuery:flight._js.HostProtocolRegistrationQueryCapability, scheme:String):Bool;
	@:native("isValidProtocolScheme")
	public static function isValidProtocolScheme(scheme:String):Bool;
	@:native("parseProtocolUrl")
	public static function parseProtocolUrl(url:String):Null<flight._js.ParsedProtocolUrl>;
	@:native("registerProtocolScheme")
	public static function registerProtocolScheme(hostProtocolRegistration:flight._js.HostProtocolRegistrationCapability, scheme:String):Bool;
	@:native("registerProtocolSchemes")
	public static function registerProtocolSchemes(hostProtocolRegistration:flight._js.HostProtocolRegistrationCapability, schemes:Dynamic):Bool;
	@:native("removeProtocolSchemeAsDefault")
	public static function removeProtocolSchemeAsDefault(hostProtocolDefault:flight._js.HostProtocolDefaultCapability, scheme:String):Bool;
	@:native("setProtocolSchemeAsDefault")
	public static function setProtocolSchemeAsDefault(hostProtocolDefault:flight._js.HostProtocolDefaultCapability, scheme:String):Bool;
	@:native("unregisterProtocolScheme")
	public static function unregisterProtocolScheme(hostProtocolUnregistration:flight._js.HostProtocolUnregistrationCapability, scheme:String):Bool;
	@:native("unregisterProtocolSchemes")
	public static function unregisterProtocolSchemes(hostProtocolUnregistration:flight._js.HostProtocolUnregistrationCapability, schemes:Dynamic):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeProtocolHandler(ptr:flight._js.ProtocolHandler):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeParsedProtocolUrl(ptr:flight._js.ParsedProtocolUrl):Void {}
}
