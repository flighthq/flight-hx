package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/spatial")
extern class Spatial {
  public static final MAX_INDEXED_CELLS_PER_OBJECT:Float;
  public static function clearSpatialIndex2D(index:flight.esm.types.spatial.Types.SpatialIndex2D):Void;
  public static function clearSpatialIndex3D(index:flight.esm.types.spatial.Types.SpatialIndex3D):Void;
  public static function createBvhSpatialBackend3D(?margin:Float):{ insertSpatialObject:((id:Float, bounds:flight.esm.types.spatial.Types.SpatialAabb3D) -> Bool), updateSpatialObject:((id:Float, bounds:flight.esm.types.spatial.Types.SpatialAabb3D) -> Bool), removeSpatialObject:((id:Float) -> Void), clearSpatialIndex:(() -> Void), explainSpatialIndexing:((id:Float) -> flight.esm.types.spatial.Types.SpatialIndexingExplanation), querySpatialPairs:((out:Array<flight.esm.types.spatial.Types.SpatialPair>) -> Void), querySpatialRegion:((region:flight.esm.types.spatial.Types.SpatialAabb3D, out:Array<Float>) -> Void), querySpatialPoint:((x:Float, y:Float, z:Float, out:Array<Float>) -> Void), querySpatialRay:((x:Float, y:Float, z:Float, dx:Float, dy:Float, dz:Float, out:Array<Float>) -> Void), raw:Dynamic };
  public static function createSpatialIndex2D(?backend:Null<flight.esm.types.spatial.Types.SpatialIndexBackend2D>):flight.esm.types.spatial.Types.SpatialIndex2D;
  public static function createSpatialIndex3D(?backend:Null<flight.esm.types.spatial.Types.SpatialIndexBackend3D>):flight.esm.types.spatial.Types.SpatialIndex3D;
  public static function createUniformGridSpatialBackend2D(cellSize:Float):{ insertSpatialObject:((id:Float, bounds:flight.esm.types.spatial.Types.SpatialAabb2D) -> Bool), updateSpatialObject:((id:Float, bounds:flight.esm.types.spatial.Types.SpatialAabb2D) -> Bool), removeSpatialObject:((id:Float) -> Void), clearSpatialIndex:(() -> Void), explainSpatialIndexing:((id:Float) -> flight.esm.types.spatial.Types.SpatialIndexingExplanation), querySpatialPairs:((out:Array<flight.esm.types.spatial.Types.SpatialPair>) -> Void), querySpatialRegion:((region:flight.esm.types.spatial.Types.SpatialAabb2D, out:Array<Float>) -> Void), querySpatialPoint:((x:Float, y:Float, out:Array<Float>) -> Void), querySpatialRay:((x:Float, y:Float, dx:Float, dy:Float, out:Array<Float>) -> Void), raw:Dynamic };
  public static function createUniformGridSpatialBackend3D(cellSize:Float):{ insertSpatialObject:((id:Float, bounds:flight.esm.types.spatial.Types.SpatialAabb3D) -> Bool), updateSpatialObject:((id:Float, bounds:flight.esm.types.spatial.Types.SpatialAabb3D) -> Bool), removeSpatialObject:((id:Float) -> Void), clearSpatialIndex:(() -> Void), explainSpatialIndexing:((id:Float) -> flight.esm.types.spatial.Types.SpatialIndexingExplanation), querySpatialPairs:((out:Array<flight.esm.types.spatial.Types.SpatialPair>) -> Void), querySpatialRegion:((region:flight.esm.types.spatial.Types.SpatialAabb3D, out:Array<Float>) -> Void), querySpatialPoint:((x:Float, y:Float, z:Float, out:Array<Float>) -> Void), querySpatialRay:((x:Float, y:Float, z:Float, dx:Float, dy:Float, dz:Float, out:Array<Float>) -> Void), raw:Dynamic };
  public static function explainSpatialIndexing2D(index:flight.esm.types.spatial.Types.SpatialIndex2D, id:Float):flight.esm.types.spatial.Types.SpatialIndexingExplanation;
  public static function explainSpatialIndexing3D(index:flight.esm.types.spatial.Types.SpatialIndex3D, id:Float):flight.esm.types.spatial.Types.SpatialIndexingExplanation;
  public static function formatSpatialIndexingNotice(notice:flight.esm.types.spatial.Types.SpatialIndexingNotice):String;
  public static function insertSpatialObject2D(index:flight.esm.types.spatial.Types.SpatialIndex2D, id:Float, bounds:flight.esm.types.spatial.Types.SpatialAabb2D):Bool;
  public static function insertSpatialObject3D(index:flight.esm.types.spatial.Types.SpatialIndex3D, id:Float, bounds:flight.esm.types.spatial.Types.SpatialAabb3D):Bool;
  public static function querySpatialFrustum3D(index:flight.esm.types.spatial.Types.SpatialIndex3D, frustum:flight.esm.types.spatial.Types.SpatialFrustum3D, out:Array<Float>, ?slices:Float):Void;
  public static function querySpatialPairs2D(index:flight.esm.types.spatial.Types.SpatialIndex2D, out:Array<flight.esm.types.spatial.Types.SpatialPair>):Void;
  public static function querySpatialPairs3D(index:flight.esm.types.spatial.Types.SpatialIndex3D, out:Array<flight.esm.types.spatial.Types.SpatialPair>):Void;
  public static function querySpatialPoint2D(index:flight.esm.types.spatial.Types.SpatialIndex2D, x:Float, y:Float, out:Array<Float>):Void;
  public static function querySpatialPoint3D(index:flight.esm.types.spatial.Types.SpatialIndex3D, x:Float, y:Float, z:Float, out:Array<Float>):Void;
  public static function querySpatialRay2D(index:flight.esm.types.spatial.Types.SpatialIndex2D, x:Float, y:Float, dx:Float, dy:Float, out:Array<Float>):Void;
  public static function querySpatialRay3D(index:flight.esm.types.spatial.Types.SpatialIndex3D, x:Float, y:Float, z:Float, dx:Float, dy:Float, dz:Float, out:Array<Float>):Void;
  public static function querySpatialRegion2D(index:flight.esm.types.spatial.Types.SpatialIndex2D, region:flight.esm.types.spatial.Types.SpatialAabb2D, out:Array<Float>):Void;
  public static function querySpatialRegion3D(index:flight.esm.types.spatial.Types.SpatialIndex3D, region:flight.esm.types.spatial.Types.SpatialAabb3D, out:Array<Float>):Void;
  public static function querySpatialSphere3D(index:flight.esm.types.spatial.Types.SpatialIndex3D, x:Float, y:Float, z:Float, radius:Float, out:Array<Float>):Void;
  public static function removeSpatialObject2D(index:flight.esm.types.spatial.Types.SpatialIndex2D, id:Float):Void;
  public static function removeSpatialObject3D(index:flight.esm.types.spatial.Types.SpatialIndex3D, id:Float):Void;
  public static function reportSpatialIndexing(notice:flight.esm.types.spatial.Types.SpatialIndexingNotice):Void;
  public static function setSpatialIndexingGuard(guard:Null<flight.esm.types.spatial.Types.SpatialIndexingGuard>):Void;
  public static function updateSpatialObject2D(index:flight.esm.types.spatial.Types.SpatialIndex2D, id:Float, bounds:flight.esm.types.spatial.Types.SpatialAabb2D):Bool;
  public static function updateSpatialObject3D(index:flight.esm.types.spatial.Types.SpatialIndex3D, id:Float, bounds:flight.esm.types.spatial.Types.SpatialAabb3D):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
