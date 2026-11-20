package flight._hl;

private extern class TextLabelData_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_text_label_data_text")
	static function get_text(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_text_label_data_text")
	static function set_text(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TextLabelData(hl.Bytes) {
	public var height(get, set):Float;

	inline function get_height():Float return this.getF64(24);

	inline function set_height(value:Float):Float { this.setF64(24, value); return value; }
	public var text(get, set):String;
	inline function get_text():String { var raw = TextLabelData_Ffi.get_text(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TextLabelData_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TextLabelData_Ffi.set_text(this, raw); return value; }
	public var width(get, set):Float;

	inline function get_width():Float return this.getF64(72);

	inline function set_width(value:Float):Float { this.setF64(72, value); return value; }
}
