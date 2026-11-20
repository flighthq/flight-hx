package flight.esm.types.entity;

#if (js && flight_esm)
@:jsRequire("@flighthq/entity", "Entity")
extern class Entity {
  public function new(?raw:Dynamic);
  public final raw:Dynamic;
  public static function create():flight.esm.types.entity.Types.Entity;
  public static function from(raw:Dynamic):flight.esm.types.entity.Types.Entity;
}

typedef EntityRaw = Dynamic;

typedef NonEntityCreateResult<Type, Kind> = Dynamic;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
