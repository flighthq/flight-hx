package flight.esm.types.spatial_contract;

#if (js && flight_esm)
typedef SpatialAabb2D = flight.esm.types.spatial.Types.SpatialAabb2D;

typedef SpatialAabb3D = flight.esm.types.spatial.Types.SpatialAabb3D;

typedef SpatialDeclineReason = flight.esm.types.spatial.Types.SpatialDeclineReason;

typedef SpatialFrustum3D = flight.esm.types.spatial.Types.SpatialFrustum3D;

typedef SpatialIndex2D = flight.esm.types.spatial.Types.SpatialIndex2D;

typedef SpatialIndex3D = flight.esm.types.spatial.Types.SpatialIndex3D;

typedef SpatialIndexBackend2D = flight.esm.types.spatial.Types.SpatialIndexBackend2D;

typedef SpatialIndexBackend3D = flight.esm.types.spatial.Types.SpatialIndexBackend3D;

typedef SpatialIndexRuntime2D = flight.esm.types.spatial.Types.SpatialIndexRuntime2D;

typedef SpatialIndexRuntime3D = flight.esm.types.spatial.Types.SpatialIndexRuntime3D;

typedef SpatialIndexingExplanation = flight.esm.types.spatial.Types.SpatialIndexingExplanation;

typedef SpatialIndexingGuard = flight.esm.types.spatial.Types.SpatialIndexingGuard;

typedef SpatialIndexingMode = flight.esm.types.spatial.Types.SpatialIndexingMode;

typedef SpatialIndexingNotice = flight.esm.types.spatial.Types.SpatialIndexingNotice;

typedef SpatialIndexingOperation = flight.esm.types.spatial.Types.SpatialIndexingOperation;

typedef SpatialIndexingReason = flight.esm.types.spatial.Types.SpatialIndexingReason;

typedef SpatialObjectId = flight.esm.types.spatial.Types.SpatialObjectId;

typedef SpatialPair = flight.esm.types.spatial.Types.SpatialPair;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
