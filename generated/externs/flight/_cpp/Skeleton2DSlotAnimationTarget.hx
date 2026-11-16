package flight._cpp;

private extern class Skeleton2DSlotAnimationTarget_Ffi {
	@:native("flight_get_skeleton2_dslot_animation_target_slot_index") static function get_slotIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton2_dslot_animation_target_slot_index") static function set_slotIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Skeleton2DSlotAnimationTarget(cpp.Star<cpp.Void>) {
	public var slotIndex(get, set):Int;

	inline function get_slotIndex():Int return Skeleton2DSlotAnimationTarget_Ffi.get_slotIndex(this);

	inline function set_slotIndex(value:Int):Int { Skeleton2DSlotAnimationTarget_Ffi.set_slotIndex(this, value); return value; }
}
