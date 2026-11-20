package flight._hl;

private extern class TextSegment_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_text_segment_text")
	static function get_text(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_text_segment_text")
	static function set_text(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TextSegment(hl.Bytes) {
	public var start(get, set):Int;

	inline function get_start():Int return this.getI32(0);

	inline function set_start(value:Int):Int { this.setI32(0, value); return value; }
	public var end(get, set):Int;

	inline function get_end():Int return this.getI32(8);

	inline function set_end(value:Int):Int { this.setI32(8, value); return value; }
	public var text(get, set):String;
	inline function get_text():String { var raw = TextSegment_Ffi.get_text(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TextSegment_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TextSegment_Ffi.set_text(this, raw); return value; }
}
