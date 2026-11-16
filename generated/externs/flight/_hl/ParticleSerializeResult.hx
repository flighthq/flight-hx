package flight._hl;

private extern class ParticleSerializeResult_Ffi {
	@:hlNative("flight", "flight_field_get_particle_serialize_result_text")
	static function get_text(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_particle_serialize_result_text")
	static function set_text(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ParticleSerializeResult(hl.Bytes) {
	public var text(get, set):String;
	inline function get_text():String {
		final bytes = ParticleSerializeResult_Ffi.get_text(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_text(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ParticleSerializeResult_Ffi.set_text(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
