package flight._cpp._fn;

extern class Spatial {
	@:native("flight_create_bvh_spatial_backend_3d")
	public static function createBvhSpatialBackend3d(margin:Float):flight._cpp.SpatialIndexBackend3D;
	@:native("flight_explain_spatial_indexing_2d")
	public static function explainSpatialIndexing2d(index:flight._cpp.SpatialIndex2D, id:Int):flight._cpp.SpatialIndexingExplanation;
	@:native("flight_explain_spatial_indexing_3d")
	public static function explainSpatialIndexing3d(index:flight._cpp.SpatialIndex3D, id:Int):flight._cpp.SpatialIndexingExplanation;
	@:native("flight_format_spatial_indexing_notice")
	public static function formatSpatialIndexingNotice(notice:flight._cpp.SpatialIndexingNotice):cpp.ConstCharStar;
	@:native("flight_free_spatial_index_backend3_d")
	public static function freeSpatialIndexBackend3D(ptr:flight._cpp.SpatialIndexBackend3D):Void;
	@:native("flight_free_spatial_indexing_explanation")
	public static function freeSpatialIndexingExplanation(ptr:flight._cpp.SpatialIndexingExplanation):Void;
}
