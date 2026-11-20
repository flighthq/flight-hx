package flight;

#if (js && flight_esm)
extern inline function createProtocolHandler():ProtocolHandler {
	return flight._js._fn.Protocol.createProtocolHandler();
}
#else
extern inline function createProtocolHandler():ProtocolHandler {
#if hl
	return flight._hl._fn.Protocol.createProtocolHandler();
#elseif cpp
	return flight._cpp._fn.Protocol.createProtocolHandler();
#elseif (js && flight_esm)
	return flight._js._fn.Protocol.createProtocolHandler();
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createProtocolUrl(parts:ProtocolUrlParts):String {
	return flight._js._fn.Protocol.createProtocolUrl(parts);
}
#else
extern inline function createProtocolUrl(parts:ProtocolUrlParts):String {
#if hl
	return cast flight._hl._fn.Protocol.createProtocolUrl(parts);
#elseif cpp
	return cast flight._cpp._fn.Protocol.createProtocolUrl(parts);
#elseif (js && flight_esm)
	return cast flight._js._fn.Protocol.createProtocolUrl(parts);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachProtocolHandler(hostProtocolOpen:HostProtocolOpenCapability, handler:ProtocolHandler):Void {
	flight._js._fn.Protocol.attachProtocolHandler(hostProtocolOpen, handler);
}
#else
extern inline function attachProtocolHandler(hostProtocolOpen:HostProtocolOpenCapability, handler:ProtocolHandler):Void {
#if hl
	flight._hl._fn.Protocol.attachProtocolHandler(hostProtocolOpen, handler);
#elseif cpp
	flight._cpp._fn.Protocol.attachProtocolHandler(hostProtocolOpen, handler);
#elseif (js && flight_esm)
	flight._js._fn.Protocol.attachProtocolHandler(hostProtocolOpen, handler);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachProtocolHandler(handler:ProtocolHandler):Void {
	flight._js._fn.Protocol.detachProtocolHandler(handler);
}
#else
extern inline function detachProtocolHandler(handler:ProtocolHandler):Void {
#if hl
	flight._hl._fn.Protocol.detachProtocolHandler(handler);
#elseif cpp
	flight._cpp._fn.Protocol.detachProtocolHandler(handler);
#elseif (js && flight_esm)
	flight._js._fn.Protocol.detachProtocolHandler(handler);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeProtocolHandler(handler:ProtocolHandler):Void {
	flight._js._fn.Protocol.disposeProtocolHandler(handler);
}
#else
extern inline function disposeProtocolHandler(handler:ProtocolHandler):Void {
#if hl
	flight._hl._fn.Protocol.disposeProtocolHandler(handler);
#elseif cpp
	flight._cpp._fn.Protocol.disposeProtocolHandler(handler);
#elseif (js && flight_esm)
	flight._js._fn.Protocol.disposeProtocolHandler(handler);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getProtocolLaunchUrl(hostProtocolLaunch:HostProtocolLaunchCapability):Null<String> {
	return flight._js._fn.Protocol.getProtocolLaunchUrl(hostProtocolLaunch);
}
#else
extern inline function getProtocolLaunchUrl(hostProtocolLaunch:HostProtocolLaunchCapability):String {
#if hl
	return cast flight._hl._fn.Protocol.getProtocolLaunchUrl(hostProtocolLaunch);
#elseif cpp
	return cast flight._cpp._fn.Protocol.getProtocolLaunchUrl(hostProtocolLaunch);
#elseif (js && flight_esm)
	return cast flight._js._fn.Protocol.getProtocolLaunchUrl(hostProtocolLaunch);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRegisteredProtocolSchemes(out:Dynamic, hostProtocolRegistration:HostProtocolRegistrationCapability):Void {
	flight._js._fn.Protocol.getRegisteredProtocolSchemes(out, hostProtocolRegistration);
}
#else
extern inline function getRegisteredProtocolSchemes(out:Dynamic, hostProtocolRegistration:HostProtocolRegistrationCapability):Void {
#if hl
	flight._hl._fn.Protocol.getRegisteredProtocolSchemes(out, hostProtocolRegistration);
#elseif cpp
	flight._cpp._fn.Protocol.getRegisteredProtocolSchemes(out, hostProtocolRegistration);
#elseif (js && flight_esm)
	flight._js._fn.Protocol.getRegisteredProtocolSchemes(out, hostProtocolRegistration);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isProtocolSchemeDefault(hostProtocolDefault:HostProtocolDefaultCapability, scheme:String):Bool {
	return flight._js._fn.Protocol.isProtocolSchemeDefault(hostProtocolDefault, scheme);
}
#else
extern inline function isProtocolSchemeDefault(hostProtocolDefault:HostProtocolDefaultCapability, scheme:String):Bool {
#if hl
	return flight._hl._fn.Protocol.isProtocolSchemeDefault(hostProtocolDefault, cast scheme);
#elseif cpp
	return flight._cpp._fn.Protocol.isProtocolSchemeDefault(hostProtocolDefault, cast scheme);
#elseif (js && flight_esm)
	return flight._js._fn.Protocol.isProtocolSchemeDefault(hostProtocolDefault, scheme);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isProtocolSchemeRegistered(hostProtocolRegistrationQuery:HostProtocolRegistrationQueryCapability, scheme:String):Bool {
	return flight._js._fn.Protocol.isProtocolSchemeRegistered(hostProtocolRegistrationQuery, scheme);
}
#else
extern inline function isProtocolSchemeRegistered(hostProtocolRegistrationQuery:HostProtocolRegistrationQueryCapability, scheme:String):Bool {
#if hl
	return flight._hl._fn.Protocol.isProtocolSchemeRegistered(hostProtocolRegistrationQuery, cast scheme);
#elseif cpp
	return flight._cpp._fn.Protocol.isProtocolSchemeRegistered(hostProtocolRegistrationQuery, cast scheme);
#elseif (js && flight_esm)
	return flight._js._fn.Protocol.isProtocolSchemeRegistered(hostProtocolRegistrationQuery, scheme);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isValidProtocolScheme(scheme:String):Bool {
	return flight._js._fn.Protocol.isValidProtocolScheme(scheme);
}
#else
extern inline function isValidProtocolScheme(scheme:String):Bool {
#if hl
	return flight._hl._fn.Protocol.isValidProtocolScheme(cast scheme);
#elseif cpp
	return flight._cpp._fn.Protocol.isValidProtocolScheme(cast scheme);
#elseif (js && flight_esm)
	return flight._js._fn.Protocol.isValidProtocolScheme(scheme);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseProtocolUrl(url:String):Null<ParsedProtocolUrl> {
	return flight._js._fn.Protocol.parseProtocolUrl(url);
}
#else
extern inline function parseProtocolUrl(url:String):ParsedProtocolUrl {
#if hl
	return flight._hl._fn.Protocol.parseProtocolUrl(cast url);
#elseif cpp
	return flight._cpp._fn.Protocol.parseProtocolUrl(cast url);
#elseif (js && flight_esm)
	return flight._js._fn.Protocol.parseProtocolUrl(url);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerProtocolScheme(hostProtocolRegistration:HostProtocolRegistrationCapability, scheme:String):Bool {
	return flight._js._fn.Protocol.registerProtocolScheme(hostProtocolRegistration, scheme);
}
#else
extern inline function registerProtocolScheme(hostProtocolRegistration:HostProtocolRegistrationCapability, scheme:String):Bool {
#if hl
	return flight._hl._fn.Protocol.registerProtocolScheme(hostProtocolRegistration, cast scheme);
#elseif cpp
	return flight._cpp._fn.Protocol.registerProtocolScheme(hostProtocolRegistration, cast scheme);
#elseif (js && flight_esm)
	return flight._js._fn.Protocol.registerProtocolScheme(hostProtocolRegistration, scheme);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerProtocolSchemes(hostProtocolRegistration:HostProtocolRegistrationCapability, schemes:Dynamic):Bool {
	return flight._js._fn.Protocol.registerProtocolSchemes(hostProtocolRegistration, schemes);
}
#else
extern inline function registerProtocolSchemes(hostProtocolRegistration:HostProtocolRegistrationCapability, schemes:Dynamic, schemesLen:Int):Bool {
#if hl
	return flight._hl._fn.Protocol.registerProtocolSchemes(hostProtocolRegistration, schemes, schemesLen);
#elseif cpp
	return flight._cpp._fn.Protocol.registerProtocolSchemes(hostProtocolRegistration, schemes, schemesLen);
#elseif (js && flight_esm)
	return flight._js._fn.Protocol.registerProtocolSchemes(hostProtocolRegistration, schemes, schemesLen);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function removeProtocolSchemeAsDefault(hostProtocolDefault:HostProtocolDefaultCapability, scheme:String):Bool {
	return flight._js._fn.Protocol.removeProtocolSchemeAsDefault(hostProtocolDefault, scheme);
}
#else
extern inline function removeProtocolSchemeAsDefault(hostProtocolDefault:HostProtocolDefaultCapability, scheme:String):Bool {
#if hl
	return flight._hl._fn.Protocol.removeProtocolSchemeAsDefault(hostProtocolDefault, cast scheme);
#elseif cpp
	return flight._cpp._fn.Protocol.removeProtocolSchemeAsDefault(hostProtocolDefault, cast scheme);
#elseif (js && flight_esm)
	return flight._js._fn.Protocol.removeProtocolSchemeAsDefault(hostProtocolDefault, scheme);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setProtocolSchemeAsDefault(hostProtocolDefault:HostProtocolDefaultCapability, scheme:String):Bool {
	return flight._js._fn.Protocol.setProtocolSchemeAsDefault(hostProtocolDefault, scheme);
}
#else
extern inline function setProtocolSchemeAsDefault(hostProtocolDefault:HostProtocolDefaultCapability, scheme:String):Bool {
#if hl
	return flight._hl._fn.Protocol.setProtocolSchemeAsDefault(hostProtocolDefault, cast scheme);
#elseif cpp
	return flight._cpp._fn.Protocol.setProtocolSchemeAsDefault(hostProtocolDefault, cast scheme);
#elseif (js && flight_esm)
	return flight._js._fn.Protocol.setProtocolSchemeAsDefault(hostProtocolDefault, scheme);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unregisterProtocolScheme(hostProtocolUnregistration:HostProtocolUnregistrationCapability, scheme:String):Bool {
	return flight._js._fn.Protocol.unregisterProtocolScheme(hostProtocolUnregistration, scheme);
}
#else
extern inline function unregisterProtocolScheme(hostProtocolUnregistration:HostProtocolUnregistrationCapability, scheme:String):Bool {
#if hl
	return flight._hl._fn.Protocol.unregisterProtocolScheme(hostProtocolUnregistration, cast scheme);
#elseif cpp
	return flight._cpp._fn.Protocol.unregisterProtocolScheme(hostProtocolUnregistration, cast scheme);
#elseif (js && flight_esm)
	return flight._js._fn.Protocol.unregisterProtocolScheme(hostProtocolUnregistration, scheme);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unregisterProtocolSchemes(hostProtocolUnregistration:HostProtocolUnregistrationCapability, schemes:Dynamic):Bool {
	return flight._js._fn.Protocol.unregisterProtocolSchemes(hostProtocolUnregistration, schemes);
}
#else
extern inline function unregisterProtocolSchemes(hostProtocolUnregistration:HostProtocolUnregistrationCapability, schemes:Dynamic, schemesLen:Int):Bool {
#if hl
	return flight._hl._fn.Protocol.unregisterProtocolSchemes(hostProtocolUnregistration, schemes, schemesLen);
#elseif cpp
	return flight._cpp._fn.Protocol.unregisterProtocolSchemes(hostProtocolUnregistration, schemes, schemesLen);
#elseif (js && flight_esm)
	return flight._js._fn.Protocol.unregisterProtocolSchemes(hostProtocolUnregistration, schemes, schemesLen);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeProtocolHandler(ptr:ProtocolHandler):Void {
	flight._js._fn.Protocol.freeProtocolHandler(ptr);
}
#else
extern inline function freeProtocolHandler(ptr:ProtocolHandler):Void {
#if hl
	flight._hl._fn.Protocol.freeProtocolHandler(ptr);
#elseif cpp
	flight._cpp._fn.Protocol.freeProtocolHandler(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Protocol.freeProtocolHandler(ptr);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeParsedProtocolUrl(ptr:ParsedProtocolUrl):Void {
	flight._js._fn.Protocol.freeParsedProtocolUrl(ptr);
}
#else
extern inline function freeParsedProtocolUrl(ptr:ParsedProtocolUrl):Void {
#if hl
	flight._hl._fn.Protocol.freeParsedProtocolUrl(ptr);
#elseif cpp
	flight._cpp._fn.Protocol.freeParsedProtocolUrl(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Protocol.freeParsedProtocolUrl(ptr);
#else
	#error "flight.Protocol: no backend for this target."
#end
}
#end
