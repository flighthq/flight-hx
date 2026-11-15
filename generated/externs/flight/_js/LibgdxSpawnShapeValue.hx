package flight._js;

@:jsRequire("flight")
private extern class LibgdxSpawnShapeValue_Ffi {
	@:native("flight_get_libgdx_spawn_shape_value_edges") static function get_edges(ptr:Dynamic):Bool;
	@:native("flight_set_libgdx_spawn_shape_value_edges") static function set_edges(ptr:Dynamic, value:Bool):Bool;
}

abstract LibgdxSpawnShapeValue(Dynamic) {
	public var edges(get, set):Bool;

	inline function get_edges():Bool return LibgdxSpawnShapeValue_Ffi.get_edges(this);

	inline function set_edges(value:Bool):Bool return LibgdxSpawnShapeValue_Ffi.set_edges(this, value);
}
