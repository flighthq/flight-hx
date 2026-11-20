package flight;

#if (js && flight_esm)
extern inline function createAppLifecycle():AppLifecycle {
	return flight._js._fn.Lifecycle.createAppLifecycle();
}
#else
extern inline function createAppLifecycle():AppLifecycle {
#if hl
	return flight._hl._fn.Lifecycle.createAppLifecycle();
#elseif cpp
	return flight._cpp._fn.Lifecycle.createAppLifecycle();
#elseif (js && flight_esm)
	return flight._js._fn.Lifecycle.createAppLifecycle();
#else
	#error "flight.Lifecycle: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachAppLifecycle(hostLifecycle:HostLifecycleCapability, app:AppLifecycle):Void {
	flight._js._fn.Lifecycle.attachAppLifecycle(hostLifecycle, app);
}
#else
extern inline function attachAppLifecycle(hostLifecycle:HostLifecycleCapability, app:AppLifecycle):Void {
#if hl
	flight._hl._fn.Lifecycle.attachAppLifecycle(hostLifecycle, app);
#elseif cpp
	flight._cpp._fn.Lifecycle.attachAppLifecycle(hostLifecycle, app);
#elseif (js && flight_esm)
	flight._js._fn.Lifecycle.attachAppLifecycle(hostLifecycle, app);
#else
	#error "flight.Lifecycle: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachAppLifecycle(app:AppLifecycle):Void {
	flight._js._fn.Lifecycle.detachAppLifecycle(app);
}
#else
extern inline function detachAppLifecycle(app:AppLifecycle):Void {
#if hl
	flight._hl._fn.Lifecycle.detachAppLifecycle(app);
#elseif cpp
	flight._cpp._fn.Lifecycle.detachAppLifecycle(app);
#elseif (js && flight_esm)
	flight._js._fn.Lifecycle.detachAppLifecycle(app);
#else
	#error "flight.Lifecycle: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeAppLifecycle(app:AppLifecycle):Void {
	flight._js._fn.Lifecycle.disposeAppLifecycle(app);
}
#else
extern inline function disposeAppLifecycle(app:AppLifecycle):Void {
#if hl
	flight._hl._fn.Lifecycle.disposeAppLifecycle(app);
#elseif cpp
	flight._cpp._fn.Lifecycle.disposeAppLifecycle(app);
#elseif (js && flight_esm)
	flight._js._fn.Lifecycle.disposeAppLifecycle(app);
#else
	#error "flight.Lifecycle: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainLifecycleOperation(hostLifecycle:HostLifecycleCapability, operation:Dynamic):BackendOperationExplanation {
	return flight._js._fn.Lifecycle.explainLifecycleOperation(hostLifecycle, operation);
}
#else
extern inline function explainLifecycleOperation(hostLifecycle:HostLifecycleCapability, operation:flight.LifecycleOperation):BackendOperationExplanation {
#if hl
	return flight._hl._fn.Lifecycle.explainLifecycleOperation(hostLifecycle, operation);
#elseif cpp
	return flight._cpp._fn.Lifecycle.explainLifecycleOperation(hostLifecycle, operation);
#elseif (js && flight_esm)
	return flight._js._fn.Lifecycle.explainLifecycleOperation(hostLifecycle, operation);
#else
	#error "flight.Lifecycle: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAppLaunchKind(hostLifecycle:HostLifecycleCapability):Dynamic {
	return flight._js._fn.Lifecycle.getAppLaunchKind(hostLifecycle);
}
#else
extern inline function getAppLaunchKind(hostLifecycle:HostLifecycleCapability):flight.AppLaunchKind {
#if hl
	return flight._hl._fn.Lifecycle.getAppLaunchKind(hostLifecycle);
#elseif cpp
	return flight._cpp._fn.Lifecycle.getAppLaunchKind(hostLifecycle);
#elseif (js && flight_esm)
	return flight._js._fn.Lifecycle.getAppLaunchKind(hostLifecycle);
#else
	#error "flight.Lifecycle: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAppLifecycleState(hostLifecycle:HostLifecycleCapability):Dynamic {
	return flight._js._fn.Lifecycle.getAppLifecycleState(hostLifecycle);
}
#else
extern inline function getAppLifecycleState(hostLifecycle:HostLifecycleCapability):flight.AppLifecycleState {
#if hl
	return flight._hl._fn.Lifecycle.getAppLifecycleState(hostLifecycle);
#elseif cpp
	return flight._cpp._fn.Lifecycle.getAppLifecycleState(hostLifecycle);
#elseif (js && flight_esm)
	return flight._js._fn.Lifecycle.getAppLifecycleState(hostLifecycle);
#else
	#error "flight.Lifecycle: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasLifecycleOperation(hostLifecycle:HostLifecycleCapability, operation:Dynamic):Bool {
	return flight._js._fn.Lifecycle.hasLifecycleOperation(hostLifecycle, operation);
}
#else
extern inline function hasLifecycleOperation(hostLifecycle:HostLifecycleCapability, operation:flight.LifecycleOperation):Bool {
#if hl
	return flight._hl._fn.Lifecycle.hasLifecycleOperation(hostLifecycle, operation);
#elseif cpp
	return flight._cpp._fn.Lifecycle.hasLifecycleOperation(hostLifecycle, operation);
#elseif (js && flight_esm)
	return flight._js._fn.Lifecycle.hasLifecycleOperation(hostLifecycle, operation);
#else
	#error "flight.Lifecycle: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isAppActive(hostLifecycle:HostLifecycleCapability):Bool {
	return flight._js._fn.Lifecycle.isAppActive(hostLifecycle);
}
#else
extern inline function isAppActive(hostLifecycle:HostLifecycleCapability):Bool {
#if hl
	return flight._hl._fn.Lifecycle.isAppActive(hostLifecycle);
#elseif cpp
	return flight._cpp._fn.Lifecycle.isAppActive(hostLifecycle);
#elseif (js && flight_esm)
	return flight._js._fn.Lifecycle.isAppActive(hostLifecycle);
#else
	#error "flight.Lifecycle: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isAppBackground(hostLifecycle:HostLifecycleCapability):Bool {
	return flight._js._fn.Lifecycle.isAppBackground(hostLifecycle);
}
#else
extern inline function isAppBackground(hostLifecycle:HostLifecycleCapability):Bool {
#if hl
	return flight._hl._fn.Lifecycle.isAppBackground(hostLifecycle);
#elseif cpp
	return flight._cpp._fn.Lifecycle.isAppBackground(hostLifecycle);
#elseif (js && flight_esm)
	return flight._js._fn.Lifecycle.isAppBackground(hostLifecycle);
#else
	#error "flight.Lifecycle: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isAppInactive(hostLifecycle:HostLifecycleCapability):Bool {
	return flight._js._fn.Lifecycle.isAppInactive(hostLifecycle);
}
#else
extern inline function isAppInactive(hostLifecycle:HostLifecycleCapability):Bool {
#if hl
	return flight._hl._fn.Lifecycle.isAppInactive(hostLifecycle);
#elseif cpp
	return flight._cpp._fn.Lifecycle.isAppInactive(hostLifecycle);
#elseif (js && flight_esm)
	return flight._js._fn.Lifecycle.isAppInactive(hostLifecycle);
#else
	#error "flight.Lifecycle: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function requestAppBack(app:AppLifecycle):Bool {
	return flight._js._fn.Lifecycle.requestAppBack(app);
}
#else
extern inline function requestAppBack(app:AppLifecycle):Bool {
#if hl
	return flight._hl._fn.Lifecycle.requestAppBack(app);
#elseif cpp
	return flight._cpp._fn.Lifecycle.requestAppBack(app);
#elseif (js && flight_esm)
	return flight._js._fn.Lifecycle.requestAppBack(app);
#else
	#error "flight.Lifecycle: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAppLifecycle(ptr:AppLifecycle):Void {
	flight._js._fn.Lifecycle.freeAppLifecycle(ptr);
}
#else
extern inline function freeAppLifecycle(ptr:AppLifecycle):Void {
#if hl
	flight._hl._fn.Lifecycle.freeAppLifecycle(ptr);
#elseif cpp
	flight._cpp._fn.Lifecycle.freeAppLifecycle(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Lifecycle.freeAppLifecycle(ptr);
#else
	#error "flight.Lifecycle: no backend for this target."
#end
}
#end
