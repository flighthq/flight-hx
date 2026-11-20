package flight;

#if (js && flight_esm)
extern inline function computeGizmoAlignmentDeltas(out:Dynamic, bounds:Dynamic, alignment:Dynamic):Void {
	flight._js._fn.Gizmo.computeGizmoAlignmentDeltas(out, bounds, alignment);
}
#else
extern inline function computeGizmoAlignmentDeltas(out:Dynamic, bounds:Dynamic, boundsLen:Int, alignment:flight.GizmoAlignment):Void {
#if hl
	flight._hl._fn.Gizmo.computeGizmoAlignmentDeltas(out, bounds, boundsLen, alignment);
#elseif cpp
	flight._cpp._fn.Gizmo.computeGizmoAlignmentDeltas(out, bounds, boundsLen, alignment);
#elseif (js && flight_esm)
	flight._js._fn.Gizmo.computeGizmoAlignmentDeltas(out, bounds, boundsLen, alignment);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function findGizmoSmartGuides(out:GizmoSmartGuideResult, movingBounds:Rectangle, candidateBounds:Dynamic, threshold:Float):Bool {
	return flight._js._fn.Gizmo.findGizmoSmartGuides(out, movingBounds, candidateBounds, threshold);
}
#else
extern inline function findGizmoSmartGuides(out:GizmoSmartGuideResult, movingBounds:Rectangle, candidateBounds:Dynamic, candidateBoundsLen:Int, threshold:Float):Bool {
#if hl
	return flight._hl._fn.Gizmo.findGizmoSmartGuides(out, movingBounds, candidateBounds, candidateBoundsLen, threshold);
#elseif cpp
	return flight._cpp._fn.Gizmo.findGizmoSmartGuides(out, movingBounds, candidateBounds, candidateBoundsLen, threshold);
#elseif (js && flight_esm)
	return flight._js._fn.Gizmo.findGizmoSmartGuides(out, movingBounds, candidateBounds, candidateBoundsLen, threshold);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createGizmoState(options:GizmoCreateOptions):GizmoState {
	return flight._js._fn.Gizmo.createGizmoState(options);
}
#else
extern inline function createGizmoState(options:GizmoCreateOptions):GizmoState {
#if hl
	return flight._hl._fn.Gizmo.createGizmoState(options);
#elseif cpp
	return flight._cpp._fn.Gizmo.createGizmoState(options);
#elseif (js && flight_esm)
	return flight._js._fn.Gizmo.createGizmoState(options);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeGizmoState(state:GizmoState):Void {
	flight._js._fn.Gizmo.disposeGizmoState(state);
}
#else
extern inline function disposeGizmoState(state:GizmoState):Void {
#if hl
	flight._hl._fn.Gizmo.disposeGizmoState(state);
#elseif cpp
	flight._cpp._fn.Gizmo.disposeGizmoState(state);
#elseif (js && flight_esm)
	flight._js._fn.Gizmo.disposeGizmoState(state);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGizmoMode(state:GizmoState):Dynamic {
	return flight._js._fn.Gizmo.getGizmoMode(state);
}
#else
extern inline function getGizmoMode(state:GizmoState):flight.GizmoMode {
#if hl
	return flight._hl._fn.Gizmo.getGizmoMode(state);
#elseif cpp
	return flight._cpp._fn.Gizmo.getGizmoMode(state);
#elseif (js && flight_esm)
	return flight._js._fn.Gizmo.getGizmoMode(state);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGizmoSignals(state:GizmoState):GizmoSignals {
	return flight._js._fn.Gizmo.getGizmoSignals(state);
}
#else
extern inline function getGizmoSignals(state:GizmoState):GizmoSignals {
#if hl
	return flight._hl._fn.Gizmo.getGizmoSignals(state);
#elseif cpp
	return flight._cpp._fn.Gizmo.getGizmoSignals(state);
#elseif (js && flight_esm)
	return flight._js._fn.Gizmo.getGizmoSignals(state);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGizmoSpace(state:GizmoState):Dynamic {
	return flight._js._fn.Gizmo.getGizmoSpace(state);
}
#else
extern inline function getGizmoSpace(state:GizmoState):flight.GizmoSpace {
#if hl
	return flight._hl._fn.Gizmo.getGizmoSpace(state);
#elseif cpp
	return flight._cpp._fn.Gizmo.getGizmoSpace(state);
#elseif (js && flight_esm)
	return flight._js._fn.Gizmo.getGizmoSpace(state);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setGizmoCustomPivot(state:GizmoState, x:Float, y:Float):Void {
	flight._js._fn.Gizmo.setGizmoCustomPivot(state, x, y);
}
#else
extern inline function setGizmoCustomPivot(state:GizmoState, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Gizmo.setGizmoCustomPivot(state, x, y);
#elseif cpp
	flight._cpp._fn.Gizmo.setGizmoCustomPivot(state, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Gizmo.setGizmoCustomPivot(state, x, y);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setGizmoMode(state:GizmoState, mode:Dynamic):Void {
	flight._js._fn.Gizmo.setGizmoMode(state, mode);
}
#else
extern inline function setGizmoMode(state:GizmoState, mode:flight.GizmoMode):Void {
#if hl
	flight._hl._fn.Gizmo.setGizmoMode(state, mode);
#elseif cpp
	flight._cpp._fn.Gizmo.setGizmoMode(state, mode);
#elseif (js && flight_esm)
	flight._js._fn.Gizmo.setGizmoMode(state, mode);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setGizmoPivot(state:GizmoState, pivot:Dynamic):Void {
	flight._js._fn.Gizmo.setGizmoPivot(state, pivot);
}
#else
extern inline function setGizmoPivot(state:GizmoState, pivot:flight.GizmoPivot):Void {
#if hl
	flight._hl._fn.Gizmo.setGizmoPivot(state, pivot);
#elseif cpp
	flight._cpp._fn.Gizmo.setGizmoPivot(state, pivot);
#elseif (js && flight_esm)
	flight._js._fn.Gizmo.setGizmoPivot(state, pivot);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setGizmoSelectionOutlineColor(state:GizmoState, color:Int):Void {
	flight._js._fn.Gizmo.setGizmoSelectionOutlineColor(state, color);
}
#else
extern inline function setGizmoSelectionOutlineColor(state:GizmoState, color:Int):Void {
#if hl
	flight._hl._fn.Gizmo.setGizmoSelectionOutlineColor(state, color);
#elseif cpp
	flight._cpp._fn.Gizmo.setGizmoSelectionOutlineColor(state, color);
#elseif (js && flight_esm)
	flight._js._fn.Gizmo.setGizmoSelectionOutlineColor(state, color);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setGizmoSelectionOutlineEnabled(state:GizmoState, enabled:Bool):Void {
	flight._js._fn.Gizmo.setGizmoSelectionOutlineEnabled(state, enabled);
}
#else
extern inline function setGizmoSelectionOutlineEnabled(state:GizmoState, enabled:Bool):Void {
#if hl
	flight._hl._fn.Gizmo.setGizmoSelectionOutlineEnabled(state, enabled);
#elseif cpp
	flight._cpp._fn.Gizmo.setGizmoSelectionOutlineEnabled(state, enabled);
#elseif (js && flight_esm)
	flight._js._fn.Gizmo.setGizmoSelectionOutlineEnabled(state, enabled);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setGizmoSnapRotation(state:GizmoState, degrees:Float):Void {
	flight._js._fn.Gizmo.setGizmoSnapRotation(state, degrees);
}
#else
extern inline function setGizmoSnapRotation(state:GizmoState, degrees:Float):Void {
#if hl
	flight._hl._fn.Gizmo.setGizmoSnapRotation(state, degrees);
#elseif cpp
	flight._cpp._fn.Gizmo.setGizmoSnapRotation(state, degrees);
#elseif (js && flight_esm)
	flight._js._fn.Gizmo.setGizmoSnapRotation(state, degrees);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setGizmoSnapScale(state:GizmoState, step:Float):Void {
	flight._js._fn.Gizmo.setGizmoSnapScale(state, step);
}
#else
extern inline function setGizmoSnapScale(state:GizmoState, step:Float):Void {
#if hl
	flight._hl._fn.Gizmo.setGizmoSnapScale(state, step);
#elseif cpp
	flight._cpp._fn.Gizmo.setGizmoSnapScale(state, step);
#elseif (js && flight_esm)
	flight._js._fn.Gizmo.setGizmoSnapScale(state, step);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setGizmoSnapTranslate(state:GizmoState, worldUnits:Float):Void {
	flight._js._fn.Gizmo.setGizmoSnapTranslate(state, worldUnits);
}
#else
extern inline function setGizmoSnapTranslate(state:GizmoState, worldUnits:Float):Void {
#if hl
	flight._hl._fn.Gizmo.setGizmoSnapTranslate(state, worldUnits);
#elseif cpp
	flight._cpp._fn.Gizmo.setGizmoSnapTranslate(state, worldUnits);
#elseif (js && flight_esm)
	flight._js._fn.Gizmo.setGizmoSnapTranslate(state, worldUnits);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setGizmoSpace(state:GizmoState, space:Dynamic):Void {
	flight._js._fn.Gizmo.setGizmoSpace(state, space);
}
#else
extern inline function setGizmoSpace(state:GizmoState, space:flight.GizmoSpace):Void {
#if hl
	flight._hl._fn.Gizmo.setGizmoSpace(state, space);
#elseif cpp
	flight._cpp._fn.Gizmo.setGizmoSpace(state, space);
#elseif (js && flight_esm)
	flight._js._fn.Gizmo.setGizmoSpace(state, space);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updateGizmo(state:GizmoState):Void {
	flight._js._fn.Gizmo.updateGizmo(state);
}
#else
extern inline function updateGizmo(state:GizmoState):Void {
#if hl
	flight._hl._fn.Gizmo.updateGizmo(state);
#elseif cpp
	flight._cpp._fn.Gizmo.updateGizmo(state);
#elseif (js && flight_esm)
	flight._js._fn.Gizmo.updateGizmo(state);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createNode2dGizmoFeatures():GizmoNode2DFeatures {
	return flight._js._fn.Gizmo.createNode2dGizmoFeatures();
}
#else
extern inline function createNode2dGizmoFeatures():GizmoNode2DFeatures {
#if hl
	return flight._hl._fn.Gizmo.createNode2dGizmoFeatures();
#elseif cpp
	return flight._cpp._fn.Gizmo.createNode2dGizmoFeatures();
#elseif (js && flight_esm)
	return flight._js._fn.Gizmo.createNode2dGizmoFeatures();
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeGizmoState(ptr:GizmoState):Void {
	flight._js._fn.Gizmo.freeGizmoState(ptr);
}
#else
extern inline function freeGizmoState(ptr:GizmoState):Void {
#if hl
	flight._hl._fn.Gizmo.freeGizmoState(ptr);
#elseif cpp
	flight._cpp._fn.Gizmo.freeGizmoState(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Gizmo.freeGizmoState(ptr);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeGizmoSignals(ptr:GizmoSignals):Void {
	flight._js._fn.Gizmo.freeGizmoSignals(ptr);
}
#else
extern inline function freeGizmoSignals(ptr:GizmoSignals):Void {
#if hl
	flight._hl._fn.Gizmo.freeGizmoSignals(ptr);
#elseif cpp
	flight._cpp._fn.Gizmo.freeGizmoSignals(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Gizmo.freeGizmoSignals(ptr);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeGizmoNode2Dfeatures(ptr:GizmoNode2DFeatures):Void {
	flight._js._fn.Gizmo.freeGizmoNode2Dfeatures(ptr);
}
#else
extern inline function freeGizmoNode2Dfeatures(ptr:GizmoNode2DFeatures):Void {
#if hl
	flight._hl._fn.Gizmo.freeGizmoNode2Dfeatures(ptr);
#elseif cpp
	flight._cpp._fn.Gizmo.freeGizmoNode2Dfeatures(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Gizmo.freeGizmoNode2Dfeatures(ptr);
#else
	#error "flight.Gizmo: no backend for this target."
#end
}
#end
