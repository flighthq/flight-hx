package flight._js._fn;

@:jsRequire("flight")
extern class Spatial {
	@:native("flight_create_bvh_spatial_backend_3d")
	public static function createBvhSpatialBackend3d(margin:Float):flight._js.SpatialIndexBackend3D;
	@:native("flight_explain_spatial_indexing_2d")
	public static function explainSpatialIndexing2d(index:flight._js.SpatialIndex2D, id:Int):flight._js.SpatialIndexingExplanation;
	@:native("flight_explain_spatial_indexing_3d")
	public static function explainSpatialIndexing3d(index:flight._js.SpatialIndex3D, id:Int):flight._js.SpatialIndexingExplanation;
	@:native("flight_format_spatial_indexing_notice")
	public static function formatSpatialIndexingNotice(notice:flight._js.SpatialIndexingNotice):String;
	@:native("flight_free_spatial_index_backend3_d")
	public static function freeSpatialIndexBackend3D(ptr:flight._js.SpatialIndexBackend3D):Void;
	@:native("flight_free_spatial_indexing_explanation")
	public static function freeSpatialIndexingExplanation(ptr:flight._js.SpatialIndexingExplanation):Void;
}
