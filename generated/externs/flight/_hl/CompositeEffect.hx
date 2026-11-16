package flight._hl;

private extern class CompositeEffect_Ffi {
	@:hlNative("flight", "flight_field_get_composite_effect_operator")
	static function get_operator_(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_composite_effect_operator")
	static function set_operator_(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract CompositeEffect(hl.Bytes) {
	public var operator_(get, set):String;
	inline function get_operator_():String {
		final bytes = CompositeEffect_Ffi.get_operator_(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_operator_(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		CompositeEffect_Ffi.set_operator_(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
