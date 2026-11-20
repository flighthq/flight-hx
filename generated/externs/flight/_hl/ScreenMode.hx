package flight._hl;

private extern class ScreenMode_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_screen_mode_pixel_format")
	static function get_pixelFormat(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_screen_mode_pixel_format")
	static function set_pixelFormat(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ScreenMode(hl.Bytes) {
	public var width(get, set):Float;

	inline function get_width():Float return this.getF64(40);

	inline function set_width(value:Float):Float { this.setF64(40, value); return value; }
	public var height(get, set):Float;

	inline function get_height():Float return this.getF64(48);

	inline function set_height(value:Float):Float { this.setF64(48, value); return value; }
	public var refreshRate(get, set):Float;

	inline function get_refreshRate():Float return this.getF64(56);

	inline function set_refreshRate(value:Float):Float { this.setF64(56, value); return value; }
	public var colorDepth(get, set):Float;

	inline function get_colorDepth():Float return this.getF64(64);

	inline function set_colorDepth(value:Float):Float { this.setF64(64, value); return value; }
	public var pixelFormat(get, set):String;
	inline function get_pixelFormat():String { var raw = ScreenMode_Ffi.get_pixelFormat(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ScreenMode_Ffi.freeString(raw); return value; }
	inline function set_pixelFormat(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ScreenMode_Ffi.set_pixelFormat(this, raw); return value; }
}
