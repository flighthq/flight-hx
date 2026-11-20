package flight;

#if (js && flight_esm)
extern inline function detectEndianness():Dynamic {
	return flight._js._fn.Useragent.detectEndianness();
}
#else
extern inline function detectEndianness():flight.PlatformEndianness {
#if hl
	return flight._hl._fn.Useragent.detectEndianness();
#elseif cpp
	return flight._cpp._fn.Useragent.detectEndianness();
#elseif (js && flight_esm)
	return flight._js._fn.Useragent.detectEndianness();
#else
	#error "flight.Useragent: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseUserAgentArch(ua:String, uadPlatform:Null<String>):String {
	return flight._js._fn.Useragent.parseUserAgentArch(ua, uadPlatform);
}
#else
extern inline function parseUserAgentArch(ua:String, uadPlatform:String):String {
#if hl
	return cast flight._hl._fn.Useragent.parseUserAgentArch(cast ua, cast uadPlatform);
#elseif cpp
	return cast flight._cpp._fn.Useragent.parseUserAgentArch(cast ua, cast uadPlatform);
#elseif (js && flight_esm)
	return cast flight._js._fn.Useragent.parseUserAgentArch(ua, uadPlatform);
#else
	#error "flight.Useragent: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseUserAgentEngine(ua:String):Dynamic {
	return flight._js._fn.Useragent.parseUserAgentEngine(ua);
}
#else
extern inline function parseUserAgentEngine(ua:String):flight.PlatformEngine {
#if hl
	return flight._hl._fn.Useragent.parseUserAgentEngine(cast ua);
#elseif cpp
	return flight._cpp._fn.Useragent.parseUserAgentEngine(cast ua);
#elseif (js && flight_esm)
	return flight._js._fn.Useragent.parseUserAgentEngine(ua);
#else
	#error "flight.Useragent: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseUserAgentEngineVersion(ua:String, engine:Dynamic):String {
	return flight._js._fn.Useragent.parseUserAgentEngineVersion(ua, engine);
}
#else
extern inline function parseUserAgentEngineVersion(ua:String, engine:flight.PlatformEngine):String {
#if hl
	return cast flight._hl._fn.Useragent.parseUserAgentEngineVersion(cast ua, engine);
#elseif cpp
	return cast flight._cpp._fn.Useragent.parseUserAgentEngineVersion(cast ua, engine);
#elseif (js && flight_esm)
	return cast flight._js._fn.Useragent.parseUserAgentEngineVersion(ua, engine);
#else
	#error "flight.Useragent: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseUserAgentKind(name:Dynamic):Dynamic {
	return flight._js._fn.Useragent.parseUserAgentKind(name);
}
#else
extern inline function parseUserAgentKind(name:flight.PlatformName):flight.PlatformKind {
#if hl
	return flight._hl._fn.Useragent.parseUserAgentKind(name);
#elseif cpp
	return flight._cpp._fn.Useragent.parseUserAgentKind(name);
#elseif (js && flight_esm)
	return flight._js._fn.Useragent.parseUserAgentKind(name);
#else
	#error "flight.Useragent: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseUserAgentName(ua:String):Dynamic {
	return flight._js._fn.Useragent.parseUserAgentName(ua);
}
#else
extern inline function parseUserAgentName(ua:String):flight.PlatformName {
#if hl
	return flight._hl._fn.Useragent.parseUserAgentName(cast ua);
#elseif cpp
	return flight._cpp._fn.Useragent.parseUserAgentName(cast ua);
#elseif (js && flight_esm)
	return flight._js._fn.Useragent.parseUserAgentName(ua);
#else
	#error "flight.Useragent: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseUserAgentPointerWidth(arch:String):UserAgentPointerWidth {
	return flight._js._fn.Useragent.parseUserAgentPointerWidth(arch);
}
#else
extern inline function parseUserAgentPointerWidth(arch:String):UserAgentPointerWidth {
#if hl
	return flight._hl._fn.Useragent.parseUserAgentPointerWidth(cast arch);
#elseif cpp
	return flight._cpp._fn.Useragent.parseUserAgentPointerWidth(cast arch);
#elseif (js && flight_esm)
	return flight._js._fn.Useragent.parseUserAgentPointerWidth(arch);
#else
	#error "flight.Useragent: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseUserAgentVersion(ua:String, name:Dynamic):String {
	return flight._js._fn.Useragent.parseUserAgentVersion(ua, name);
}
#else
extern inline function parseUserAgentVersion(ua:String, name:flight.PlatformName):String {
#if hl
	return cast flight._hl._fn.Useragent.parseUserAgentVersion(cast ua, name);
#elseif cpp
	return cast flight._cpp._fn.Useragent.parseUserAgentVersion(cast ua, name);
#elseif (js && flight_esm)
	return cast flight._js._fn.Useragent.parseUserAgentVersion(ua, name);
#else
	#error "flight.Useragent: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseUserAgentFormFactor(ua:String, maxTouchPoints:Int):DeviceFormFactor {
	return flight._js._fn.Useragent.parseUserAgentFormFactor(ua, maxTouchPoints);
}
#else
extern inline function parseUserAgentFormFactor(ua:String, maxTouchPoints:Int):DeviceFormFactor {
#if hl
	return flight._hl._fn.Useragent.parseUserAgentFormFactor(cast ua, maxTouchPoints);
#elseif cpp
	return flight._cpp._fn.Useragent.parseUserAgentFormFactor(cast ua, maxTouchPoints);
#elseif (js && flight_esm)
	return flight._js._fn.Useragent.parseUserAgentFormFactor(ua, maxTouchPoints);
#else
	#error "flight.Useragent: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseUserAgentOsName(ua:String):String {
	return flight._js._fn.Useragent.parseUserAgentOsName(ua);
}
#else
extern inline function parseUserAgentOsName(ua:String):String {
#if hl
	return cast flight._hl._fn.Useragent.parseUserAgentOsName(cast ua);
#elseif cpp
	return cast flight._cpp._fn.Useragent.parseUserAgentOsName(cast ua);
#elseif (js && flight_esm)
	return cast flight._js._fn.Useragent.parseUserAgentOsName(ua);
#else
	#error "flight.Useragent: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseUserAgentOsVersion(ua:String):String {
	return flight._js._fn.Useragent.parseUserAgentOsVersion(ua);
}
#else
extern inline function parseUserAgentOsVersion(ua:String):String {
#if hl
	return cast flight._hl._fn.Useragent.parseUserAgentOsVersion(cast ua);
#elseif cpp
	return cast flight._cpp._fn.Useragent.parseUserAgentOsVersion(cast ua);
#elseif (js && flight_esm)
	return cast flight._js._fn.Useragent.parseUserAgentOsVersion(ua);
#else
	#error "flight.Useragent: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeUserAgentPointerWidth(ptr:UserAgentPointerWidth):Void {
	flight._js._fn.Useragent.freeUserAgentPointerWidth(ptr);
}
#else
extern inline function freeUserAgentPointerWidth(ptr:UserAgentPointerWidth):Void {
#if hl
	flight._hl._fn.Useragent.freeUserAgentPointerWidth(ptr);
#elseif cpp
	flight._cpp._fn.Useragent.freeUserAgentPointerWidth(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Useragent.freeUserAgentPointerWidth(ptr);
#else
	#error "flight.Useragent: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeDeviceFormFactor(ptr:DeviceFormFactor):Void {
	flight._js._fn.Useragent.freeDeviceFormFactor(ptr);
}
#else
extern inline function freeDeviceFormFactor(ptr:DeviceFormFactor):Void {
#if hl
	flight._hl._fn.Useragent.freeDeviceFormFactor(ptr);
#elseif cpp
	flight._cpp._fn.Useragent.freeDeviceFormFactor(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Useragent.freeDeviceFormFactor(ptr);
#else
	#error "flight.Useragent: no backend for this target."
#end
}
#end
