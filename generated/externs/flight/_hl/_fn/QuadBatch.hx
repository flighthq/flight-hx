package flight._hl._fn;

extern class QuadBatch {
	@:hlNative("flight", "flight_create_quad_batch")
	public static function createQuadBatch():flight._hl.FlightNode;
	@:hlNative("flight", "flight_append_quad_batch_instance")
	public static function appendQuadBatchInstance(target:flight._hl.FlightNode, id:Int, x:Float, y:Float):Int;
	@:hlNative("flight", "flight_clear_quad_batch")
	public static function clearQuadBatch(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_clone_quad_batch")
	public static function cloneQuadBatch(source:flight._hl.FlightNode):flight._hl.FlightNode;
	@:hlNative("flight", "flight_compact_quad_batch")
	public static function compactQuadBatch(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_compute_quad_batch_local_bounds_rectangle")
	public static function computeQuadBatchLocalBoundsRectangle(out:flight._hl.Rectangle, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_enable_quad_batch_signals")
	public static function enableQuadBatchSignals(target:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_get_quad_batch_capacity")
	public static function getQuadBatchCapacity(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_quad_batch_instance_id")
	public static function getQuadBatchInstanceId(source:flight._hl.FlightNode, index:Int):Int;
	@:hlNative("flight", "flight_get_quad_batch_instance_transform")
	public static function getQuadBatchInstanceTransform(out:flight._hl.Vector2, source:flight._hl.FlightNode, index:Int):Bool;
	@:hlNative("flight", "flight_get_quad_batch_signals")
	public static function getQuadBatchSignals(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_get_quad_batch_transform_stride")
	public static function getQuadBatchTransformStride(transformType:Int):Int;
	@:hlNative("flight", "flight_hit_test_quad_batch_point")
	public static function hitTestQuadBatchPoint(source:flight._hl.FlightNode, point:flight._hl.Vector2):Int;
	@:hlNative("flight", "flight_hit_test_quad_batch_point_exact")
	public static function hitTestQuadBatchPointExact(source:flight._hl.FlightNode, point:flight._hl.Vector2):Int;
	@:hlNative("flight", "flight_hit_test_quad_batch_point_exact_xy")
	public static function hitTestQuadBatchPointExactXy(source:flight._hl.FlightNode, x:Float, y:Float):Int;
	@:hlNative("flight", "flight_hit_test_quad_batch_point_xy")
	public static function hitTestQuadBatchPointXy(source:flight._hl.FlightNode, x:Float, y:Float):Int;
	@:hlNative("flight", "flight_iterate_quad_batch_instances")
	public static function iterateQuadBatchInstances(source:flight._hl.FlightNode, visitorFn:hl.Bytes, visitorCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_remove_quad_batch_instance")
	public static function removeQuadBatchInstance(target:flight._hl.FlightNode, index:Int):Void;
	@:hlNative("flight", "flight_reserve_quad_batch")
	public static function reserveQuadBatch(target:flight._hl.FlightNode, capacity:Int):Void;
	@:hlNative("flight", "flight_resize_quad_batch")
	public static function resizeQuadBatch(target:flight._hl.FlightNode, instanceCount:Int):Void;
	@:hlNative("flight", "flight_set_quad_batch_instance")
	public static function setQuadBatchInstance(target:flight._hl.FlightNode, index:Int, id:Int, x:Float, y:Float):Void;
	@:hlNative("flight", "flight_set_quad_batch_instance_matrix")
	public static function setQuadBatchInstanceMatrix(target:flight._hl.FlightNode, index:Int, id:Int, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void;
	@:hlNative("flight", "flight_set_quad_batch_instance_range")
	public static function setQuadBatchInstanceRange(target:flight._hl.FlightNode, startIndex:Int, count:Int, source:hl.Bytes, sourceLen:Int):Void;
	@:hlNative("flight", "flight_set_quad_batch_instance_tint")
	public static function setQuadBatchInstanceTint(target:flight._hl.FlightNode, index:Int, rgba:Int):Void;
	@:hlNative("flight", "flight_set_quad_batch_local_bounds_rectangle")
	public static function setQuadBatchLocalBoundsRectangle(target:flight._hl.FlightNode, rect:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_set_quad_batch_transform_type")
	public static function setQuadBatchTransformType(target:flight._hl.FlightNode, newType:Int):Void;
	@:hlNative("flight", "flight_free_quad_batch_signals_ref")
	public static function freeQuadBatchSignalsRef(ptr:flight._hl.QuadBatchSignals):Void;
}
