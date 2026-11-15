package flight._cpp;

private extern class DissolveModifier_Ffi {
	@:native("flight_get_dissolve_modifier_threshold") static function get_threshold(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_dissolve_modifier_threshold") static function set_threshold(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_dissolve_modifier_edge_color") static function get_edgeColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_dissolve_modifier_edge_color") static function set_edgeColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_dissolve_modifier_edge_width") static function get_edgeWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_dissolve_modifier_edge_width") static function set_edgeWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_dissolve_modifier_scale") static function get_scale(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_dissolve_modifier_scale") static function set_scale(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract DissolveModifier(cpp.Star<cpp.Void>) {
	public var threshold(get, set):Single;

	inline function get_threshold():Single return DissolveModifier_Ffi.get_threshold(this);

	inline function set_threshold(value:Single):Single return DissolveModifier_Ffi.set_threshold(this, value);
	public var edgeColor(get, set):Int;

	inline function get_edgeColor():Int return DissolveModifier_Ffi.get_edgeColor(this);

	inline function set_edgeColor(value:Int):Int return DissolveModifier_Ffi.set_edgeColor(this, value);
	public var edgeWidth(get, set):Single;

	inline function get_edgeWidth():Single return DissolveModifier_Ffi.get_edgeWidth(this);

	inline function set_edgeWidth(value:Single):Single return DissolveModifier_Ffi.set_edgeWidth(this, value);
	public var scale(get, set):Single;

	inline function get_scale():Single return DissolveModifier_Ffi.get_scale(this);

	inline function set_scale(value:Single):Single return DissolveModifier_Ffi.set_scale(this, value);
}
