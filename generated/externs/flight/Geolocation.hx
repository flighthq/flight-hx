package flight;

#if (js && flight_esm)
extern inline function createGeolocationPosition():GeolocationPosition {
	return flight._js._fn.Geolocation.createGeolocationPosition();
}
#else
extern inline function createGeolocationPosition():GeolocationPosition {
#if hl
	return flight._hl._fn.Geolocation.createGeolocationPosition();
#elseif cpp
	return flight._cpp._fn.Geolocation.createGeolocationPosition();
#elseif (js && flight_esm)
	return flight._js._fn.Geolocation.createGeolocationPosition();
#else
	#error "flight.Geolocation: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearGeolocationWatch(hostGeolocation:HostGeolocationCapability, id:Int):Void {
	flight._js._fn.Geolocation.clearGeolocationWatch(hostGeolocation, id);
}
#else
extern inline function clearGeolocationWatch(hostGeolocation:HostGeolocationCapability, id:Int):Void {
#if hl
	flight._hl._fn.Geolocation.clearGeolocationWatch(hostGeolocation, id);
#elseif cpp
	flight._cpp._fn.Geolocation.clearGeolocationWatch(hostGeolocation, id);
#elseif (js && flight_esm)
	flight._js._fn.Geolocation.clearGeolocationWatch(hostGeolocation, id);
#else
	#error "flight.Geolocation: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isGeolocationAvailable(hostGeolocation:HostGeolocationCapability):Bool {
	return flight._js._fn.Geolocation.isGeolocationAvailable(hostGeolocation);
}
#else
extern inline function isGeolocationAvailable(hostGeolocation:HostGeolocationCapability):Bool {
#if hl
	return flight._hl._fn.Geolocation.isGeolocationAvailable(hostGeolocation);
#elseif cpp
	return flight._cpp._fn.Geolocation.isGeolocationAvailable(hostGeolocation);
#elseif (js && flight_esm)
	return flight._js._fn.Geolocation.isGeolocationAvailable(hostGeolocation);
#else
	#error "flight.Geolocation: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function watchGeolocationPosition(hostGeolocation:HostGeolocationCapability, handler:Dynamic, options:Null<GeolocationRequestOptions>, onError:Null<Dynamic>):Int {
	return flight._js._fn.Geolocation.watchGeolocationPosition(hostGeolocation, handler, options, onError);
}
#end
#if (js && flight_esm)
extern inline function freeGeolocationPosition(ptr:GeolocationPosition):Void {
	flight._js._fn.Geolocation.freeGeolocationPosition(ptr);
}
#else
extern inline function freeGeolocationPosition(ptr:GeolocationPosition):Void {
#if hl
	flight._hl._fn.Geolocation.freeGeolocationPosition(ptr);
#elseif cpp
	flight._cpp._fn.Geolocation.freeGeolocationPosition(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geolocation.freeGeolocationPosition(ptr);
#else
	#error "flight.Geolocation: no backend for this target."
#end
}
#end
