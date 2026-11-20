package flight.esm.types.tilemap_contract;

#if (js && flight_esm)
typedef Tilemap = flight.esm.types.tilemap.Types.Tilemap;

typedef TilemapData = flight.esm.types.tilemap.Types.TilemapData;

typedef TilemapRuntime = flight.esm.types.tilemap.Types.TilemapRuntime;

typedef TilemapSignals = flight.esm.types.tilemap.Types.TilemapSignals;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
