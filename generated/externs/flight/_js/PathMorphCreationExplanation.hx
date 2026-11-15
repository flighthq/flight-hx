package flight._js;

@:jsRequire("flight")
private extern class PathMorphCreationExplanation_Ffi {
	@:native("flight_get_path_morph_creation_explanation_supported") static function get_supported(ptr:Dynamic):Bool;
	@:native("flight_set_path_morph_creation_explanation_supported") static function set_supported(ptr:Dynamic, value:Bool):Bool;
}

abstract PathMorphCreationExplanation(Dynamic) {
	public var supported(get, set):Bool;

	inline function get_supported():Bool return PathMorphCreationExplanation_Ffi.get_supported(this);

	inline function set_supported(value:Bool):Bool return PathMorphCreationExplanation_Ffi.set_supported(this, value);
}
