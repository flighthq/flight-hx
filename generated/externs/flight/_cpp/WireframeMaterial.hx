package flight._cpp;

private extern class WireframeMaterial_Ffi {
	@:native("flight_get_wireframe_material_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_wireframe_material_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_wireframe_material_thickness") static function get_thickness(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_wireframe_material_thickness") static function set_thickness(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract WireframeMaterial(cpp.Star<cpp.Void>) {
	public var color(get, set):Int;

	inline function get_color():Int return WireframeMaterial_Ffi.get_color(this);

	inline function set_color(value:Int):Int { WireframeMaterial_Ffi.set_color(this, value); return value; }
	public var thickness(get, set):Single;

	inline function get_thickness():Single return WireframeMaterial_Ffi.get_thickness(this);

	inline function set_thickness(value:Single):Single { WireframeMaterial_Ffi.set_thickness(this, value); return value; }
}
