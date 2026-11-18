package flight._cpp._fn;

extern class QuadBatch {
	@:native("flight_create_quad_batch")
	public static function createQuadBatch():cpp.Star<cpp.Void>;
	@:native("flight_append_quad_batch_instance")
	public static function appendQuadBatchInstance(target:flight._cpp.QuadBatch, id:Int, x:Single, y:Single):Int;
	@:native("flight_clear_quad_batch")
	public static function clearQuadBatch(target:flight._cpp.QuadBatch):Void;
	@:native("flight_clone_quad_batch")
	public static function cloneQuadBatch(source:flight._cpp.QuadBatch):cpp.Star<cpp.Void>;
	@:native("flight_compact_quad_batch")
	public static function compactQuadBatch(target:flight._cpp.QuadBatch):Void;
	@:native("flight_compute_quad_batch_local_bounds_rectangle")
	public static function computeQuadBatchLocalBoundsRectangle(out:flight._cpp.Rectangle, source:flight._cpp.QuadBatch):Void;
	@:native("flight_enable_quad_batch_signals")
	public static function enableQuadBatchSignals(target:flight._cpp.QuadBatch):cpp.Star<cpp.Void>;
	@:native("flight_get_quad_batch_capacity")
	public static function getQuadBatchCapacity(source:flight._cpp.QuadBatch):Int;
	@:native("flight_get_quad_batch_instance_id")
	public static function getQuadBatchInstanceId(source:flight._cpp.QuadBatch, index:Int):Int;
	@:native("flight_get_quad_batch_instance_transform")
	public static function getQuadBatchInstanceTransform(out:flight._cpp.Vector2, source:flight._cpp.QuadBatch, index:Int):Bool;
	@:native("flight_get_quad_batch_signals")
	public static function getQuadBatchSignals(source:flight._cpp.QuadBatch):cpp.Star<cpp.Void>;
	@:native("flight_get_quad_batch_transform_stride")
	public static function getQuadBatchTransformStride(transformType:Int):Int;
	@:native("flight_hit_test_quad_batch_point")
	public static function hitTestQuadBatchPoint(source:flight._cpp.QuadBatch, point:flight._cpp.Vector2):Int;
	@:native("flight_hit_test_quad_batch_point_exact")
	public static function hitTestQuadBatchPointExact(source:flight._cpp.QuadBatch, point:flight._cpp.Vector2):Int;
	@:native("flight_hit_test_quad_batch_point_exact_xy")
	public static function hitTestQuadBatchPointExactXy(source:flight._cpp.QuadBatch, x:Single, y:Single):Int;
	@:native("flight_hit_test_quad_batch_point_xy")
	public static function hitTestQuadBatchPointXy(source:flight._cpp.QuadBatch, x:Single, y:Single):Int;
	@:native("flight_iterate_quad_batch_instances")
	public static function iterateQuadBatchInstances(source:flight._cpp.QuadBatch, visitorFn:cpp.Star<cpp.Void>, visitorCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_remove_quad_batch_instance")
	public static function removeQuadBatchInstance(target:flight._cpp.QuadBatch, index:Int):Void;
	@:native("flight_reserve_quad_batch")
	public static function reserveQuadBatch(target:flight._cpp.QuadBatch, capacity:Int):Void;
	@:native("flight_resize_quad_batch")
	public static function resizeQuadBatch(target:flight._cpp.QuadBatch, instanceCount:Int):Void;
	@:native("flight_set_quad_batch_instance")
	public static function setQuadBatchInstance(target:flight._cpp.QuadBatch, index:Int, id:Int, x:Single, y:Single):Void;
	@:native("flight_set_quad_batch_instance_matrix")
	public static function setQuadBatchInstanceMatrix(target:flight._cpp.QuadBatch, index:Int, id:Int, a:Single, b:Single, c:Single, d:Single, tx:Single, ty:Single):Void;
	@:native("flight_set_quad_batch_instance_range")
	public static function setQuadBatchInstanceRange(target:flight._cpp.QuadBatch, startIndex:Int, count:Int, source:cpp.Star<cpp.Void>, sourceLen:Int):Void;
	@:native("flight_set_quad_batch_instance_tint")
	public static function setQuadBatchInstanceTint(target:flight._cpp.QuadBatch, index:Int, rgba:Int):Void;
	@:native("flight_set_quad_batch_local_bounds_rectangle")
	public static function setQuadBatchLocalBoundsRectangle(target:cpp.Star<cpp.Void>, rect:flight._cpp.Rectangle):Void;
	@:native("flight_set_quad_batch_transform_type")
	public static function setQuadBatchTransformType(target:flight._cpp.QuadBatch, newType:Int):Void;
}
