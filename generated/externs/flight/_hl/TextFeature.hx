package flight._hl;

private extern class TextFeature_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_text_feature_tag")
	static function get_tag(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_text_feature_tag")
	static function set_tag(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TextFeature(hl.Bytes) {
	public var tag(get, set):String;
	inline function get_tag():String { var raw = TextFeature_Ffi.get_tag(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TextFeature_Ffi.freeString(raw); return value; }
	inline function set_tag(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TextFeature_Ffi.set_tag(this, raw); return value; }
	public var value(get, set):Int;

	inline function get_value():Int return this.getI32(40);

	inline function set_value(value:Int):Int { this.setI32(40, value); return value; }
}
