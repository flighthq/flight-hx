package flight._hl;

private extern class TweenPropertyDetail_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_tween_property_detail_key")
	static function get_key(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_tween_property_detail_key")
	static function set_key(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TweenPropertyDetail(hl.Bytes) {
	public var change(get, set):Float;

	inline function get_change():Float return this.getF64(0);

	inline function set_change(value:Float):Float { this.setF64(0, value); return value; }
	public var key(get, set):String;
	inline function get_key():String { var raw = TweenPropertyDetail_Ffi.get_key(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TweenPropertyDetail_Ffi.freeString(raw); return value; }
	inline function set_key(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TweenPropertyDetail_Ffi.set_key(this, raw); return value; }
	public var start(get, set):Float;

	inline function get_start():Float return this.getF64(32);

	inline function set_start(value:Float):Float { this.setF64(32, value); return value; }
}
