package flight._js._fn;

@:jsRequire("flight")
extern class Quadbatch {
	@:native("flight_create_quad_batch")
	public static function createQuadBatch():Dynamic;
	@:native("flight_create_quad_batch_data")
	public static function createQuadBatchData():flight._js.QuadBatchData;
	@:native("flight_create_quad_batch_runtime")
	public static function createQuadBatchRuntime():flight._js.Node2DRuntime;
	@:native("flight_create_quad_batch_signals")
	public static function createQuadBatchSignals():Dynamic;
	@:native("flight_append_quad_batch_instance")
	public static function appendQuadBatchInstance(target:flight._js.QuadBatch, id:Int, x:Float, y:Float):Int;
	@:native("flight_clear_quad_batch")
	public static function clearQuadBatch(target:flight._js.QuadBatch):Void;
	@:native("flight_clone_quad_batch")
	public static function cloneQuadBatch(source:flight._js.QuadBatch):Dynamic;
	@:native("flight_compact_quad_batch")
	public static function compactQuadBatch(target:flight._js.QuadBatch):Void;
	@:native("flight_compute_quad_batch_local_bounds_rectangle")
	public static function computeQuadBatchLocalBoundsRectangle(out:flight._js.Rectangle, source:flight._js.QuadBatch):Void;
	@:native("flight_enable_quad_batch_signals")
	public static function enableQuadBatchSignals(target:flight._js.QuadBatch):Dynamic;
	@:native("flight_get_quad_batch_capacity")
	public static function getQuadBatchCapacity(source:flight._js.QuadBatch):Int;
	@:native("flight_get_quad_batch_instance_id")
	public static function getQuadBatchInstanceId(source:flight._js.QuadBatch, index:Int):Int;
	@:native("flight_get_quad_batch_instance_transform")
	public static function getQuadBatchInstanceTransform(out:flight._js.Vector2, source:flight._js.QuadBatch, index:Int):Bool;
	@:native("flight_get_quad_batch_runtime")
	public static function getQuadBatchRuntime(source:flight._js.QuadBatch):Dynamic;
	@:native("flight_get_quad_batch_signals")
	public static function getQuadBatchSignals(source:flight._js.QuadBatch):Dynamic;
	@:native("flight_get_quad_batch_transform_stride")
	public static function getQuadBatchTransformStride(transformType:Int):Int;
	@:native("flight_hit_test_quad_batch_point")
	public static function hitTestQuadBatchPoint(source:flight._js.QuadBatch, point:flight._js.Vector2):Int;
	@:native("flight_hit_test_quad_batch_point_exact")
	public static function hitTestQuadBatchPointExact(source:flight._js.QuadBatch, point:flight._js.Vector2):Int;
	@:native("flight_hit_test_quad_batch_point_exact_xy")
	public static function hitTestQuadBatchPointExactXy(source:flight._js.QuadBatch, x:Float, y:Float):Int;
	@:native("flight_hit_test_quad_batch_point_xy")
	public static function hitTestQuadBatchPointXy(source:flight._js.QuadBatch, x:Float, y:Float):Int;
	@:native("flight_iterate_quad_batch_instances")
	public static function iterateQuadBatchInstances(source:flight._js.QuadBatch, visitorFn:Dynamic, visitorCtx:Dynamic):Void;
	@:native("flight_remove_quad_batch_instance")
	public static function removeQuadBatchInstance(target:flight._js.QuadBatch, index:Int):Void;
	@:native("flight_reserve_quad_batch")
	public static function reserveQuadBatch(target:flight._js.QuadBatch, capacity:Int):Void;
	@:native("flight_resize_quad_batch")
	public static function resizeQuadBatch(target:flight._js.QuadBatch, instanceCount:Int):Void;
	@:native("flight_set_quad_batch_instance")
	public static function setQuadBatchInstance(target:flight._js.QuadBatch, index:Int, id:Int, x:Float, y:Float):Void;
	@:native("flight_set_quad_batch_instance_matrix")
	public static function setQuadBatchInstanceMatrix(target:flight._js.QuadBatch, index:Int, id:Int, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void;
	@:native("flight_set_quad_batch_instance_range")
	public static function setQuadBatchInstanceRange(target:flight._js.QuadBatch, startIndex:Int, count:Int, source:Dynamic, sourceLen:Int):Void;
	@:native("flight_set_quad_batch_instance_tint")
	public static function setQuadBatchInstanceTint(target:flight._js.QuadBatch, index:Int, rgba:Int):Void;
	@:native("flight_set_quad_batch_local_bounds_rectangle")
	public static function setQuadBatchLocalBoundsRectangle(target:Dynamic, rect:flight._js.Rectangle):Void;
	@:native("flight_set_quad_batch_transform_type")
	public static function setQuadBatchTransformType(target:flight._js.QuadBatch, newType:Int):Void;
	@:native("flight_free_quad_batch_data")
	public static function freeQuadBatchData(ptr:flight._js.QuadBatchData):Void;
}
