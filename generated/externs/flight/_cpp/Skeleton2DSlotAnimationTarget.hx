package flight._cpp;

private extern class Skeleton2DSlotAnimationTarget_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_skeleton2_dslot_animation_target_path") static function get_path(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_skeleton2_dslot_animation_target_path") static function set_path(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_skeleton2_dslot_animation_target_slot_index") static function get_slotIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton2_dslot_animation_target_slot_index") static function set_slotIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Skeleton2DSlotAnimationTarget(cpp.Star<cpp.Void>) {
	public var path(get, set):String;
	inline function get_path():String { var raw = Skeleton2DSlotAnimationTarget_Ffi.get_path(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Skeleton2DSlotAnimationTarget_Ffi.freeString(raw); return value; }
	inline function set_path(value:String):String { var raw:cpp.ConstCharStar = cast value; Skeleton2DSlotAnimationTarget_Ffi.set_path(this, raw); return value; }
	public var slotIndex(get, set):Int;

	inline function get_slotIndex():Int return Skeleton2DSlotAnimationTarget_Ffi.get_slotIndex(this);

	inline function set_slotIndex(value:Int):Int { Skeleton2DSlotAnimationTarget_Ffi.set_slotIndex(this, value); return value; }
}
