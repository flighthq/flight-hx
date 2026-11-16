package flight._cpp;

private extern class IridescencePbrExtension_Ffi {
	@:native("flight_get_iridescence_pbr_extension_iridescence") static function get_iridescence(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_iridescence_pbr_extension_iridescence") static function set_iridescence(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_iridescence_pbr_extension_iridescence_ior") static function get_iridescenceIor(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_iridescence_pbr_extension_iridescence_ior") static function set_iridescenceIor(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_iridescence_pbr_extension_iridescence_thickness_max") static function get_iridescenceThicknessMax(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_iridescence_pbr_extension_iridescence_thickness_max") static function set_iridescenceThicknessMax(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_iridescence_pbr_extension_iridescence_thickness_min") static function get_iridescenceThicknessMin(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_iridescence_pbr_extension_iridescence_thickness_min") static function set_iridescenceThicknessMin(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract IridescencePbrExtension(cpp.Star<cpp.Void>) {
	public var iridescence(get, set):Single;

	inline function get_iridescence():Single return IridescencePbrExtension_Ffi.get_iridescence(this);

	inline function set_iridescence(value:Single):Single { IridescencePbrExtension_Ffi.set_iridescence(this, value); return value; }
	public var iridescenceIor(get, set):Single;

	inline function get_iridescenceIor():Single return IridescencePbrExtension_Ffi.get_iridescenceIor(this);

	inline function set_iridescenceIor(value:Single):Single { IridescencePbrExtension_Ffi.set_iridescenceIor(this, value); return value; }
	public var iridescenceThicknessMax(get, set):Single;

	inline function get_iridescenceThicknessMax():Single return IridescencePbrExtension_Ffi.get_iridescenceThicknessMax(this);

	inline function set_iridescenceThicknessMax(value:Single):Single { IridescencePbrExtension_Ffi.set_iridescenceThicknessMax(this, value); return value; }
	public var iridescenceThicknessMin(get, set):Single;

	inline function get_iridescenceThicknessMin():Single return IridescencePbrExtension_Ffi.get_iridescenceThicknessMin(this);

	inline function set_iridescenceThicknessMin(value:Single):Single { IridescencePbrExtension_Ffi.set_iridescenceThicknessMin(this, value); return value; }
}
