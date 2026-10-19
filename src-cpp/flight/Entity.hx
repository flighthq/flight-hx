// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

typedef Entity = flight._cpp.Entity;

inline function areEntityRuntimeGuardsEnabled():Bool {
  return flight._cpp._fn.Entity.areEntityRuntimeGuardsEnabled();
}

extern inline function createEntityRuntime():flight.EntityRuntime {
  return flight._cpp._fn.Entity.createEntityRuntime();
}

extern inline function createGuardedEntityRuntime(runtime:flight.EntityRuntime):flight.EntityRuntime {
  return flight._cpp._fn.Entity.createGuardedEntityRuntime(runtime);
}

inline function disableEntityRuntimeGuards():Void {
  flight._cpp._fn.Entity.disableEntityRuntimeGuards();
}

inline function setEntityRuntimeGuardMode(enabled:Bool):Void {
  flight._cpp._fn.Entity.setEntityRuntimeGuardMode(enabled);
}

extern inline function allocateEntity<Type>():flight.EntityConstruction<Type> {
  return flight._cpp._attempt.Attempt_Entity_allocateEntity.allocateEntity();
}

extern inline function attachEntityBinding(entity:flight.Entity, binding:Dynamic):Void {
  flight._cpp._attempt.Attempt_Entity_attachEntityBinding.attachEntityBinding(entity, binding);
}

extern inline function cloneEntity<Type>(source:Type):Type {
  return flight._cpp._attempt.Attempt_Entity_cloneEntity.cloneEntity(source);
}

extern inline function createGuardedEntity<Type:Dynamic>(entity:Dynamic):Dynamic {
  return flight._cpp._attempt.Attempt_Entity_createGuardedEntity.createGuardedEntity(entity);
}

extern inline function detachEntityBinding(entity:flight.Entity):Void {
  flight._cpp._attempt.Attempt_Entity_detachEntityBinding.detachEntityBinding(entity);
}

extern inline function enableEntityRuntimeGuards(report:flight.EntityRuntimeWriteGuard):Void {
  flight._cpp._attempt.Attempt_Entity_enableEntityRuntimeGuards.enableEntityRuntimeGuards(report);
}

extern inline function explainEntityRuntimeWrite(slot:flight.EntityRuntimeWriteSlot):flight.EntityRuntimeWriteExplanation {
  return flight._cpp._attempt.Attempt_Entity_explainEntityRuntimeWrite.explainEntityRuntimeWrite(slot);
}

extern inline function finishEntity<Type>(out:flight.EntityConstruction<Type>):Type {
  return flight._cpp._attempt.Attempt_Entity_finishEntity.finishEntity(out);
}

extern inline function getEntityBinding(source:flight.Entity):Null<Dynamic> {
  return flight._cpp._attempt.Attempt_Entity_getEntityBinding.getEntityBinding(source);
}

extern inline function getEntityBindingAs<Type>(source:flight.Entity):Null<Type> {
  return flight._cpp._attempt.Attempt_Entity_getEntityBindingAs.getEntityBindingAs(source);
}

extern inline function getEntityRuntime(source:flight.Entity):flight.EntityRuntime {
  return flight._cpp._attempt.Attempt_Entity_getEntityRuntime.getEntityRuntime(source);
}

extern inline function getEntityUid(source:flight.Entity):String {
  return flight._cpp._attempt.Attempt_Entity_getEntityUid.getEntityUid(source);
}

extern inline function hasEntityBinding(source:flight.Entity):Bool {
  return flight._cpp._attempt.Attempt_Entity_hasEntityBinding.hasEntityBinding(source);
}

extern inline function hasEntityRuntime(source:flight.Entity):Bool {
  return flight._cpp._attempt.Attempt_Entity_hasEntityRuntime.hasEntityRuntime(source);
}

extern inline function setEntityRuntimeWriteGuard(guard:Null<flight.EntityRuntimeWriteGuard>):Void {
  flight._cpp._attempt.Attempt_Entity_setEntityRuntimeWriteGuard.setEntityRuntimeWriteGuard(guard);
}

extern inline function setEntityUid(source:flight.Entity, uid:String):Void {
  flight._cpp._attempt.Attempt_Entity_setEntityUid.setEntityUid(source, uid);
}

extern inline function stripEntityRuntime<Type>(source:Type):flight.EntityWithoutRuntime<Type> {
  return flight._cpp._attempt.Attempt_Entity_stripEntityRuntime.stripEntityRuntime(source);
}
