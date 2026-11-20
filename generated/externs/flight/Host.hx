package flight;

#if (js && flight_esm)
extern inline function getBackendExplanationLayerString(value:Dynamic):String {
	return flight._js._fn.Host.getBackendExplanationLayerString(value);
}
#else
extern inline function getBackendExplanationLayerString(value:flight.BackendExplanationLayer):String {
#if hl
	return cast flight._hl._fn.Host.getBackendExplanationLayerString(value);
#elseif cpp
	return cast flight._cpp._fn.Host.getBackendExplanationLayerString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Host.getBackendExplanationLayerString(value);
#else
	#error "flight.Host: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBackendExplanationViabilityString(value:Dynamic):String {
	return flight._js._fn.Host.getBackendExplanationViabilityString(value);
}
#else
extern inline function getBackendExplanationViabilityString(value:flight.BackendExplanationViability):String {
#if hl
	return cast flight._hl._fn.Host.getBackendExplanationViabilityString(value);
#elseif cpp
	return cast flight._cpp._fn.Host.getBackendExplanationViabilityString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Host.getBackendExplanationViabilityString(value);
#else
	#error "flight.Host: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseBackendExplanationLayer(value:String):Null<Dynamic> {
	return flight._js._fn.Host.parseBackendExplanationLayer(value);
}
#else
extern inline function parseBackendExplanationLayer(value:String):Int {
#if hl
	return flight._hl._fn.Host.parseBackendExplanationLayer(cast value);
#elseif cpp
	return flight._cpp._fn.Host.parseBackendExplanationLayer(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Host.parseBackendExplanationLayer(value);
#else
	#error "flight.Host: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseBackendExplanationViability(value:String):Null<Dynamic> {
	return flight._js._fn.Host.parseBackendExplanationViability(value);
}
#else
extern inline function parseBackendExplanationViability(value:String):Int {
#if hl
	return flight._hl._fn.Host.parseBackendExplanationViability(cast value);
#elseif cpp
	return flight._cpp._fn.Host.parseBackendExplanationViability(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Host.parseBackendExplanationViability(value);
#else
	#error "flight.Host: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBackendOperationExplanationLayerString(value:Dynamic):String {
	return flight._js._fn.Host.getBackendOperationExplanationLayerString(value);
}
#else
extern inline function getBackendOperationExplanationLayerString(value:flight.BackendOperationExplanationLayer):String {
#if hl
	return cast flight._hl._fn.Host.getBackendOperationExplanationLayerString(value);
#elseif cpp
	return cast flight._cpp._fn.Host.getBackendOperationExplanationLayerString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Host.getBackendOperationExplanationLayerString(value);
#else
	#error "flight.Host: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseBackendOperationExplanationLayer(value:String):Null<Dynamic> {
	return flight._js._fn.Host.parseBackendOperationExplanationLayer(value);
}
#else
extern inline function parseBackendOperationExplanationLayer(value:String):Int {
#if hl
	return flight._hl._fn.Host.parseBackendOperationExplanationLayer(cast value);
#elseif cpp
	return flight._cpp._fn.Host.parseBackendOperationExplanationLayer(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Host.parseBackendOperationExplanationLayer(value);
#else
	#error "flight.Host: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBackendOperationExplanation(ptr:BackendOperationExplanation):Void {
	flight._js._fn.Host.freeBackendOperationExplanation(ptr);
}
#else
extern inline function freeBackendOperationExplanation(ptr:BackendOperationExplanation):Void {
#if hl
	flight._hl._fn.Host.freeBackendOperationExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Host.freeBackendOperationExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Host.freeBackendOperationExplanation(ptr);
#else
	#error "flight.Host: no backend for this target."
#end
}
#end
