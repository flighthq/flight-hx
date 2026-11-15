package flight._cpp;

private extern class Skeleton2DDeformAnimationTarget_Ffi {
	@:native("flight_get_skeleton2_ddeform_animation_target_slot_index") static function get_slotIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton2_ddeform_animation_target_slot_index") static function set_slotIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Skeleton2DDeformAnimationTarget(cpp.Star<cpp.Void>) {
	public var slotIndex(get, set):Int;

	inline function get_slotIndex():Int return Skeleton2DDeformAnimationTarget_Ffi.get_slotIndex(this);

	inline function set_slotIndex(value:Int):Int return Skeleton2DDeformAnimationTarget_Ffi.set_slotIndex(this, value);
}
