package flight.esm.types.sdk_snapshot;

#if (js && flight_esm)
typedef DeepReadonly<T> = flight.esm.types.snapshot.Types.DeepReadonly<T>;

typedef Snapshot<T> = flight.esm.types.snapshot.Types.Snapshot<T>;

typedef SnapshotSchema = flight.esm.types.snapshot.Types.SnapshotSchema;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
