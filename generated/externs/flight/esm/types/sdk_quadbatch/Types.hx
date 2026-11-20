package flight.esm.types.sdk_quadbatch;

#if (js && flight_esm)
typedef QuadBatch = flight.esm.types.quadbatch.Types.QuadBatch;

typedef QuadBatchData = flight.esm.types.quadbatch.Types.QuadBatchData;

typedef QuadBatchRuntime = flight.esm.types.quadbatch.Types.QuadBatchRuntime;

typedef QuadBatchSignals = flight.esm.types.quadbatch.Types.QuadBatchSignals;

typedef QuadTransformType = flight.esm.types.quadbatch.Types.QuadTransformType;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
