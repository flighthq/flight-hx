package flight._hl;

private extern class TextLayoutParams_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_text_layout_params_text")
	static function get_text(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_text_layout_params_text")
	static function set_text(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TextLayoutParams(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(112);

	inline function set_height(value:Single):Single { this.setF32(112, value); return value; }
	public var text(get, set):String;
	inline function get_text():String { var raw = TextLayoutParams_Ffi.get_text(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TextLayoutParams_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TextLayoutParams_Ffi.set_text(this, raw); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(116);

	inline function set_width(value:Single):Single { this.setF32(116, value); return value; }
}
