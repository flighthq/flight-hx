package flight._cpp;

private extern class Skeleton2DSlotAnimationTarget_Ffi {
	@:native("flight_field_get_skeleton2_dslot_animation_target_path")
	static function get_path(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_skeleton2_dslot_animation_target_path")
	static function set_path(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_skeleton2_dslot_animation_target_slot_index") static function get_slotIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton2_dslot_animation_target_slot_index") static function set_slotIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Skeleton2DSlotAnimationTarget(cpp.Star<cpp.Void>) {
	public var path(get, set):String;
	inline function get_path():String {
		final bytes = Skeleton2DSlotAnimationTarget_Ffi.get_path(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_path(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Skeleton2DSlotAnimationTarget_Ffi.set_path(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var slotIndex(get, set):Int;

	inline function get_slotIndex():Int return Skeleton2DSlotAnimationTarget_Ffi.get_slotIndex(this);

	inline function set_slotIndex(value:Int):Int { Skeleton2DSlotAnimationTarget_Ffi.set_slotIndex(this, value); return value; }
}
