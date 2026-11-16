package flight._cpp;

private extern class LibgdxSpawnShapeValue_Ffi {
	@:native("flight_get_libgdx_spawn_shape_value_edges") static function get_edges(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_libgdx_spawn_shape_value_edges") static function set_edges(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract LibgdxSpawnShapeValue(cpp.Star<cpp.Void>) {
	public var edges(get, set):Bool;

	inline function get_edges():Bool return LibgdxSpawnShapeValue_Ffi.get_edges(this);

	inline function set_edges(value:Bool):Bool { LibgdxSpawnShapeValue_Ffi.set_edges(this, value); return value; }
}
