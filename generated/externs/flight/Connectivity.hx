package flight;

#if hl

typedef Connectivity = flight._hl.Connectivity;

#elseif cpp

typedef Connectivity = flight._cpp.Connectivity;

#elseif (js && flight_esm)

typedef Connectivity = flight._js.Connectivity;

#elseif js

#error "flight.Connectivity on js requires flight_esm."

#else

#error "flight.Connectivity: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createConnectivity():Connectivity {
	return flight._js._fn.Connectivity.createConnectivity();
}
#else
extern inline function createConnectivity():Connectivity {
#if hl
	return flight._hl._fn.Connectivity.createConnectivity();
#elseif cpp
	return flight._cpp._fn.Connectivity.createConnectivity();
#elseif (js && flight_esm)
	return flight._js._fn.Connectivity.createConnectivity();
#else
	#error "flight.Connectivity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachConnectivity(hostConnectivityStatus:HostConnectivityStatusCapability, hostConnectivityChange:HostConnectivityChangeCapability, connectivity:Connectivity):Bool {
	return flight._js._fn.Connectivity.attachConnectivity(hostConnectivityStatus, hostConnectivityChange, connectivity);
}
#else
extern inline function attachConnectivity(hostConnectivityStatus:HostConnectivityStatusCapability, hostConnectivityChange:HostConnectivityChangeCapability, connectivity:Connectivity):Bool {
#if hl
	return flight._hl._fn.Connectivity.attachConnectivity(hostConnectivityStatus, hostConnectivityChange, connectivity);
#elseif cpp
	return flight._cpp._fn.Connectivity.attachConnectivity(hostConnectivityStatus, hostConnectivityChange, connectivity);
#elseif (js && flight_esm)
	return flight._js._fn.Connectivity.attachConnectivity(hostConnectivityStatus, hostConnectivityChange, connectivity);
#else
	#error "flight.Connectivity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function destroyConnectivity(hostConnectivityChange:HostConnectivityChangeCapability):Void {
	flight._js._fn.Connectivity.destroyConnectivity(hostConnectivityChange);
}
#else
extern inline function destroyConnectivity(hostConnectivityChange:HostConnectivityChangeCapability):Void {
#if hl
	flight._hl._fn.Connectivity.destroyConnectivity(hostConnectivityChange);
#elseif cpp
	flight._cpp._fn.Connectivity.destroyConnectivity(hostConnectivityChange);
#elseif (js && flight_esm)
	flight._js._fn.Connectivity.destroyConnectivity(hostConnectivityChange);
#else
	#error "flight.Connectivity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachConnectivity(connectivity:Connectivity):Void {
	flight._js._fn.Connectivity.detachConnectivity(connectivity);
}
#else
extern inline function detachConnectivity(connectivity:Connectivity):Void {
#if hl
	flight._hl._fn.Connectivity.detachConnectivity(connectivity);
#elseif cpp
	flight._cpp._fn.Connectivity.detachConnectivity(connectivity);
#elseif (js && flight_esm)
	flight._js._fn.Connectivity.detachConnectivity(connectivity);
#else
	#error "flight.Connectivity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeConnectivity(connectivity:Connectivity):Void {
	flight._js._fn.Connectivity.disposeConnectivity(connectivity);
}
#else
extern inline function disposeConnectivity(connectivity:Connectivity):Void {
#if hl
	flight._hl._fn.Connectivity.disposeConnectivity(connectivity);
#elseif cpp
	flight._cpp._fn.Connectivity.disposeConnectivity(connectivity);
#elseif (js && flight_esm)
	flight._js._fn.Connectivity.disposeConnectivity(connectivity);
#else
	#error "flight.Connectivity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getConnectivityStatus(out:ConnectivityStatus, hostConnectivityStatus:HostConnectivityStatusCapability):Void {
	flight._js._fn.Connectivity.getConnectivityStatus(out, hostConnectivityStatus);
}
#else
extern inline function getConnectivityStatus(out:ConnectivityStatus, hostConnectivityStatus:HostConnectivityStatusCapability):Void {
#if hl
	flight._hl._fn.Connectivity.getConnectivityStatus(out, hostConnectivityStatus);
#elseif cpp
	flight._cpp._fn.Connectivity.getConnectivityStatus(out, hostConnectivityStatus);
#elseif (js && flight_esm)
	flight._js._fn.Connectivity.getConnectivityStatus(out, hostConnectivityStatus);
#else
	#error "flight.Connectivity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasConnectivityStatusChanged(a:ConnectivityStatus, b:ConnectivityStatus):Bool {
	return flight._js._fn.Connectivity.hasConnectivityStatusChanged(a, b);
}
#else
extern inline function hasConnectivityStatusChanged(a:ConnectivityStatus, b:ConnectivityStatus):Bool {
#if hl
	return flight._hl._fn.Connectivity.hasConnectivityStatusChanged(a, b);
#elseif cpp
	return flight._cpp._fn.Connectivity.hasConnectivityStatusChanged(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Connectivity.hasConnectivityStatusChanged(a, b);
#else
	#error "flight.Connectivity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isConnectivityMetered(hostConnectivityStatus:HostConnectivityStatusCapability):Bool {
	return flight._js._fn.Connectivity.isConnectivityMetered(hostConnectivityStatus);
}
#else
extern inline function isConnectivityMetered(hostConnectivityStatus:HostConnectivityStatusCapability):Bool {
#if hl
	return flight._hl._fn.Connectivity.isConnectivityMetered(hostConnectivityStatus);
#elseif cpp
	return flight._cpp._fn.Connectivity.isConnectivityMetered(hostConnectivityStatus);
#elseif (js && flight_esm)
	return flight._js._fn.Connectivity.isConnectivityMetered(hostConnectivityStatus);
#else
	#error "flight.Connectivity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isConnectivitySaveDataEnabled(hostConnectivityStatus:HostConnectivityStatusCapability):Bool {
	return flight._js._fn.Connectivity.isConnectivitySaveDataEnabled(hostConnectivityStatus);
}
#else
extern inline function isConnectivitySaveDataEnabled(hostConnectivityStatus:HostConnectivityStatusCapability):Bool {
#if hl
	return flight._hl._fn.Connectivity.isConnectivitySaveDataEnabled(hostConnectivityStatus);
#elseif cpp
	return flight._cpp._fn.Connectivity.isConnectivitySaveDataEnabled(hostConnectivityStatus);
#elseif (js && flight_esm)
	return flight._js._fn.Connectivity.isConnectivitySaveDataEnabled(hostConnectivityStatus);
#else
	#error "flight.Connectivity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeConnectivity(ptr:Connectivity):Void {
	flight._js._fn.Connectivity.freeConnectivity(ptr);
}
#else
extern inline function freeConnectivity(ptr:Connectivity):Void {
#if hl
	flight._hl._fn.Connectivity.freeConnectivity(ptr);
#elseif cpp
	flight._cpp._fn.Connectivity.freeConnectivity(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Connectivity.freeConnectivity(ptr);
#else
	#error "flight.Connectivity: no backend for this target."
#end
}
#end
