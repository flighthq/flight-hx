package flight.esm.types.sdk_entity;

#if (js && flight_esm)
typedef Entity = flight.esm.types.entity.Types.Entity;

typedef EntityRaw = flight.esm.types.entity.Types.EntityRaw;

typedef NonEntityCreateResult<Type, Kind> = flight.esm.types.entity.Types.NonEntityCreateResult<Type, Kind>;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
