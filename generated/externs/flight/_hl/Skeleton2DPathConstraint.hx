package flight._hl;

private extern class Skeleton2DPathConstraint_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_skeleton2_dpath_constraint_position_mode")
	static function get_positionMode(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_skeleton2_dpath_constraint_position_mode")
	static function set_positionMode(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_skeleton2_dpath_constraint_rotate_mode")
	static function get_rotateMode(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_skeleton2_dpath_constraint_rotate_mode")
	static function set_rotateMode(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_skeleton2_dpath_constraint_spacing_mode")
	static function get_spacingMode(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_skeleton2_dpath_constraint_spacing_mode")
	static function set_spacingMode(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Skeleton2DPathConstraint(hl.Bytes) {
	public var mix(get, set):Float;

	inline function get_mix():Float return this.getF64(64);

	inline function set_mix(value:Float):Float { this.setF64(64, value); return value; }
	public var mixRotate(get, set):Float;

	inline function get_mixRotate():Float return this.getF64(72);

	inline function set_mixRotate(value:Float):Float { this.setF64(72, value); return value; }
	public var mixX(get, set):Float;

	inline function get_mixX():Float return this.getF64(80);

	inline function set_mixX(value:Float):Float { this.setF64(80, value); return value; }
	public var mixY(get, set):Float;

	inline function get_mixY():Float return this.getF64(88);

	inline function set_mixY(value:Float):Float { this.setF64(88, value); return value; }
	public var position(get, set):Float;

	inline function get_position():Float return this.getF64(96);

	inline function set_position(value:Float):Float { this.setF64(96, value); return value; }
	public var positionMode(get, set):String;
	inline function get_positionMode():String { var raw = Skeleton2DPathConstraint_Ffi.get_positionMode(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Skeleton2DPathConstraint_Ffi.freeString(raw); return value; }
	inline function set_positionMode(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Skeleton2DPathConstraint_Ffi.set_positionMode(this, raw); return value; }
	public var rotateMode(get, set):String;
	inline function get_rotateMode():String { var raw = Skeleton2DPathConstraint_Ffi.get_rotateMode(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Skeleton2DPathConstraint_Ffi.freeString(raw); return value; }
	inline function set_rotateMode(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Skeleton2DPathConstraint_Ffi.set_rotateMode(this, raw); return value; }
	public var spacing(get, set):Float;

	inline function get_spacing():Float return this.getF64(152);

	inline function set_spacing(value:Float):Float { this.setF64(152, value); return value; }
	public var spacingMode(get, set):String;
	inline function get_spacingMode():String { var raw = Skeleton2DPathConstraint_Ffi.get_spacingMode(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Skeleton2DPathConstraint_Ffi.freeString(raw); return value; }
	inline function set_spacingMode(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Skeleton2DPathConstraint_Ffi.set_spacingMode(this, raw); return value; }
	public var targetSlotIndex(get, set):Int;

	inline function get_targetSlotIndex():Int return this.getI32(184);

	inline function set_targetSlotIndex(value:Int):Int { this.setI32(184, value); return value; }
}
