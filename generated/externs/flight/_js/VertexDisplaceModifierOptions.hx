package flight._js;

@:jsRequire("flight")
private extern class VertexDisplaceModifierOptions_Ffi {
	@:native("flight_get_vertex_displace_modifier_options_amplitude") static function get_amplitude(ptr:Dynamic):Float;
	@:native("flight_set_vertex_displace_modifier_options_amplitude") static function set_amplitude(ptr:Dynamic, value:Float):Float;
}

abstract VertexDisplaceModifierOptions(Dynamic) {
	public var amplitude(get, set):Float;

	inline function get_amplitude():Float return VertexDisplaceModifierOptions_Ffi.get_amplitude(this);

	inline function set_amplitude(value:Float):Float return VertexDisplaceModifierOptions_Ffi.set_amplitude(this, value);
}
