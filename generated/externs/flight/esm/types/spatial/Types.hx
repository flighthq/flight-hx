package flight.esm.types.spatial;

#if (js && flight_esm)
typedef SpatialAabb2D = { minX:Float, minY:Float, maxX:Float, maxY:Float };

typedef SpatialAabb3D = { minX:Float, minY:Float, minZ:Float, maxX:Float, maxY:Float, maxZ:Float };

typedef SpatialDeclineReason = String;

typedef SpatialFrustum3D = { corners:Array<Float> };

typedef SpatialIndex2D = { runtime:flight.esm.types.spatial.Types.SpatialIndexRuntime2D };

typedef SpatialIndex3D = { runtime:flight.esm.types.spatial.Types.SpatialIndexRuntime3D };

typedef SpatialIndexBackend2D = { insertSpatialObject:((id:Float, bounds:flight.esm.types.spatial.Types.SpatialAabb2D) -> Bool), updateSpatialObject:((id:Float, bounds:flight.esm.types.spatial.Types.SpatialAabb2D) -> Bool), removeSpatialObject:((id:Float) -> Void), clearSpatialIndex:(() -> Void), explainSpatialIndexing:((id:Float) -> flight.esm.types.spatial.Types.SpatialIndexingExplanation), querySpatialPairs:((out:Array<flight.esm.types.spatial.Types.SpatialPair>) -> Void), querySpatialRegion:((region:flight.esm.types.spatial.Types.SpatialAabb2D, out:Array<Float>) -> Void), querySpatialPoint:((x:Float, y:Float, out:Array<Float>) -> Void), querySpatialRay:((x:Float, y:Float, dx:Float, dy:Float, out:Array<Float>) -> Void) };

typedef SpatialIndexBackend3D = { insertSpatialObject:((id:Float, bounds:flight.esm.types.spatial.Types.SpatialAabb3D) -> Bool), updateSpatialObject:((id:Float, bounds:flight.esm.types.spatial.Types.SpatialAabb3D) -> Bool), removeSpatialObject:((id:Float) -> Void), clearSpatialIndex:(() -> Void), explainSpatialIndexing:((id:Float) -> flight.esm.types.spatial.Types.SpatialIndexingExplanation), querySpatialPairs:((out:Array<flight.esm.types.spatial.Types.SpatialPair>) -> Void), querySpatialRegion:((region:flight.esm.types.spatial.Types.SpatialAabb3D, out:Array<Float>) -> Void), querySpatialPoint:((x:Float, y:Float, z:Float, out:Array<Float>) -> Void), querySpatialRay:((x:Float, y:Float, z:Float, dx:Float, dy:Float, dz:Float, out:Array<Float>) -> Void) };

typedef SpatialIndexRuntime2D = { backend:flight.esm.types.spatial.Types.SpatialIndexBackend2D };

typedef SpatialIndexRuntime3D = { backend:flight.esm.types.spatial.Types.SpatialIndexBackend3D };

typedef SpatialIndexingExplanation = { id:Float, mode:flight.esm.types.spatial.Types.SpatialIndexingMode, bucketCount:Float, reason:Null<String> };

typedef SpatialIndexingGuard = ((notice:flight.esm.types.spatial.Types.SpatialIndexingNotice) -> Void);

typedef SpatialIndexingMode = String;

typedef SpatialIndexingNotice = { cellSize:Float, id:Float, mode:flight.esm.types.spatial.Types.SpatialIndexingMode, operation:flight.esm.types.spatial.Types.SpatialIndexingOperation, wouldOccupyBucketCount:Float, reason:Null<String> };

typedef SpatialIndexingOperation = String;

typedef SpatialIndexingReason = String;

typedef SpatialObjectId = Float;

typedef SpatialPair = { a:Float, b:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
