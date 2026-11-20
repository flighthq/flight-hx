package flight.esm.types.entity_contract;

#if (js && flight_esm)
typedef Entity = flight.esm.types.entity.Types.Entity;

typedef EntityConstruction<Type> = Dynamic;

typedef EntityRaw = flight.esm.types.entity.Types.EntityRaw;

typedef EntityRuntime = { binding:Dynamic, ?uid:Null<String> };

typedef EntityRuntimeWriteExplanation = { message:String, slot:flight.esm.types.entity_contract.Types.EntityRuntimeWriteSlot, useInstead:Array<String> };

typedef EntityRuntimeWriteGuard = ((slot:flight.esm.types.entity_contract.Types.EntityRuntimeWriteSlot) -> Void);

typedef EntityRuntimeWriteSlot = String;

typedef EntityWithoutRuntime<Type> = Dynamic;

typedef Kind = String;

typedef NonEntityCreateResult<Type, Kind> = flight.esm.types.entity.Types.NonEntityCreateResult<Type, Kind>;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
