package flight._hl;

private extern class Scene2DDocumentFetchProgress_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_scene2_ddocument_fetch_progress_url")
	static function get_url(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_scene2_ddocument_fetch_progress_url")
	static function set_url(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Scene2DDocumentFetchProgress(hl.Bytes) {
	public var loaded(get, set):Int;

	inline function get_loaded():Int return this.getI32(24);

	inline function set_loaded(value:Int):Int { this.setI32(24, value); return value; }
	public var total(get, set):Int;

	inline function get_total():Int return this.getI32(32);

	inline function set_total(value:Int):Int { this.setI32(32, value); return value; }
	public var url(get, set):String;
	inline function get_url():String { var raw = Scene2DDocumentFetchProgress_Ffi.get_url(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Scene2DDocumentFetchProgress_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Scene2DDocumentFetchProgress_Ffi.set_url(this, raw); return value; }
}
