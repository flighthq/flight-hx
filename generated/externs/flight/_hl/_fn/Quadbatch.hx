package flight._hl._fn;

extern class Quadbatch {
	@:hlNative("flight", "flight_create_quad_batch")
	public static function createQuadBatch():Dynamic;
	@:hlNative("flight", "flight_create_quad_batch_data")
	public static function createQuadBatchData():flight._hl.QuadBatchData;
	@:hlNative("flight", "flight_create_quad_batch_runtime")
	public static function createQuadBatchRuntime():flight._hl.Node2DRuntime;
	@:hlNative("flight", "flight_create_quad_batch_signals")
	public static function createQuadBatchSignals():Dynamic;
	@:hlNative("flight", "flight_append_quad_batch_instance")
	public static function appendQuadBatchInstance(target:flight._hl.QuadBatch, id:Int, x:Single, y:Single):Int;
	@:hlNative("flight", "flight_clear_quad_batch")
	public static function clearQuadBatch(target:flight._hl.QuadBatch):Void;
	@:hlNative("flight", "flight_clone_quad_batch")
	public static function cloneQuadBatch(source:flight._hl.QuadBatch):Dynamic;
	@:hlNative("flight", "flight_compact_quad_batch")
	public static function compactQuadBatch(target:flight._hl.QuadBatch):Void;
	@:hlNative("flight", "flight_compute_quad_batch_local_bounds_rectangle")
	public static function computeQuadBatchLocalBoundsRectangle(out:flight._hl.Rectangle, source:flight._hl.QuadBatch):Void;
	@:hlNative("flight", "flight_enable_quad_batch_signals")
	public static function enableQuadBatchSignals(target:flight._hl.QuadBatch):Dynamic;
	@:hlNative("flight", "flight_get_quad_batch_capacity")
	public static function getQuadBatchCapacity(source:flight._hl.QuadBatch):Int;
	@:hlNative("flight", "flight_get_quad_batch_instance_id")
	public static function getQuadBatchInstanceId(source:flight._hl.QuadBatch, index:Int):Int;
	@:hlNative("flight", "flight_get_quad_batch_instance_transform")
	public static function getQuadBatchInstanceTransform(out:flight._hl.Vector2, source:flight._hl.QuadBatch, index:Int):Bool;
	@:hlNative("flight", "flight_get_quad_batch_runtime")
	public static function getQuadBatchRuntime(source:flight._hl.QuadBatch):Dynamic;
	@:hlNative("flight", "flight_get_quad_batch_signals")
	public static function getQuadBatchSignals(source:flight._hl.QuadBatch):Dynamic;
	@:hlNative("flight", "flight_get_quad_batch_transform_stride")
	public static function getQuadBatchTransformStride(transformType:Int):Int;
	@:hlNative("flight", "flight_hit_test_quad_batch_point")
	public static function hitTestQuadBatchPoint(source:flight._hl.QuadBatch, point:flight._hl.Vector2):Int;
	@:hlNative("flight", "flight_hit_test_quad_batch_point_exact")
	public static function hitTestQuadBatchPointExact(source:flight._hl.QuadBatch, point:flight._hl.Vector2):Int;
	@:hlNative("flight", "flight_hit_test_quad_batch_point_exact_xy")
	public static function hitTestQuadBatchPointExactXy(source:flight._hl.QuadBatch, x:Single, y:Single):Int;
	@:hlNative("flight", "flight_hit_test_quad_batch_point_xy")
	public static function hitTestQuadBatchPointXy(source:flight._hl.QuadBatch, x:Single, y:Single):Int;
	@:hlNative("flight", "flight_iterate_quad_batch_instances")
	public static function iterateQuadBatchInstances(source:flight._hl.QuadBatch, visitorFn:Dynamic, visitorCtx:Dynamic):Void;
	@:hlNative("flight", "flight_remove_quad_batch_instance")
	public static function removeQuadBatchInstance(target:flight._hl.QuadBatch, index:Int):Void;
	@:hlNative("flight", "flight_reserve_quad_batch")
	public static function reserveQuadBatch(target:flight._hl.QuadBatch, capacity:Int):Void;
	@:hlNative("flight", "flight_resize_quad_batch")
	public static function resizeQuadBatch(target:flight._hl.QuadBatch, instanceCount:Int):Void;
	@:hlNative("flight", "flight_set_quad_batch_instance")
	public static function setQuadBatchInstance(target:flight._hl.QuadBatch, index:Int, id:Int, x:Single, y:Single):Void;
	@:hlNative("flight", "flight_set_quad_batch_instance_matrix")
	public static function setQuadBatchInstanceMatrix(target:flight._hl.QuadBatch, index:Int, id:Int, a:Single, b:Single, c:Single, d:Single, tx:Single, ty:Single):Void;
	@:hlNative("flight", "flight_set_quad_batch_instance_range")
	public static function setQuadBatchInstanceRange(target:flight._hl.QuadBatch, startIndex:Int, count:Int, source:hl.Bytes, sourceLen:Int):Void;
	@:hlNative("flight", "flight_set_quad_batch_instance_tint")
	public static function setQuadBatchInstanceTint(target:flight._hl.QuadBatch, index:Int, rgba:Int):Void;
	@:hlNative("flight", "flight_set_quad_batch_local_bounds_rectangle")
	public static function setQuadBatchLocalBoundsRectangle(target:Dynamic, rect:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_set_quad_batch_transform_type")
	public static function setQuadBatchTransformType(target:flight._hl.QuadBatch, newType:Int):Void;
	@:hlNative("flight", "flight_free_quad_batch_data")
	public static function freeQuadBatchData(ptr:flight._hl.QuadBatchData):Void;
}
