package flight._hl;

private extern class Awd2ParsedCamera_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_awd2_parsed_camera_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_awd2_parsed_camera_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Awd2ParsedCamera(hl.Bytes) {
	public var bottom(get, set):Float;

	inline function get_bottom():Float return this.getF64(40);

	inline function set_bottom(value:Float):Float { this.setF64(40, value); return value; }
	public var fov(get, set):Float;

	inline function get_fov():Float return this.getF64(48);

	inline function set_fov(value:Float):Float { this.setF64(48, value); return value; }
	public var left(get, set):Float;

	inline function get_left():Float return this.getF64(56);

	inline function set_left(value:Float):Float { this.setF64(56, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = Awd2ParsedCamera_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Awd2ParsedCamera_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Awd2ParsedCamera_Ffi.set_name(this, raw); return value; }
	public var parentId(get, set):Int;

	inline function get_parentId():Int return this.getI32(80);

	inline function set_parentId(value:Int):Int { this.setI32(80, value); return value; }
	public var projectionType(get, set):Int;

	inline function get_projectionType():Int return this.getUI16(84);

	inline function set_projectionType(value:Int):Int { this.setUI16(84, value); return value; }
	public var right(get, set):Float;

	inline function get_right():Float return this.getF64(64);

	inline function set_right(value:Float):Float { this.setF64(64, value); return value; }
	public var top(get, set):Float;

	inline function get_top():Float return this.getF64(72);

	inline function set_top(value:Float):Float { this.setF64(72, value); return value; }
}
