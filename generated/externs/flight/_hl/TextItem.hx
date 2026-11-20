package flight._hl;

private extern class TextItem_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_text_item_script")
	static function get_script(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_text_item_script")
	static function set_script(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TextItem(hl.Bytes) {
	public var end(get, set):Int;

	inline function get_end():Int return this.getI32(24);

	inline function set_end(value:Int):Int { this.setI32(24, value); return value; }
	public var script(get, set):String;
	inline function get_script():String { var raw = TextItem_Ffi.get_script(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TextItem_Ffi.freeString(raw); return value; }
	inline function set_script(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TextItem_Ffi.set_script(this, raw); return value; }
	public var start(get, set):Int;

	inline function get_start():Int return this.getI32(32);

	inline function set_start(value:Int):Int { this.setI32(32, value); return value; }
}
