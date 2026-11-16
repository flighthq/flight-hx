package flight._cpp;

private extern class VertexColorMaterial_Ffi {
	@:native("flight_get_vertex_color_material_tint") static function get_tint(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_vertex_color_material_tint") static function set_tint(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract VertexColorMaterial(cpp.Star<cpp.Void>) {
	public var tint(get, set):Int;

	inline function get_tint():Int return VertexColorMaterial_Ffi.get_tint(this);

	inline function set_tint(value:Int):Int { VertexColorMaterial_Ffi.set_tint(this, value); return value; }
}
