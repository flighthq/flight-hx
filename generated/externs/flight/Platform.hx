package flight;

#if (js && flight_esm)
extern inline function createPlatformInfo():PlatformInfo {
	return flight._js._fn.Platform.createPlatformInfo();
}
#else
extern inline function createPlatformInfo():PlatformInfo {
#if hl
	return flight._hl._fn.Platform.createPlatformInfo();
#elseif cpp
	return flight._cpp._fn.Platform.createPlatformInfo();
#elseif (js && flight_esm)
	return flight._js._fn.Platform.createPlatformInfo();
#else
	#error "flight.Platform: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function comparePlatformVersions(a:String, b:String):Int {
	return flight._js._fn.Platform.comparePlatformVersions(a, b);
}
#else
extern inline function comparePlatformVersions(a:String, b:String):Int {
#if hl
	return flight._hl._fn.Platform.comparePlatformVersions(cast a, cast b);
#elseif cpp
	return flight._cpp._fn.Platform.comparePlatformVersions(cast a, cast b);
#elseif (js && flight_esm)
	return flight._js._fn.Platform.comparePlatformVersions(a, b);
#else
	#error "flight.Platform: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPlatformEngine(hostPlatform:HostPlatformCapability):Dynamic {
	return flight._js._fn.Platform.getPlatformEngine(hostPlatform);
}
#else
extern inline function getPlatformEngine(hostPlatform:HostPlatformCapability):flight.PlatformEngine {
#if hl
	return flight._hl._fn.Platform.getPlatformEngine(hostPlatform);
#elseif cpp
	return flight._cpp._fn.Platform.getPlatformEngine(hostPlatform);
#elseif (js && flight_esm)
	return flight._js._fn.Platform.getPlatformEngine(hostPlatform);
#else
	#error "flight.Platform: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPlatformInfo(out:PlatformInfo, hostPlatform:HostPlatformCapability):Void {
	flight._js._fn.Platform.getPlatformInfo(out, hostPlatform);
}
#else
extern inline function getPlatformInfo(out:PlatformInfo, hostPlatform:HostPlatformCapability):Void {
#if hl
	flight._hl._fn.Platform.getPlatformInfo(out, hostPlatform);
#elseif cpp
	flight._cpp._fn.Platform.getPlatformInfo(out, hostPlatform);
#elseif (js && flight_esm)
	flight._js._fn.Platform.getPlatformInfo(out, hostPlatform);
#else
	#error "flight.Platform: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPlatformKind(hostPlatform:HostPlatformCapability):Dynamic {
	return flight._js._fn.Platform.getPlatformKind(hostPlatform);
}
#else
extern inline function getPlatformKind(hostPlatform:HostPlatformCapability):flight.PlatformKind {
#if hl
	return flight._hl._fn.Platform.getPlatformKind(hostPlatform);
#elseif cpp
	return flight._cpp._fn.Platform.getPlatformKind(hostPlatform);
#elseif (js && flight_esm)
	return flight._js._fn.Platform.getPlatformKind(hostPlatform);
#else
	#error "flight.Platform: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPlatformName(hostPlatform:HostPlatformCapability):Dynamic {
	return flight._js._fn.Platform.getPlatformName(hostPlatform);
}
#else
extern inline function getPlatformName(hostPlatform:HostPlatformCapability):flight.PlatformName {
#if hl
	return flight._hl._fn.Platform.getPlatformName(hostPlatform);
#elseif cpp
	return flight._cpp._fn.Platform.getPlatformName(hostPlatform);
#elseif (js && flight_esm)
	return flight._js._fn.Platform.getPlatformName(hostPlatform);
#else
	#error "flight.Platform: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPlatformRuntime(hostPlatform:HostPlatformCapability):Dynamic {
	return flight._js._fn.Platform.getPlatformRuntime(hostPlatform);
}
#else
extern inline function getPlatformRuntime(hostPlatform:HostPlatformCapability):flight.PlatformRuntime {
#if hl
	return flight._hl._fn.Platform.getPlatformRuntime(hostPlatform);
#elseif cpp
	return flight._cpp._fn.Platform.getPlatformRuntime(hostPlatform);
#elseif (js && flight_esm)
	return flight._js._fn.Platform.getPlatformRuntime(hostPlatform);
#else
	#error "flight.Platform: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPlatformDesktop(hostPlatform:HostPlatformCapability):Bool {
	return flight._js._fn.Platform.isPlatformDesktop(hostPlatform);
}
#else
extern inline function isPlatformDesktop(hostPlatform:HostPlatformCapability):Bool {
#if hl
	return flight._hl._fn.Platform.isPlatformDesktop(hostPlatform);
#elseif cpp
	return flight._cpp._fn.Platform.isPlatformDesktop(hostPlatform);
#elseif (js && flight_esm)
	return flight._js._fn.Platform.isPlatformDesktop(hostPlatform);
#else
	#error "flight.Platform: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPlatformMobile(hostPlatform:HostPlatformCapability):Bool {
	return flight._js._fn.Platform.isPlatformMobile(hostPlatform);
}
#else
extern inline function isPlatformMobile(hostPlatform:HostPlatformCapability):Bool {
#if hl
	return flight._hl._fn.Platform.isPlatformMobile(hostPlatform);
#elseif cpp
	return flight._cpp._fn.Platform.isPlatformMobile(hostPlatform);
#elseif (js && flight_esm)
	return flight._js._fn.Platform.isPlatformMobile(hostPlatform);
#else
	#error "flight.Platform: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPlatformNative(hostPlatform:HostPlatformCapability):Bool {
	return flight._js._fn.Platform.isPlatformNative(hostPlatform);
}
#else
extern inline function isPlatformNative(hostPlatform:HostPlatformCapability):Bool {
#if hl
	return flight._hl._fn.Platform.isPlatformNative(hostPlatform);
#elseif cpp
	return flight._cpp._fn.Platform.isPlatformNative(hostPlatform);
#elseif (js && flight_esm)
	return flight._js._fn.Platform.isPlatformNative(hostPlatform);
#else
	#error "flight.Platform: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPlatformTouch(hostPlatform:HostPlatformCapability):Bool {
	return flight._js._fn.Platform.isPlatformTouch(hostPlatform);
}
#else
extern inline function isPlatformTouch(hostPlatform:HostPlatformCapability):Bool {
#if hl
	return flight._hl._fn.Platform.isPlatformTouch(hostPlatform);
#elseif cpp
	return flight._cpp._fn.Platform.isPlatformTouch(hostPlatform);
#elseif (js && flight_esm)
	return flight._js._fn.Platform.isPlatformTouch(hostPlatform);
#else
	#error "flight.Platform: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPlatformVersionAtLeast(hostPlatform:HostPlatformCapability, minimum:String):Bool {
	return flight._js._fn.Platform.isPlatformVersionAtLeast(hostPlatform, minimum);
}
#else
extern inline function isPlatformVersionAtLeast(hostPlatform:HostPlatformCapability, minimum:String):Bool {
#if hl
	return flight._hl._fn.Platform.isPlatformVersionAtLeast(hostPlatform, cast minimum);
#elseif cpp
	return flight._cpp._fn.Platform.isPlatformVersionAtLeast(hostPlatform, cast minimum);
#elseif (js && flight_esm)
	return flight._js._fn.Platform.isPlatformVersionAtLeast(hostPlatform, minimum);
#else
	#error "flight.Platform: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPlatformWeb(hostPlatform:HostPlatformCapability):Bool {
	return flight._js._fn.Platform.isPlatformWeb(hostPlatform);
}
#else
extern inline function isPlatformWeb(hostPlatform:HostPlatformCapability):Bool {
#if hl
	return flight._hl._fn.Platform.isPlatformWeb(hostPlatform);
#elseif cpp
	return flight._cpp._fn.Platform.isPlatformWeb(hostPlatform);
#elseif (js && flight_esm)
	return flight._js._fn.Platform.isPlatformWeb(hostPlatform);
#else
	#error "flight.Platform: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePlatformInfo(ptr:PlatformInfo):Void {
	flight._js._fn.Platform.freePlatformInfo(ptr);
}
#else
extern inline function freePlatformInfo(ptr:PlatformInfo):Void {
#if hl
	flight._hl._fn.Platform.freePlatformInfo(ptr);
#elseif cpp
	flight._cpp._fn.Platform.freePlatformInfo(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Platform.freePlatformInfo(ptr);
#else
	#error "flight.Platform: no backend for this target."
#end
}
#end
