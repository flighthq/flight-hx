package flight._cpp;

private extern class QuadBatchData_Ffi {
	@:native("flight_get_quad_batch_data_instance_count") static function get_instanceCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_quad_batch_data_instance_count") static function set_instanceCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract QuadBatchData(cpp.Star<cpp.Void>) {
	public var instanceCount(get, set):Int;

	inline function get_instanceCount():Int return QuadBatchData_Ffi.get_instanceCount(this);

	inline function set_instanceCount(value:Int):Int return QuadBatchData_Ffi.set_instanceCount(this, value);
}
