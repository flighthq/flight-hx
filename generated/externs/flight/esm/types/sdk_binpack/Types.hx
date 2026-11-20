package flight.esm.types.sdk_binpack;

#if (js && flight_esm)
typedef BinPackHeuristic = flight.esm.types.binpack.Types.BinPackHeuristic;

typedef BinPackOptions = flight.esm.types.binpack.Types.BinPackOptions;

typedef PackResult = flight.esm.types.binpack.Types.PackResult;

typedef PackableRectangle = flight.esm.types.binpack.Types.PackableRectangle;

typedef PackedRectangle = flight.esm.types.binpack.Types.PackedRectangle;

typedef RectangleId = flight.esm.types.binpack.Types.RectangleId;

typedef UnpackedRectangleExplanation = flight.esm.types.binpack.Types.UnpackedRectangleExplanation;

typedef UnpackedRectangleReason = flight.esm.types.binpack.Types.UnpackedRectangleReason;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
