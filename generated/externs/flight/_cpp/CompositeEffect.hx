package flight._cpp;

private extern class CompositeEffect_Ffi {
	@:native("flight_field_get_composite_effect_operator")
	static function get_operator_(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_composite_effect_operator")
	static function set_operator_(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract CompositeEffect(cpp.Star<cpp.Void>) {
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
		CompositeEffect_Ffi.set_operator_(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
