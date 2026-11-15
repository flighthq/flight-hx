package flight._cpp;

private extern class VertexDisplaceModifierOptions_Ffi {
	@:native("flight_get_vertex_displace_modifier_options_amplitude") static function get_amplitude(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_vertex_displace_modifier_options_amplitude") static function set_amplitude(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract VertexDisplaceModifierOptions(cpp.Star<cpp.Void>) {
	public var amplitude(get, set):Single;

	inline function get_amplitude():Single return VertexDisplaceModifierOptions_Ffi.get_amplitude(this);

	inline function set_amplitude(value:Single):Single return VertexDisplaceModifierOptions_Ffi.set_amplitude(this, value);
}
