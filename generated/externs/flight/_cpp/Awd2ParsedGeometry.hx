package flight._cpp;

private extern class Awd2ParsedGeometry_Ffi {
	@:native("flight_get_awd2_parsed_geometry_skinned") static function get_skinned(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_awd2_parsed_geometry_skinned") static function set_skinned(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Awd2ParsedGeometry(cpp.Star<cpp.Void>) {
	public var skinned(get, set):Bool;

	inline function get_skinned():Bool return Awd2ParsedGeometry_Ffi.get_skinned(this);

	inline function set_skinned(value:Bool):Bool { Awd2ParsedGeometry_Ffi.set_skinned(this, value); return value; }
}
