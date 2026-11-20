package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/protocol")
extern class Protocol {
  public static function attachProtocolHandler(hostProtocolOpen:flight.esm.types.protocol_contract.Types.HostProtocolOpenCapability, handler:flight.esm.types.protocol_contract.Types.ProtocolHandler):Void;
  public static function createProtocolHandler():flight.esm.types.protocol_contract.Types.ProtocolHandler;
  public static function createProtocolUrl(parts:Dynamic):String;
  public static function detachProtocolHandler(handler:flight.esm.types.protocol_contract.Types.ProtocolHandler):Void;
  public static function disposeProtocolHandler(handler:flight.esm.types.protocol_contract.Types.ProtocolHandler):Void;
  public static function getProtocolLaunchUrl(hostProtocolLaunch:flight.esm.types.protocol_contract.Types.HostProtocolLaunchCapability):Null<String>;
  public static function getRegisteredProtocolSchemes(hostProtocolRegistration:flight.esm.types.protocol_contract.Types.HostProtocolRegistrationCapability):Array<String>;
  public static function isProtocolSchemeDefault(hostProtocolDefault:flight.esm.types.protocol_contract.Types.HostProtocolDefaultCapability, scheme:String):Bool;
  public static function isProtocolSchemeRegistered(hostProtocolRegistrationQuery:flight.esm.types.protocol_contract.Types.HostProtocolRegistrationQueryCapability, scheme:String):Bool;
  public static function isValidProtocolScheme(scheme:String):Bool;
  public static function parseProtocolUrl(url:String):Null<flight.esm.types.protocol_contract.Types.ParsedProtocolUrl>;
  public static function registerProtocolScheme(hostProtocolRegistration:flight.esm.types.protocol_contract.Types.HostProtocolRegistrationCapability, scheme:String):Bool;
  public static function registerProtocolSchemes(hostProtocolRegistration:flight.esm.types.protocol_contract.Types.HostProtocolRegistrationCapability, schemes:Array<String>):Bool;
  public static function removeProtocolSchemeAsDefault(hostProtocolDefault:flight.esm.types.protocol_contract.Types.HostProtocolDefaultCapability, scheme:String):Bool;
  public static function setProtocolSchemeAsDefault(hostProtocolDefault:flight.esm.types.protocol_contract.Types.HostProtocolDefaultCapability, scheme:String):Bool;
  public static function unregisterProtocolScheme(hostProtocolUnregistration:flight.esm.types.protocol_contract.Types.HostProtocolUnregistrationCapability, scheme:String):Bool;
  public static function unregisterProtocolSchemes(hostProtocolUnregistration:flight.esm.types.protocol_contract.Types.HostProtocolUnregistrationCapability, schemes:Array<String>):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
