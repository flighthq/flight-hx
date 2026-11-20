package flight._hl;

private extern class TextLabelContentExplanation_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_text_label_content_explanation_live_string")
	static function get_liveString(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_text_label_content_explanation_live_string")
	static function set_liveString(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TextLabelContentExplanation(hl.Bytes) {
	public var agreement(get, set):Bool;

	inline function get_agreement():Bool return this.getUI8(0) != 0;

	inline function set_agreement(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var liveString(get, set):String;
	inline function get_liveString():String { var raw = TextLabelContentExplanation_Ffi.get_liveString(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TextLabelContentExplanation_Ffi.freeString(raw); return value; }
	inline function set_liveString(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TextLabelContentExplanation_Ffi.set_liveString(this, raw); return value; }
	public var revision(get, set):Int;

	inline function get_revision():Int return this.getI32(56);

	inline function set_revision(value:Int):Int { this.setI32(56, value); return value; }
}
