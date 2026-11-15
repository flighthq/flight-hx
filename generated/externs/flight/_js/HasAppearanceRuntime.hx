package flight._js;

@:jsRequire("flight")
private extern class HasAppearanceRuntime_Ffi {
	@:native("flight_get_has_appearance_runtime_world_alpha_using_appearance_id") static function get_worldAlphaUsingAppearanceId(ptr:Dynamic):Int;
	@:native("flight_set_has_appearance_runtime_world_alpha_using_appearance_id") static function set_worldAlphaUsingAppearanceId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_has_appearance_runtime_world_alpha_using_parent_appearance_id") static function get_worldAlphaUsingParentAppearanceId(ptr:Dynamic):Int;
	@:native("flight_set_has_appearance_runtime_world_alpha_using_parent_appearance_id") static function set_worldAlphaUsingParentAppearanceId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_has_appearance_runtime_world_appearance_id") static function get_worldAppearanceId(ptr:Dynamic):Int;
	@:native("flight_set_has_appearance_runtime_world_appearance_id") static function set_worldAppearanceId(ptr:Dynamic, value:Int):Int;
}

abstract HasAppearanceRuntime(Dynamic) {
	public var worldAlphaUsingAppearanceId(get, set):Int;

	inline function get_worldAlphaUsingAppearanceId():Int return HasAppearanceRuntime_Ffi.get_worldAlphaUsingAppearanceId(this);

	inline function set_worldAlphaUsingAppearanceId(value:Int):Int return HasAppearanceRuntime_Ffi.set_worldAlphaUsingAppearanceId(this, value);
	public var worldAlphaUsingParentAppearanceId(get, set):Int;

	inline function get_worldAlphaUsingParentAppearanceId():Int return HasAppearanceRuntime_Ffi.get_worldAlphaUsingParentAppearanceId(this);

	inline function set_worldAlphaUsingParentAppearanceId(value:Int):Int return HasAppearanceRuntime_Ffi.set_worldAlphaUsingParentAppearanceId(this, value);
	public var worldAppearanceId(get, set):Int;

	inline function get_worldAppearanceId():Int return HasAppearanceRuntime_Ffi.get_worldAppearanceId(this);

	inline function set_worldAppearanceId(value:Int):Int return HasAppearanceRuntime_Ffi.set_worldAppearanceId(this, value);
}
