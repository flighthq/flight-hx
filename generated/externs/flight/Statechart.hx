package flight;

#if (js && flight_esm)
extern inline function areStatechartGuardsEnabled(instance:Dynamic):Bool {
	return flight._js._fn.Statechart.areStatechartGuardsEnabled(instance);
}
#else
extern inline function areStatechartGuardsEnabled(instance:Dynamic):Bool {
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
#end
#if (js && flight_esm)
extern inline function disableStatechartGuards(instance:Dynamic):Void {
	flight._js._fn.Statechart.disableStatechartGuards(instance);
}
#else
extern inline function disableStatechartGuards(instance:Dynamic):Void {
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
#end
#if (js && flight_esm)
extern inline function createStatechartInstance(chart:Dynamic):Dynamic {
	return flight._js._fn.Statechart.createStatechartInstance(chart);
}
#else
extern inline function createStatechartInstance(chart:Dynamic):Dynamic {
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
#end
#if (js && flight_esm)
extern inline function advanceStatechartInstance(instance:Dynamic, deltaTime:Float):Int {
	return flight._js._fn.Statechart.advanceStatechartInstance(instance, deltaTime);
}
#else
extern inline function advanceStatechartInstance(instance:Dynamic, deltaTime:Float):Int {
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
#end
#if (js && flight_esm)
extern inline function explainStatechartTransition(instance:Dynamic, regionIndex:Int):StatechartTransitionExplanation {
	return flight._js._fn.Statechart.explainStatechartTransition(instance, regionIndex);
}
#else
extern inline function explainStatechartTransition(instance:Dynamic, regionIndex:Int):StatechartTransitionExplanation {
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
#end
#if (js && flight_esm)
extern inline function fireStatechartTrigger(instance:Dynamic, inputIndex:Int):Void {
	flight._js._fn.Statechart.fireStatechartTrigger(instance, inputIndex);
}
#else
extern inline function fireStatechartTrigger(instance:Dynamic, inputIndex:Int):Void {
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
#end
#if (js && flight_esm)
extern inline function getStatechartInputIndex(chart:StatechartRaw, name:String):Int {
	return flight._js._fn.Statechart.getStatechartInputIndex(chart, name);
}
#else
extern inline function getStatechartInputIndex(chart:StatechartRaw, name:String):Int {
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
#end
#if (js && flight_esm)
extern inline function getStatechartRegionBlend(instance:Dynamic, regionIndex:Int):Float {
	return flight._js._fn.Statechart.getStatechartRegionBlend(instance, regionIndex);
}
#else
extern inline function getStatechartRegionBlend(instance:Dynamic, regionIndex:Int):Float {
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
#end
#if (js && flight_esm)
extern inline function getStatechartRegionState(instance:Dynamic, regionIndex:Int):Int {
	return flight._js._fn.Statechart.getStatechartRegionState(instance, regionIndex);
}
#else
extern inline function getStatechartRegionState(instance:Dynamic, regionIndex:Int):Int {
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
#end
#if (js && flight_esm)
extern inline function setStatechartBooleanInput(instance:Dynamic, inputIndex:Int, value:Bool):Void {
	flight._js._fn.Statechart.setStatechartBooleanInput(instance, inputIndex, value);
}
#else
extern inline function setStatechartBooleanInput(instance:Dynamic, inputIndex:Int, value:Bool):Void {
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
#end
#if (js && flight_esm)
extern inline function setStatechartNumberInput(instance:Dynamic, inputIndex:Int, value:Float):Void {
	flight._js._fn.Statechart.setStatechartNumberInput(instance, inputIndex, value);
}
#else
extern inline function setStatechartNumberInput(instance:Dynamic, inputIndex:Int, value:Float):Void {
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
#end
#if (js && flight_esm)
extern inline function setStatechartRegionDuration(instance:Dynamic, regionIndex:Int, duration:Float):Void {
	flight._js._fn.Statechart.setStatechartRegionDuration(instance, regionIndex, duration);
}
#else
extern inline function setStatechartRegionDuration(instance:Dynamic, regionIndex:Int, duration:Float):Void {
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
#end
#if (js && flight_esm)
extern inline function enableStatechartSignals(instance:Dynamic):StatechartSignals {
	return flight._js._fn.Statechart.enableStatechartSignals(instance);
}
#else
extern inline function enableStatechartSignals(instance:Dynamic):StatechartSignals {
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
#end
#if (js && flight_esm)
extern inline function getStatechartSignals(instance:Dynamic):Null<StatechartSignals> {
	return flight._js._fn.Statechart.getStatechartSignals(instance);
}
#else
extern inline function getStatechartSignals(instance:Dynamic):StatechartSignals {
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
#end
#if (js && flight_esm)
extern inline function freeStatechartTransitionExplanation(ptr:StatechartTransitionExplanation):Void {
	flight._js._fn.Statechart.freeStatechartTransitionExplanation(ptr);
}
#else
extern inline function freeStatechartTransitionExplanation(ptr:StatechartTransitionExplanation):Void {
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
#end
#if (js && flight_esm)
extern inline function freeStatechartSignals(ptr:StatechartSignals):Void {
	flight._js._fn.Statechart.freeStatechartSignals(ptr);
}
#else
extern inline function freeStatechartSignals(ptr:StatechartSignals):Void {
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
#end
