package flight._hl;

private extern class Md5Mesh_Ffi {
	@:hlNative("flight", "flight_field_get_md5_mesh_shader")
	static function get_shader(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_md5_mesh_shader")
	static function set_shader(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Md5Mesh(hl.Bytes) {
	public var shader(get, set):String;
	inline function get_shader():String {
		final bytes = Md5Mesh_Ffi.get_shader(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_shader(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Md5Mesh_Ffi.set_shader(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
