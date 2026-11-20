package flight._hl;

private extern class Md5Mesh_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_md5_mesh_shader")
	static function get_shader(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_md5_mesh_shader")
	static function set_shader(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Md5Mesh(hl.Bytes) {
	public var shader(get, set):String;
	inline function get_shader():String { var raw = Md5Mesh_Ffi.get_shader(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Md5Mesh_Ffi.freeString(raw); return value; }
	inline function set_shader(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Md5Mesh_Ffi.set_shader(this, raw); return value; }
}
