package flight._hl;

private extern class GltfAccessor_Ffi {
	@:hlNative("flight", "flight_field_get_gltf_accessor_type")
	static function get_type(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_gltf_accessor_type")
	static function set_type(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract GltfAccessor(hl.Bytes) {
	public var count(get, set):Single;

	inline function get_count():Single return this.getF32(52);

	inline function set_count(value:Single):Single { this.setF32(52, value); return value; }
	public var type(get, set):String;
	inline function get_type():String {
		final bytes = GltfAccessor_Ffi.get_type(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_type(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		GltfAccessor_Ffi.set_type(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
