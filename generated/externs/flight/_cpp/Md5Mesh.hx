package flight._cpp;

private extern class Md5Mesh_Ffi {
	@:native("flight_field_get_md5_mesh_shader")
	static function get_shader(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_md5_mesh_shader")
	static function set_shader(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract Md5Mesh(cpp.Star<cpp.Void>) {
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
		Md5Mesh_Ffi.set_shader(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
