package flight._hl;

private extern class SpritesheetFrame_Ffi {
	@:hlNative("flight", "flight_get_spritesheet_frame_id")
	static function get_id(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_spritesheet_frame_id")
	static function set_id(ptr:hl.Bytes, value:Int):Int;
	@:hlNative("flight", "flight_get_spritesheet_frame_offset_x")
	static function get_offsetX(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_spritesheet_frame_offset_x")
	static function set_offsetX(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_spritesheet_frame_offset_y")
	static function get_offsetY(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_spritesheet_frame_offset_y")
	static function set_offsetY(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_spritesheet_frame_rotated")
	static function get_rotated(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_spritesheet_frame_rotated")
	static function set_rotated(ptr:hl.Bytes, value:Bool):Bool;
}

abstract SpritesheetFrame(hl.Bytes) {
	public var id(get, set):Int;

	inline function get_id():Int return SpritesheetFrame_Ffi.get_id(this);
	inline function set_id(value:Int):Int { SpritesheetFrame_Ffi.set_id(this, value); return value; }
	public var offsetX(get, set):Single;

	inline function get_offsetX():Single return SpritesheetFrame_Ffi.get_offsetX(this);
	inline function set_offsetX(value:Single):Single { SpritesheetFrame_Ffi.set_offsetX(this, value); return value; }
	public var offsetY(get, set):Single;

	inline function get_offsetY():Single return SpritesheetFrame_Ffi.get_offsetY(this);
	inline function set_offsetY(value:Single):Single { SpritesheetFrame_Ffi.set_offsetY(this, value); return value; }
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return SpritesheetFrame_Ffi.get_rotated(this);
	inline function set_rotated(value:Bool):Bool { SpritesheetFrame_Ffi.set_rotated(this, value); return value; }
}
