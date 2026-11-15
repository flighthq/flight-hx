package flight;

inline function areStatechartGuardsEnabled(instance:Dynamic):Bool {
#if hl
	return flight._hl._fn.Statechart.areStatechartGuardsEnabled(instance);
#elseif cpp
	return flight._cpp._fn.Statechart.areStatechartGuardsEnabled(instance);
#elseif (js && flight_esm)
	return flight._js._fn.Statechart.areStatechartGuardsEnabled(instance);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
inline function disableStatechartGuards(instance:Dynamic):Void {
#if hl
	flight._hl._fn.Statechart.disableStatechartGuards(instance);
#elseif cpp
	flight._cpp._fn.Statechart.disableStatechartGuards(instance);
#elseif (js && flight_esm)
	flight._js._fn.Statechart.disableStatechartGuards(instance);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
inline function createStatechartInstance(chart:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Statechart.createStatechartInstance(chart);
#elseif cpp
	return flight._cpp._fn.Statechart.createStatechartInstance(chart);
#elseif (js && flight_esm)
	return flight._js._fn.Statechart.createStatechartInstance(chart);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
inline function advanceStatechartInstance(instance:Dynamic, deltaTime:Float):Int {
#if hl
	return flight._hl._fn.Statechart.advanceStatechartInstance(instance, deltaTime);
#elseif cpp
	return flight._cpp._fn.Statechart.advanceStatechartInstance(instance, deltaTime);
#elseif (js && flight_esm)
	return flight._js._fn.Statechart.advanceStatechartInstance(instance, deltaTime);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
inline function explainStatechartTransition(instance:Dynamic, regionIndex:Int):StatechartTransitionExplanation {
#if hl
	return flight._hl._fn.Statechart.explainStatechartTransition(instance, regionIndex);
#elseif cpp
	return flight._cpp._fn.Statechart.explainStatechartTransition(instance, regionIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Statechart.explainStatechartTransition(instance, regionIndex);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
inline function fireStatechartTrigger(instance:Dynamic, inputIndex:Int):Void {
#if hl
	flight._hl._fn.Statechart.fireStatechartTrigger(instance, inputIndex);
#elseif cpp
	flight._cpp._fn.Statechart.fireStatechartTrigger(instance, inputIndex);
#elseif (js && flight_esm)
	flight._js._fn.Statechart.fireStatechartTrigger(instance, inputIndex);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
inline function getStatechartInputIndex(chart:StatechartRaw, name:String):Int {
#if hl
	return flight._hl._fn.Statechart.getStatechartInputIndex(chart, cast name);
#elseif cpp
	return flight._cpp._fn.Statechart.getStatechartInputIndex(chart, cast name);
#elseif (js && flight_esm)
	return flight._js._fn.Statechart.getStatechartInputIndex(chart, name);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
inline function getStatechartRegionBlend(instance:Dynamic, regionIndex:Int):Float {
#if hl
	return flight._hl._fn.Statechart.getStatechartRegionBlend(instance, regionIndex);
#elseif cpp
	return flight._cpp._fn.Statechart.getStatechartRegionBlend(instance, regionIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Statechart.getStatechartRegionBlend(instance, regionIndex);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
inline function getStatechartRegionState(instance:Dynamic, regionIndex:Int):Int {
#if hl
	return flight._hl._fn.Statechart.getStatechartRegionState(instance, regionIndex);
#elseif cpp
	return flight._cpp._fn.Statechart.getStatechartRegionState(instance, regionIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Statechart.getStatechartRegionState(instance, regionIndex);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
inline function setStatechartBooleanInput(instance:Dynamic, inputIndex:Int, value:Bool):Void {
#if hl
	flight._hl._fn.Statechart.setStatechartBooleanInput(instance, inputIndex, value);
#elseif cpp
	flight._cpp._fn.Statechart.setStatechartBooleanInput(instance, inputIndex, value);
#elseif (js && flight_esm)
	flight._js._fn.Statechart.setStatechartBooleanInput(instance, inputIndex, value);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
inline function setStatechartNumberInput(instance:Dynamic, inputIndex:Int, value:Float):Void {
#if hl
	flight._hl._fn.Statechart.setStatechartNumberInput(instance, inputIndex, value);
#elseif cpp
	flight._cpp._fn.Statechart.setStatechartNumberInput(instance, inputIndex, value);
#elseif (js && flight_esm)
	flight._js._fn.Statechart.setStatechartNumberInput(instance, inputIndex, value);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
inline function setStatechartRegionDuration(instance:Dynamic, regionIndex:Int, duration:Float):Void {
#if hl
	flight._hl._fn.Statechart.setStatechartRegionDuration(instance, regionIndex, duration);
#elseif cpp
	flight._cpp._fn.Statechart.setStatechartRegionDuration(instance, regionIndex, duration);
#elseif (js && flight_esm)
	flight._js._fn.Statechart.setStatechartRegionDuration(instance, regionIndex, duration);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
inline function enableStatechartSignals(instance:Dynamic):StatechartSignals {
#if hl
	return flight._hl._fn.Statechart.enableStatechartSignals(instance);
#elseif cpp
	return flight._cpp._fn.Statechart.enableStatechartSignals(instance);
#elseif (js && flight_esm)
	return flight._js._fn.Statechart.enableStatechartSignals(instance);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
inline function getStatechartSignals(instance:Dynamic):StatechartSignals {
#if hl
	return flight._hl._fn.Statechart.getStatechartSignals(instance);
#elseif cpp
	return flight._cpp._fn.Statechart.getStatechartSignals(instance);
#elseif (js && flight_esm)
	return flight._js._fn.Statechart.getStatechartSignals(instance);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
inline function freeStatechartTransitionExplanation(ptr:StatechartTransitionExplanation):Void {
#if hl
	flight._hl._fn.Statechart.freeStatechartTransitionExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Statechart.freeStatechartTransitionExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Statechart.freeStatechartTransitionExplanation(ptr);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
inline function freeStatechartSignals(ptr:StatechartSignals):Void {
#if hl
	flight._hl._fn.Statechart.freeStatechartSignals(ptr);
#elseif cpp
	flight._cpp._fn.Statechart.freeStatechartSignals(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Statechart.freeStatechartSignals(ptr);
#else
	#error "flight.Statechart: no backend for this target."
#end
}
