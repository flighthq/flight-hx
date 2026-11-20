package flight._hl;

private extern class SpritesheetFrameData_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_spritesheet_frame_data_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_spritesheet_frame_data_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract SpritesheetFrameData(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(16);

	inline function set_height(value:Single):Single { this.setF32(16, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = SpritesheetFrameData_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); SpritesheetFrameData_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } SpritesheetFrameData_Ffi.set_name(this, raw); return value; }
	public var offsetX(get, set):Single;

	inline function get_offsetX():Single return this.getF32(48);

	inline function set_offsetX(value:Single):Single { this.setF32(48, value); return value; }
	public var offsetY(get, set):Single;

	inline function get_offsetY():Single return this.getF32(52);

	inline function set_offsetY(value:Single):Single { this.setF32(52, value); return value; }
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return this.getUI8(72) != 0;

	inline function set_rotated(value:Bool):Bool { this.setUI8(72, value ? 1 : 0); return value; }
	public var sourceHeight(get, set):Single;

	inline function get_sourceHeight():Single return this.getF32(76);

	inline function set_sourceHeight(value:Single):Single { this.setF32(76, value); return value; }
	public var sourceWidth(get, set):Single;

	inline function get_sourceWidth():Single return this.getF32(80);

	inline function set_sourceWidth(value:Single):Single { this.setF32(80, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(84);

	inline function set_width(value:Single):Single { this.setF32(84, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(88);

	inline function set_x(value:Single):Single { this.setF32(88, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(92);

	inline function set_y(value:Single):Single { this.setF32(92, value); return value; }
}
