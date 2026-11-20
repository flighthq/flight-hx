package flight._hl;

private extern class ObjMaterial_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_obj_material_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_obj_material_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ObjMaterial(hl.Bytes) {
	public var dissolve(get, set):Single;

	inline function get_dissolve():Single return this.getF32(336);

	inline function set_dissolve(value:Single):Single { this.setF32(336, value); return value; }
	public var illumination(get, set):Single;

	inline function get_illumination():Single return this.getF32(340);

	inline function set_illumination(value:Single):Single { this.setF32(340, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = ObjMaterial_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ObjMaterial_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ObjMaterial_Ffi.set_name(this, raw); return value; }
	public var specularExponent(get, set):Single;

	inline function get_specularExponent():Single return this.getF32(356);

	inline function set_specularExponent(value:Single):Single { this.setF32(356, value); return value; }
}
