package flight._cpp;

private extern class VertexDisplaceModifier_Ffi {
	@:native("flight_get_vertex_displace_modifier_amplitude") static function get_amplitude(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_vertex_displace_modifier_amplitude") static function set_amplitude(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_vertex_displace_modifier_frequency") static function get_frequency(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_vertex_displace_modifier_frequency") static function set_frequency(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_vertex_displace_modifier_speed") static function get_speed(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_vertex_displace_modifier_speed") static function set_speed(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract VertexDisplaceModifier(cpp.Star<cpp.Void>) {
	public var amplitude(get, set):Single;

	inline function get_amplitude():Single return VertexDisplaceModifier_Ffi.get_amplitude(this);

	inline function set_amplitude(value:Single):Single { VertexDisplaceModifier_Ffi.set_amplitude(this, value); return value; }
	public var frequency(get, set):Single;

	inline function get_frequency():Single return VertexDisplaceModifier_Ffi.get_frequency(this);

	inline function set_frequency(value:Single):Single { VertexDisplaceModifier_Ffi.set_frequency(this, value); return value; }
	public var speed(get, set):Single;

	inline function get_speed():Single return VertexDisplaceModifier_Ffi.get_speed(this);

	inline function set_speed(value:Single):Single { VertexDisplaceModifier_Ffi.set_speed(this, value); return value; }
}
