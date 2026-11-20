package flight._hl;

private extern class NetResponseExplanation_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_net_response_explanation_status_text")
	static function get_statusText(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_net_response_explanation_status_text")
	static function set_statusText(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_net_response_explanation_url")
	static function get_url(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_net_response_explanation_url")
	static function set_url(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract NetResponseExplanation(hl.Bytes) {
	public var status(get, set):Int;

	inline function get_status():Int return this.getI32(52);

	inline function set_status(value:Int):Int { this.setI32(52, value); return value; }
	public var statusText(get, set):String;
	inline function get_statusText():String { var raw = NetResponseExplanation_Ffi.get_statusText(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); NetResponseExplanation_Ffi.freeString(raw); return value; }
	inline function set_statusText(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } NetResponseExplanation_Ffi.set_statusText(this, raw); return value; }
	public var url(get, set):String;
	inline function get_url():String { var raw = NetResponseExplanation_Ffi.get_url(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); NetResponseExplanation_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } NetResponseExplanation_Ffi.set_url(this, raw); return value; }
}
