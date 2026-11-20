package flight;

#if (js && flight_esm)
extern inline function disableEntityRuntimeGuards():Void {
	flight._js._fn.Entity.disableEntityRuntimeGuards();
}
#else
extern inline function disableEntityRuntimeGuards():Void {
#if hl
	flight._hl._fn.Entity.disableEntityRuntimeGuards();
#elseif cpp
	flight._cpp._fn.Entity.disableEntityRuntimeGuards();
#elseif (js && flight_esm)
	flight._js._fn.Entity.disableEntityRuntimeGuards();
#else
	#error "flight.Entity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableEntityRuntimeGuards(report:EntityRuntimeWriteGuard):Void {
	flight._js._fn.Entity.enableEntityRuntimeGuards(report);
}
#else
extern inline function enableEntityRuntimeGuards(report:EntityRuntimeWriteGuard):Void {
#if hl
	flight._hl._fn.Entity.enableEntityRuntimeGuards(report);
#elseif cpp
	flight._cpp._fn.Entity.enableEntityRuntimeGuards(report);
#elseif (js && flight_esm)
	flight._js._fn.Entity.enableEntityRuntimeGuards(report);
#else
	#error "flight.Entity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainEntityRuntimeWrite(slot:Dynamic):EntityRuntimeWriteExplanation {
	return flight._js._fn.Entity.explainEntityRuntimeWrite(slot);
}
#else
extern inline function explainEntityRuntimeWrite(slot:flight.EntityRuntimeWriteSlot):EntityRuntimeWriteExplanation {
#if hl
	return flight._hl._fn.Entity.explainEntityRuntimeWrite(slot);
#elseif cpp
	return flight._cpp._fn.Entity.explainEntityRuntimeWrite(slot);
#elseif (js && flight_esm)
	return flight._js._fn.Entity.explainEntityRuntimeWrite(slot);
#else
	#error "flight.Entity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function areEntityRuntimeGuardsEnabled():Bool {
	return flight._js._fn.Entity.areEntityRuntimeGuardsEnabled();
}
#else
extern inline function areEntityRuntimeGuardsEnabled():Bool {
#if hl
	return flight._hl._fn.Entity.areEntityRuntimeGuardsEnabled();
#elseif cpp
	return flight._cpp._fn.Entity.areEntityRuntimeGuardsEnabled();
#elseif (js && flight_esm)
	return flight._js._fn.Entity.areEntityRuntimeGuardsEnabled();
#else
	#error "flight.Entity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setEntityRuntimeGuardMode(enabled:Bool):Void {
	flight._js._fn.Entity.setEntityRuntimeGuardMode(enabled);
}
#else
extern inline function setEntityRuntimeGuardMode(enabled:Bool):Void {
#if hl
	flight._hl._fn.Entity.setEntityRuntimeGuardMode(enabled);
#elseif cpp
	flight._cpp._fn.Entity.setEntityRuntimeGuardMode(enabled);
#elseif (js && flight_esm)
	flight._js._fn.Entity.setEntityRuntimeGuardMode(enabled);
#else
	#error "flight.Entity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeEntityRuntimeWriteExplanation(ptr:EntityRuntimeWriteExplanation):Void {
	flight._js._fn.Entity.freeEntityRuntimeWriteExplanation(ptr);
}
#else
extern inline function freeEntityRuntimeWriteExplanation(ptr:EntityRuntimeWriteExplanation):Void {
#if hl
	flight._hl._fn.Entity.freeEntityRuntimeWriteExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Entity.freeEntityRuntimeWriteExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Entity.freeEntityRuntimeWriteExplanation(ptr);
#else
	#error "flight.Entity: no backend for this target."
#end
}
#end
