package flight.esm.entity;

#if (js && flight_esm)
@:jsRequire("@flighthq/entity/contract")
extern class Contract {
  public static final Entity:Dynamic;
  public static final EntityRuntimeKey:Dynamic;
  public static final EntityRuntimeWriteSlot:Dynamic;
  public static function allocateEntity<Type>():flight.esm.types.entity_contract.Types.EntityConstruction<Type>;
  public static function areEntityRuntimeGuardsEnabled():Bool;
  public static function attachEntityBinding(entity:Dynamic, binding:Dynamic):Void;
  public static function attachEntityWrapper(entity:Dynamic, wrapper:flight.esm.types.entity.Types.Entity):Void;
  public static function cloneEntity<Type>(source:Type):Type;
  public static function createEntityRuntime():flight.esm.types.entity_contract.Types.EntityRuntime;
  public static function createGuardedEntity<Type>(entity:Type):Dynamic;
  public static function createGuardedEntityRuntime(runtime:flight.esm.types.entity_contract.Types.EntityRuntime):flight.esm.types.entity_contract.Types.EntityRuntime;
  public static function detachEntityBinding(entity:Dynamic):Void;
  public static function disableEntityRuntimeGuards():Void;
  public static function enableEntityRuntimeGuards(report:flight.esm.types.entity_contract.Types.EntityRuntimeWriteGuard):Void;
  public static function explainEntityRuntimeWrite(slot:flight.esm.types.entity_contract.Types.EntityRuntimeWriteSlot):flight.esm.types.entity_contract.Types.EntityRuntimeWriteExplanation;
  public static function getEntityBinding(source:Dynamic):Dynamic;
  public static function getEntityBindingAs<Type>(source:Dynamic):Null<Type>;
  public static function getEntityRuntime(source:Dynamic):flight.esm.types.entity_contract.Types.EntityRuntime;
  public static function getEntityUid(source:Dynamic):String;
  public static function getEntityWrapperAs<Type>(source:Dynamic):Null<Type>;
  public static function hasEntityBinding(source:Dynamic):Bool;
  public static function hasEntityRuntime(source:Dynamic):Bool;
  public static function reportEntityRuntimeWrite(slot:flight.esm.types.entity_contract.Types.EntityRuntimeWriteSlot):Void;
  public static function setEntityRuntimeGuardMode(enabled:Bool):Void;
  public static function setEntityRuntimeWriteGuard(guard:Null<flight.esm.types.entity_contract.Types.EntityRuntimeWriteGuard>):Void;
  public static function setEntityUid(source:Dynamic, uid:String):Void;
  public static function stripEntityRuntime<Type>(source:Type):flight.esm.types.entity_contract.Types.EntityWithoutRuntime<Type>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
