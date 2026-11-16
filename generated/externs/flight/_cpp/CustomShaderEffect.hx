package flight._cpp;

private extern class CustomShaderEffect_Ffi {
	@:native("flight_field_get_custom_shader_effect_shader_key")
	static function get_shaderKey(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_custom_shader_effect_shader_key")
	static function set_shaderKey(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract CustomShaderEffect(cpp.Star<cpp.Void>) {
	public var shaderKey(get, set):String;
	inline function get_shaderKey():String {
		final bytes = CustomShaderEffect_Ffi.get_shaderKey(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_shaderKey(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		CustomShaderEffect_Ffi.set_shaderKey(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
