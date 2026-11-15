package flight._js;

@:jsRequire("flight")
private extern class VertexDisplaceModifier_Ffi {
	@:native("flight_get_vertex_displace_modifier_amplitude") static function get_amplitude(ptr:Dynamic):Float;
	@:native("flight_set_vertex_displace_modifier_amplitude") static function set_amplitude(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_vertex_displace_modifier_frequency") static function get_frequency(ptr:Dynamic):Float;
	@:native("flight_set_vertex_displace_modifier_frequency") static function set_frequency(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_vertex_displace_modifier_speed") static function get_speed(ptr:Dynamic):Float;
	@:native("flight_set_vertex_displace_modifier_speed") static function set_speed(ptr:Dynamic, value:Float):Float;
}

abstract VertexDisplaceModifier(Dynamic) {
	public var amplitude(get, set):Float;

	inline function get_amplitude():Float return VertexDisplaceModifier_Ffi.get_amplitude(this);

	inline function set_amplitude(value:Float):Float return VertexDisplaceModifier_Ffi.set_amplitude(this, value);
	public var frequency(get, set):Float;

	inline function get_frequency():Float return VertexDisplaceModifier_Ffi.get_frequency(this);

	inline function set_frequency(value:Float):Float return VertexDisplaceModifier_Ffi.set_frequency(this, value);
	public var speed(get, set):Float;

	inline function get_speed():Float return VertexDisplaceModifier_Ffi.get_speed(this);

	inline function set_speed(value:Float):Float return VertexDisplaceModifier_Ffi.set_speed(this, value);
}
