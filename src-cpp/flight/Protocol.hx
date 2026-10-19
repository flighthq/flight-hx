// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

inline function isValidProtocolScheme(scheme:String):Bool {
  return flight._cpp._fn.Protocol.isValidProtocolScheme(scheme);
}

extern inline function createProtocolHandler():flight.ProtocolHandler {
  return flight._cpp._fn.Protocol.createProtocolHandler();
}

extern inline function detachProtocolHandler(handler:flight.ProtocolHandler):Void {
  flight._cpp._fn.Protocol.detachProtocolHandler(handler);
}

extern inline function disposeProtocolHandler(handler:flight.ProtocolHandler):Void {
  flight._cpp._fn.Protocol.disposeProtocolHandler(handler);
}

extern inline function attachProtocolHandler(hostProtocolOpen:flight.HostProtocolOpenCapability, handler:flight.ProtocolHandler):Void {
  flight._cpp._fn.Protocol.attachProtocolHandler(hostProtocolOpen, handler);
}

extern inline function getProtocolLaunchUrl(hostProtocolLaunch:flight.HostProtocolLaunchCapability):Null<String> {
  return flight._cpp._fn.Protocol.getProtocolLaunchUrl(hostProtocolLaunch);
}

extern inline function isProtocolSchemeDefault(hostProtocolDefault:flight.HostProtocolDefaultCapability, scheme:String):Bool {
  return flight._cpp._fn.Protocol.isProtocolSchemeDefault(hostProtocolDefault, scheme);
}

extern inline function isProtocolSchemeRegistered(hostProtocolRegistrationQuery:flight.HostProtocolRegistrationQueryCapability, scheme:String):Bool {
  return flight._cpp._fn.Protocol.isProtocolSchemeRegistered(hostProtocolRegistrationQuery, scheme);
}

extern inline function parseProtocolUrl(url:String):Null<flight.ParsedProtocolUrl> {
  return flight._cpp._fn.Protocol.parseProtocolUrl(url);
}

extern inline function registerProtocolScheme(hostProtocolRegistration:flight.HostProtocolRegistrationCapability, scheme:String):Bool {
  return flight._cpp._fn.Protocol.registerProtocolScheme(hostProtocolRegistration, scheme);
}

extern inline function removeProtocolSchemeAsDefault(hostProtocolDefault:flight.HostProtocolDefaultCapability, scheme:String):Bool {
  return flight._cpp._fn.Protocol.removeProtocolSchemeAsDefault(hostProtocolDefault, scheme);
}

extern inline function setProtocolSchemeAsDefault(hostProtocolDefault:flight.HostProtocolDefaultCapability, scheme:String):Bool {
  return flight._cpp._fn.Protocol.setProtocolSchemeAsDefault(hostProtocolDefault, scheme);
}

extern inline function unregisterProtocolScheme(hostProtocolUnregistration:flight.HostProtocolUnregistrationCapability, scheme:String):Bool {
  return flight._cpp._fn.Protocol.unregisterProtocolScheme(hostProtocolUnregistration, scheme);
}

extern inline function createProtocolUrl(parts:Dynamic):String {
  return flight._cpp._attempt.Attempt_Protocol_createProtocolUrl.createProtocolUrl(parts);
}

extern inline function getRegisteredProtocolSchemes(hostProtocolRegistration:flight.HostProtocolRegistrationCapability):Array<String> {
  return flight._cpp._attempt.Attempt_Protocol_getRegisteredProtocolSchemes.getRegisteredProtocolSchemes(hostProtocolRegistration);
}

extern inline function initializeProtocolHandler(out:flight.EntityConstruction<flight.ProtocolHandler>):Void {
  flight._cpp._attempt.Attempt_Protocol_initializeProtocolHandler.initializeProtocolHandler(out);
}

extern inline function registerProtocolSchemes(hostProtocolRegistration:flight.HostProtocolRegistrationCapability, schemes:Array<String>):Bool {
  return flight._cpp._attempt.Attempt_Protocol_registerProtocolSchemes.registerProtocolSchemes(hostProtocolRegistration, schemes);
}

extern inline function unregisterProtocolSchemes(hostProtocolUnregistration:flight.HostProtocolUnregistrationCapability, schemes:Array<String>):Bool {
  return flight._cpp._attempt.Attempt_Protocol_unregisterProtocolSchemes.unregisterProtocolSchemes(hostProtocolUnregistration, schemes);
}
