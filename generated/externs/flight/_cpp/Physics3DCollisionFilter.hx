package flight._cpp;

private extern class Physics3DCollisionFilter_Ffi {
	@:native("flight_get_physics3_dcollision_filter_category_bits") static function get_categoryBits(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dcollision_filter_category_bits") static function set_categoryBits(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dcollision_filter_mask_bits") static function get_maskBits(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dcollision_filter_mask_bits") static function set_maskBits(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dcollision_filter_group_index") static function get_groupIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dcollision_filter_group_index") static function set_groupIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics3DCollisionFilter(cpp.Star<cpp.Void>) {
	public var categoryBits(get, set):Int;

	inline function get_categoryBits():Int return Physics3DCollisionFilter_Ffi.get_categoryBits(this);

	inline function set_categoryBits(value:Int):Int { Physics3DCollisionFilter_Ffi.set_categoryBits(this, value); return value; }
	public var maskBits(get, set):Int;

	inline function get_maskBits():Int return Physics3DCollisionFilter_Ffi.get_maskBits(this);

	inline function set_maskBits(value:Int):Int { Physics3DCollisionFilter_Ffi.set_maskBits(this, value); return value; }
	public var groupIndex(get, set):Int;

	inline function get_groupIndex():Int return Physics3DCollisionFilter_Ffi.get_groupIndex(this);

	inline function set_groupIndex(value:Int):Int { Physics3DCollisionFilter_Ffi.set_groupIndex(this, value); return value; }
}
