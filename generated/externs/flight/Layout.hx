package flight;

#if (js && flight_esm)
extern inline function registerAnchorLayoutResolver(state:LayoutState):Void {
	flight._js._fn.Layout.registerAnchorLayoutResolver(state);
}
#else
extern inline function registerAnchorLayoutResolver(state:LayoutState):Void {
#if hl
	flight._hl._fn.Layout.registerAnchorLayoutResolver(state);
#elseif cpp
	flight._cpp._fn.Layout.registerAnchorLayoutResolver(state);
#elseif (js && flight_esm)
	flight._js._fn.Layout.registerAnchorLayoutResolver(state);
#else
	#error "flight.Layout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableLayoutGuards(state:LayoutState, warningSink:LayoutResolutionGuard):Void {
	flight._js._fn.Layout.enableLayoutGuards(state, warningSink);
}
#else
extern inline function enableLayoutGuards(state:LayoutState, warningSink:LayoutResolutionGuard):Void {
#if hl
	flight._hl._fn.Layout.enableLayoutGuards(state, warningSink);
#elseif cpp
	flight._cpp._fn.Layout.enableLayoutGuards(state, warningSink);
#elseif (js && flight_esm)
	flight._js._fn.Layout.enableLayoutGuards(state, warningSink);
#else
	#error "flight.Layout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerFlexLayoutResolver(state:LayoutState):Void {
	flight._js._fn.Layout.registerFlexLayoutResolver(state);
}
#else
extern inline function registerFlexLayoutResolver(state:LayoutState):Void {
#if hl
	flight._hl._fn.Layout.registerFlexLayoutResolver(state);
#elseif cpp
	flight._cpp._fn.Layout.registerFlexLayoutResolver(state);
#elseif (js && flight_esm)
	flight._js._fn.Layout.registerFlexLayoutResolver(state);
#else
	#error "flight.Layout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerGridLayoutResolver(state:LayoutState):Void {
	flight._js._fn.Layout.registerGridLayoutResolver(state);
}
#else
extern inline function registerGridLayoutResolver(state:LayoutState):Void {
#if hl
	flight._hl._fn.Layout.registerGridLayoutResolver(state);
#elseif cpp
	flight._cpp._fn.Layout.registerGridLayoutResolver(state);
#elseif (js && flight_esm)
	flight._js._fn.Layout.registerGridLayoutResolver(state);
#else
	#error "flight.Layout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createLayoutState():LayoutState {
	return flight._js._fn.Layout.createLayoutState();
}
#else
extern inline function createLayoutState():LayoutState {
#if hl
	return flight._hl._fn.Layout.createLayoutState();
#elseif cpp
	return flight._cpp._fn.Layout.createLayoutState();
#elseif (js && flight_esm)
	return flight._js._fn.Layout.createLayoutState();
#else
	#error "flight.Layout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainLayoutResolution(state:LayoutState, tree:LayoutTree, nodeIndex:Int):Null<LayoutResolutionExplanation> {
	return flight._js._fn.Layout.explainLayoutResolution(state, tree, nodeIndex);
}
#else
extern inline function explainLayoutResolution(state:LayoutState, tree:LayoutTree, nodeIndex:Int):LayoutResolutionExplanation {
#if hl
	return flight._hl._fn.Layout.explainLayoutResolution(state, tree, nodeIndex);
#elseif cpp
	return flight._cpp._fn.Layout.explainLayoutResolution(state, tree, nodeIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Layout.explainLayoutResolution(state, tree, nodeIndex);
#else
	#error "flight.Layout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resolveLayoutTree(out:Dynamic, state:LayoutState, tree:LayoutTree, intrinsicSizes:Dynamic, availableWidth:Float, availableHeight:Float):Bool {
	return flight._js._fn.Layout.resolveLayoutTree(out, state, tree, intrinsicSizes, availableWidth, availableHeight);
}
#else
extern inline function resolveLayoutTree(out:Dynamic, outLen:Int, state:LayoutState, tree:LayoutTree, intrinsicSizes:Dynamic, intrinsicSizesLen:Int, availableWidth:Float, availableHeight:Float):Bool {
#if hl
	return flight._hl._fn.Layout.resolveLayoutTree(out, outLen, state, tree, intrinsicSizes, intrinsicSizesLen, availableWidth, availableHeight);
#elseif cpp
	return flight._cpp._fn.Layout.resolveLayoutTree(out, outLen, state, tree, intrinsicSizes, intrinsicSizesLen, availableWidth, availableHeight);
#elseif (js && flight_esm)
	return flight._js._fn.Layout.resolveLayoutTree(out, outLen, state, tree, intrinsicSizes, intrinsicSizesLen, availableWidth, availableHeight);
#else
	#error "flight.Layout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeLayoutState(ptr:LayoutState):Void {
	flight._js._fn.Layout.freeLayoutState(ptr);
}
#else
extern inline function freeLayoutState(ptr:LayoutState):Void {
#if hl
	flight._hl._fn.Layout.freeLayoutState(ptr);
#elseif cpp
	flight._cpp._fn.Layout.freeLayoutState(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Layout.freeLayoutState(ptr);
#else
	#error "flight.Layout: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeLayoutResolutionExplanation(ptr:LayoutResolutionExplanation):Void {
	flight._js._fn.Layout.freeLayoutResolutionExplanation(ptr);
}
#else
extern inline function freeLayoutResolutionExplanation(ptr:LayoutResolutionExplanation):Void {
#if hl
	flight._hl._fn.Layout.freeLayoutResolutionExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Layout.freeLayoutResolutionExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Layout.freeLayoutResolutionExplanation(ptr);
#else
	#error "flight.Layout: no backend for this target."
#end
}
#end
