package flight._hl._fn;

extern class Spatial {
	@:hlNative("flight", "flight_create_bvh_spatial_backend_3d")
	public static function createBvhSpatialBackend3d(margin:Float):flight._hl.SpatialIndexBackend3D;
	@:hlNative("flight", "flight_explain_spatial_indexing_2d")
	public static function explainSpatialIndexing2d(index:flight._hl.SpatialIndex2D, id:Int):flight._hl.SpatialIndexingExplanation;
	@:hlNative("flight", "flight_explain_spatial_indexing_3d")
	public static function explainSpatialIndexing3d(index:flight._hl.SpatialIndex3D, id:Int):flight._hl.SpatialIndexingExplanation;
	@:hlNative("flight", "flight_format_spatial_indexing_notice")
	public static function formatSpatialIndexingNotice(notice:flight._hl.SpatialIndexingNotice):hl.Bytes;
	@:hlNative("flight", "flight_free_spatial_index_backend3_d")
	public static function freeSpatialIndexBackend3D(ptr:flight._hl.SpatialIndexBackend3D):Void;
	@:hlNative("flight", "flight_free_spatial_indexing_explanation")
	public static function freeSpatialIndexingExplanation(ptr:flight._hl.SpatialIndexingExplanation):Void;
}
