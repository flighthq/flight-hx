package flight._hl;

private extern class TextFieldLinkEvent_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_text_field_link_event_url")
	static function get_url(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_text_field_link_event_url")
	static function set_url(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TextFieldLinkEvent(hl.Bytes) {
	public var url(get, set):String;
	inline function get_url():String { var raw = TextFieldLinkEvent_Ffi.get_url(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TextFieldLinkEvent_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TextFieldLinkEvent_Ffi.set_url(this, raw); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(24);

	inline function set_x(value:Float):Float { this.setF64(24, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(32);

	inline function set_y(value:Float):Float { this.setF64(32, value); return value; }
}
