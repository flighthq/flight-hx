package flight;

#if (js && flight_esm)
extern inline function getDeviceCapabilities(out:DeviceCapabilities, hostDevice:HostDeviceCapability):Void {
	flight._js._fn.Device.getDeviceCapabilities(out, hostDevice);
}
#else
extern inline function getDeviceCapabilities(out:DeviceCapabilities, hostDevice:HostDeviceCapability):Void {
#if hl
	flight._hl._fn.Device.getDeviceCapabilities(out, hostDevice);
#elseif cpp
	flight._cpp._fn.Device.getDeviceCapabilities(out, hostDevice);
#elseif (js && flight_esm)
	flight._js._fn.Device.getDeviceCapabilities(out, hostDevice);
#else
	#error "flight.Device: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getDeviceDisplayMetrics(out:DeviceDisplayMetrics, hostDevice:HostDeviceCapability):Void {
	flight._js._fn.Device.getDeviceDisplayMetrics(out, hostDevice);
}
#else
extern inline function getDeviceDisplayMetrics(out:DeviceDisplayMetrics, hostDevice:HostDeviceCapability):Void {
#if hl
	flight._hl._fn.Device.getDeviceDisplayMetrics(out, hostDevice);
#elseif cpp
	flight._cpp._fn.Device.getDeviceDisplayMetrics(out, hostDevice);
#elseif (js && flight_esm)
	flight._js._fn.Device.getDeviceDisplayMetrics(out, hostDevice);
#else
	#error "flight.Device: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getDeviceId(hostDevice:HostDeviceCapability):String {
	return flight._js._fn.Device.getDeviceId(hostDevice);
}
#else
extern inline function getDeviceId(hostDevice:HostDeviceCapability):String {
#if hl
	return cast flight._hl._fn.Device.getDeviceId(hostDevice);
#elseif cpp
	return cast flight._cpp._fn.Device.getDeviceId(hostDevice);
#elseif (js && flight_esm)
	return cast flight._js._fn.Device.getDeviceId(hostDevice);
#else
	#error "flight.Device: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getDeviceInfo(out:DeviceInfo, hostDevice:HostDeviceCapability):Void {
	flight._js._fn.Device.getDeviceInfo(out, hostDevice);
}
#else
extern inline function getDeviceInfo(out:DeviceInfo, hostDevice:HostDeviceCapability):Void {
#if hl
	flight._hl._fn.Device.getDeviceInfo(out, hostDevice);
#elseif cpp
	flight._cpp._fn.Device.getDeviceInfo(out, hostDevice);
#elseif (js && flight_esm)
	flight._js._fn.Device.getDeviceInfo(out, hostDevice);
#else
	#error "flight.Device: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSafeAreaInsets(out:SafeAreaInsets, hostDevice:HostDeviceCapability):Void {
	flight._js._fn.Device.getSafeAreaInsets(out, hostDevice);
}
#else
extern inline function getSafeAreaInsets(out:SafeAreaInsets, hostDevice:HostDeviceCapability):Void {
#if hl
	flight._hl._fn.Device.getSafeAreaInsets(out, hostDevice);
#elseif cpp
	flight._cpp._fn.Device.getSafeAreaInsets(out, hostDevice);
#elseif (js && flight_esm)
	flight._js._fn.Device.getSafeAreaInsets(out, hostDevice);
#else
	#error "flight.Device: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function refreshDeviceInfo(hostDevice:HostDeviceCapability):Void {
	flight._js._fn.Device.refreshDeviceInfo(hostDevice);
}
#else
extern inline function refreshDeviceInfo(hostDevice:HostDeviceCapability):Void {
#if hl
	flight._hl._fn.Device.refreshDeviceInfo(hostDevice);
#elseif cpp
	flight._cpp._fn.Device.refreshDeviceInfo(hostDevice);
#elseif (js && flight_esm)
	flight._js._fn.Device.refreshDeviceInfo(hostDevice);
#else
	#error "flight.Device: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeDeviceCapabilities(ptr:DeviceCapabilities):Void {
	flight._js._fn.Device.freeDeviceCapabilities(ptr);
}
#else
extern inline function freeDeviceCapabilities(ptr:DeviceCapabilities):Void {
#if hl
	flight._hl._fn.Device.freeDeviceCapabilities(ptr);
#elseif cpp
	flight._cpp._fn.Device.freeDeviceCapabilities(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Device.freeDeviceCapabilities(ptr);
#else
	#error "flight.Device: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeDeviceDisplayMetrics(ptr:DeviceDisplayMetrics):Void {
	flight._js._fn.Device.freeDeviceDisplayMetrics(ptr);
}
#else
extern inline function freeDeviceDisplayMetrics(ptr:DeviceDisplayMetrics):Void {
#if hl
	flight._hl._fn.Device.freeDeviceDisplayMetrics(ptr);
#elseif cpp
	flight._cpp._fn.Device.freeDeviceDisplayMetrics(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Device.freeDeviceDisplayMetrics(ptr);
#else
	#error "flight.Device: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeDeviceInfo(ptr:DeviceInfo):Void {
	flight._js._fn.Device.freeDeviceInfo(ptr);
}
#else
extern inline function freeDeviceInfo(ptr:DeviceInfo):Void {
#if hl
	flight._hl._fn.Device.freeDeviceInfo(ptr);
#elseif cpp
	flight._cpp._fn.Device.freeDeviceInfo(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Device.freeDeviceInfo(ptr);
#else
	#error "flight.Device: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSafeAreaInsets(ptr:SafeAreaInsets):Void {
	flight._js._fn.Device.freeSafeAreaInsets(ptr);
}
#else
extern inline function freeSafeAreaInsets(ptr:SafeAreaInsets):Void {
#if hl
	flight._hl._fn.Device.freeSafeAreaInsets(ptr);
#elseif cpp
	flight._cpp._fn.Device.freeSafeAreaInsets(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Device.freeSafeAreaInsets(ptr);
#else
	#error "flight.Device: no backend for this target."
#end
}
#end
