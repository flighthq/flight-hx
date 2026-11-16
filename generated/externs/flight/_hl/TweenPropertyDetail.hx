package flight._hl;

private extern class TweenPropertyDetail_Ffi {
	@:hlNative("flight", "flight_field_get_tween_property_detail_key")
	static function get_key(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_tween_property_detail_key")
	static function set_key(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract TweenPropertyDetail(hl.Bytes) {
	public var change(get, set):Single;

	inline function get_change():Single return this.getF32(0);

	inline function set_change(value:Single):Single { this.setF32(0, value); return value; }
	public var key(get, set):String;
	inline function get_key():String {
		final bytes = TweenPropertyDetail_Ffi.get_key(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_key(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TweenPropertyDetail_Ffi.set_key(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var start(get, set):Single;

	inline function get_start():Single return this.getF32(32);

	inline function set_start(value:Single):Single { this.setF32(32, value); return value; }
}
