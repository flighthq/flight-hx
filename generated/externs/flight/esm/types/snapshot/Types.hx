package flight.esm.types.snapshot;

#if (js && flight_esm)
typedef DeepReadonly<T> = Dynamic;

typedef Snapshot<T> = Dynamic;

typedef SnapshotSchema = Array<String>;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
