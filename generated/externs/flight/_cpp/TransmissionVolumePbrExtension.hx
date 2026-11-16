package flight._cpp;

private extern class TransmissionVolumePbrExtension_Ffi {
	@:native("flight_get_transmission_volume_pbr_extension_attenuation_color") static function get_attenuationColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_transmission_volume_pbr_extension_attenuation_color") static function set_attenuationColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_transmission_volume_pbr_extension_attenuation_distance") static function get_attenuationDistance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_transmission_volume_pbr_extension_attenuation_distance") static function set_attenuationDistance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_transmission_volume_pbr_extension_ior") static function get_ior(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_transmission_volume_pbr_extension_ior") static function set_ior(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_transmission_volume_pbr_extension_thickness") static function get_thickness(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_transmission_volume_pbr_extension_thickness") static function set_thickness(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_transmission_volume_pbr_extension_transmission") static function get_transmission(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_transmission_volume_pbr_extension_transmission") static function set_transmission(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract TransmissionVolumePbrExtension(cpp.Star<cpp.Void>) {
	public var attenuationColor(get, set):Int;

	inline function get_attenuationColor():Int return TransmissionVolumePbrExtension_Ffi.get_attenuationColor(this);

	inline function set_attenuationColor(value:Int):Int { TransmissionVolumePbrExtension_Ffi.set_attenuationColor(this, value); return value; }
	public var attenuationDistance(get, set):Single;

	inline function get_attenuationDistance():Single return TransmissionVolumePbrExtension_Ffi.get_attenuationDistance(this);

	inline function set_attenuationDistance(value:Single):Single { TransmissionVolumePbrExtension_Ffi.set_attenuationDistance(this, value); return value; }
	public var ior(get, set):Single;

	inline function get_ior():Single return TransmissionVolumePbrExtension_Ffi.get_ior(this);

	inline function set_ior(value:Single):Single { TransmissionVolumePbrExtension_Ffi.set_ior(this, value); return value; }
	public var thickness(get, set):Single;

	inline function get_thickness():Single return TransmissionVolumePbrExtension_Ffi.get_thickness(this);

	inline function set_thickness(value:Single):Single { TransmissionVolumePbrExtension_Ffi.set_thickness(this, value); return value; }
	public var transmission(get, set):Single;

	inline function get_transmission():Single return TransmissionVolumePbrExtension_Ffi.get_transmission(this);

	inline function set_transmission(value:Single):Single { TransmissionVolumePbrExtension_Ffi.set_transmission(this, value); return value; }
}
