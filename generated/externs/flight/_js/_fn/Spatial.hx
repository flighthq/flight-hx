package flight._js._fn;

@:jsRequire("@flighthq/spatial")
extern class Spatial {
	@:native("createBvhSpatialBackend3D")
	public static function createBvhSpatialBackend3d(margin:Null<Float>):flight._js.SpatialIndexBackend3D;
	@:native("explainSpatialIndexing2D")
	public static function explainSpatialIndexing2d(index:flight._js.SpatialIndex2D, id:Int):flight._js.SpatialIndexingExplanation;
	@:native("explainSpatialIndexing3D")
	public static function explainSpatialIndexing3d(index:flight._js.SpatialIndex3D, id:Int):flight._js.SpatialIndexingExplanation;
	@:native("formatSpatialIndexingNotice")
	public static function formatSpatialIndexingNotice(notice:flight._js.SpatialIndexingNotice):String;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpatialIndexBackend3D(ptr:flight._js.SpatialIndexBackend3D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpatialIndexingExplanation(ptr:flight._js.SpatialIndexingExplanation):Void {}
}
