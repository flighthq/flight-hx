package flight._hl;

private extern class InputTextData_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_input_text_data_text")
	static function get_text(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_input_text_data_text")
	static function set_text(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract InputTextData(hl.Bytes) {
	public var isComposing(get, set):Bool;

	inline function get_isComposing():Bool return this.getUI8(0) != 0;

	inline function set_isComposing(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var text(get, set):String;
	inline function get_text():String { var raw = InputTextData_Ffi.get_text(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); InputTextData_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } InputTextData_Ffi.set_text(this, raw); return value; }
}
