package flight;

#if (js && flight_esm)
extern inline function createFlowStack():Dynamic {
	return flight._js._fn.Flow.createFlowStack();
}
#else
extern inline function createFlowStack():Dynamic {
#if hl
	return flight._hl._fn.Flow.createFlowStack();
#elseif cpp
	return flight._cpp._fn.Flow.createFlowStack();
#elseif (js && flight_esm)
	return flight._js._fn.Flow.createFlowStack();
#else
	#error "flight.Flow: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearFlowStack(stack:Dynamic):Void {
	flight._js._fn.Flow.clearFlowStack(stack);
}
#else
extern inline function clearFlowStack(stack:Dynamic):Void {
#if hl
	flight._hl._fn.Flow.clearFlowStack(stack);
#elseif cpp
	flight._cpp._fn.Flow.clearFlowStack(stack);
#elseif (js && flight_esm)
	flight._js._fn.Flow.clearFlowStack(stack);
#else
	#error "flight.Flow: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getActiveFlowState(stack:Dynamic):Null<Dynamic> {
	return flight._js._fn.Flow.getActiveFlowState(stack);
}
#else
extern inline function getActiveFlowState(stack:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Flow.getActiveFlowState(stack);
#elseif cpp
	return flight._cpp._fn.Flow.getActiveFlowState(stack);
#elseif (js && flight_esm)
	return flight._js._fn.Flow.getActiveFlowState(stack);
#else
	#error "flight.Flow: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getFlowStackDepth(stack:Dynamic):Int {
	return flight._js._fn.Flow.getFlowStackDepth(stack);
}
#else
extern inline function getFlowStackDepth(stack:Dynamic):Int {
#if hl
	return flight._hl._fn.Flow.getFlowStackDepth(stack);
#elseif cpp
	return flight._cpp._fn.Flow.getFlowStackDepth(stack);
#elseif (js && flight_esm)
	return flight._js._fn.Flow.getFlowStackDepth(stack);
#else
	#error "flight.Flow: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function popFlowState(stack:Dynamic):Null<Dynamic> {
	return flight._js._fn.Flow.popFlowState(stack);
}
#else
extern inline function popFlowState(stack:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Flow.popFlowState(stack);
#elseif cpp
	return flight._cpp._fn.Flow.popFlowState(stack);
#elseif (js && flight_esm)
	return flight._js._fn.Flow.popFlowState(stack);
#else
	#error "flight.Flow: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function pushFlowState(stack:Dynamic, state:Dynamic, guards:Dynamic):Void {
	flight._js._fn.Flow.pushFlowState(stack, state, guards);
}
#else
extern inline function pushFlowState(stack:Dynamic, state:Dynamic, guards:Dynamic):Void {
#if hl
	flight._hl._fn.Flow.pushFlowState(stack, state, guards);
#elseif cpp
	flight._cpp._fn.Flow.pushFlowState(stack, state, guards);
#elseif (js && flight_esm)
	flight._js._fn.Flow.pushFlowState(stack, state, guards);
#else
	#error "flight.Flow: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function replaceFlowState(stack:Dynamic, state:Dynamic, guards:Dynamic):Void {
	flight._js._fn.Flow.replaceFlowState(stack, state, guards);
}
#else
extern inline function replaceFlowState(stack:Dynamic, state:Dynamic, guards:Dynamic):Void {
#if hl
	flight._hl._fn.Flow.replaceFlowState(stack, state, guards);
#elseif cpp
	flight._cpp._fn.Flow.replaceFlowState(stack, state, guards);
#elseif (js && flight_esm)
	flight._js._fn.Flow.replaceFlowState(stack, state, guards);
#else
	#error "flight.Flow: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updateFlowStack(stack:Dynamic, deltaTime:Float):Void {
	flight._js._fn.Flow.updateFlowStack(stack, deltaTime);
}
#else
extern inline function updateFlowStack(stack:Dynamic, deltaTime:Float):Void {
#if hl
	flight._hl._fn.Flow.updateFlowStack(stack, deltaTime);
#elseif cpp
	flight._cpp._fn.Flow.updateFlowStack(stack, deltaTime);
#elseif (js && flight_esm)
	flight._js._fn.Flow.updateFlowStack(stack, deltaTime);
#else
	#error "flight.Flow: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disableFlowGuards(state:Dynamic):Void {
	flight._js._fn.Flow.disableFlowGuards(state);
}
#else
extern inline function disableFlowGuards(state:Dynamic):Void {
#if hl
	flight._hl._fn.Flow.disableFlowGuards(state);
#elseif cpp
	flight._cpp._fn.Flow.disableFlowGuards(state);
#elseif (js && flight_esm)
	flight._js._fn.Flow.disableFlowGuards(state);
#else
	#error "flight.Flow: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableFlowGuards(state:Dynamic, logState:Dynamic, clock:Dynamic):Void {
	flight._js._fn.Flow.enableFlowGuards(state, logState, clock);
}
#end
#if (js && flight_esm)
extern inline function getFlowGuardKindString(value:Dynamic):String {
	return flight._js._fn.Flow.getFlowGuardKindString(value);
}
#else
extern inline function getFlowGuardKindString(value:flight.FlowGuardKind):String {
#if hl
	return cast flight._hl._fn.Flow.getFlowGuardKindString(value);
#elseif cpp
	return cast flight._cpp._fn.Flow.getFlowGuardKindString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Flow.getFlowGuardKindString(value);
#else
	#error "flight.Flow: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseFlowGuardKind(value:String):Null<Dynamic> {
	return flight._js._fn.Flow.parseFlowGuardKind(value);
}
#else
extern inline function parseFlowGuardKind(value:String):Int {
#if hl
	return flight._hl._fn.Flow.parseFlowGuardKind(cast value);
#elseif cpp
	return flight._cpp._fn.Flow.parseFlowGuardKind(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Flow.parseFlowGuardKind(value);
#else
	#error "flight.Flow: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeFlowStackRef(ptr:FlowStack):Void {
	flight._js._fn.Flow.freeFlowStackRef(ptr);
}
#else
extern inline function freeFlowStackRef(ptr:FlowStack):Void {
#if hl
	flight._hl._fn.Flow.freeFlowStackRef(ptr);
#elseif cpp
	flight._cpp._fn.Flow.freeFlowStackRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Flow.freeFlowStackRef(ptr);
#else
	#error "flight.Flow: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeFlowStateRef(ptr:FlowState):Void {
	flight._js._fn.Flow.freeFlowStateRef(ptr);
}
#else
extern inline function freeFlowStateRef(ptr:FlowState):Void {
#if hl
	flight._hl._fn.Flow.freeFlowStateRef(ptr);
#elseif cpp
	flight._cpp._fn.Flow.freeFlowStateRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Flow.freeFlowStateRef(ptr);
#else
	#error "flight.Flow: no backend for this target."
#end
}
#end
