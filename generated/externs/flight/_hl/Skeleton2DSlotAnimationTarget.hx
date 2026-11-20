package flight._hl;

private extern class Skeleton2DSlotAnimationTarget_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_skeleton2_dslot_animation_target_path")
	static function get_path(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_skeleton2_dslot_animation_target_path")
	static function set_path(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Skeleton2DSlotAnimationTarget(hl.Bytes) {
	public var path(get, set):String;
	inline function get_path():String { var raw = Skeleton2DSlotAnimationTarget_Ffi.get_path(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Skeleton2DSlotAnimationTarget_Ffi.freeString(raw); return value; }
	inline function set_path(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Skeleton2DSlotAnimationTarget_Ffi.set_path(this, raw); return value; }
	public var slotIndex(get, set):Int;

	inline function get_slotIndex():Int return this.getI32(72);

	inline function set_slotIndex(value:Int):Int { this.setI32(72, value); return value; }
}
