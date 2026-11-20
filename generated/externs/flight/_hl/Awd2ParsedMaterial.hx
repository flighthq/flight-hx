package flight._hl;

private extern class Awd2ParsedMaterial_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_awd2_parsed_material_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_awd2_parsed_material_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Awd2ParsedMaterial(hl.Bytes) {
	public var diffuseTextureId(get, set):Int;

	inline function get_diffuseTextureId():Int return this.getI32(88);

	inline function set_diffuseTextureId(value:Int):Int { this.setI32(88, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = Awd2ParsedMaterial_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Awd2ParsedMaterial_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Awd2ParsedMaterial_Ffi.set_name(this, raw); return value; }
	public var normalTextureId(get, set):Int;

	inline function get_normalTextureId():Int return this.getI32(92);

	inline function set_normalTextureId(value:Int):Int { this.setI32(92, value); return value; }
	public var numMethods(get, set):Int;

	inline function get_numMethods():Int return this.getUI8(100);

	inline function set_numMethods(value:Int):Int { this.setUI8(100, value); return value; }
	public var specularTextureId(get, set):Int;

	inline function get_specularTextureId():Int return this.getI32(96);

	inline function set_specularTextureId(value:Int):Int { this.setI32(96, value); return value; }
}
