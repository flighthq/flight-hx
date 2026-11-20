package flight._cpp;

private extern class HapticsCapabilities_Ffi {
	@:native("flight_get_haptics_capabilities_amplitude_control") static function get_amplitudeControl(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_haptics_capabilities_amplitude_control") static function set_amplitudeControl(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_haptics_capabilities_custom_events") static function get_customEvents(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_haptics_capabilities_custom_events") static function set_customEvents(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_haptics_capabilities_intensity") static function get_intensity(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_haptics_capabilities_intensity") static function set_intensity(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_haptics_capabilities_patterns") static function get_patterns(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_haptics_capabilities_patterns") static function set_patterns(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_haptics_capabilities_supported") static function get_supported(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_haptics_capabilities_supported") static function set_supported(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract HapticsCapabilities(cpp.Star<cpp.Void>) {
	public var amplitudeControl(get, set):Bool;

	inline function get_amplitudeControl():Bool return HapticsCapabilities_Ffi.get_amplitudeControl(this);

	inline function set_amplitudeControl(value:Bool):Bool { HapticsCapabilities_Ffi.set_amplitudeControl(this, value); return value; }
	public var customEvents(get, set):Bool;

	inline function get_customEvents():Bool return HapticsCapabilities_Ffi.get_customEvents(this);

	inline function set_customEvents(value:Bool):Bool { HapticsCapabilities_Ffi.set_customEvents(this, value); return value; }
	public var intensity(get, set):Bool;

	inline function get_intensity():Bool return HapticsCapabilities_Ffi.get_intensity(this);

	inline function set_intensity(value:Bool):Bool { HapticsCapabilities_Ffi.set_intensity(this, value); return value; }
	public var patterns(get, set):Bool;

	inline function get_patterns():Bool return HapticsCapabilities_Ffi.get_patterns(this);

	inline function set_patterns(value:Bool):Bool { HapticsCapabilities_Ffi.set_patterns(this, value); return value; }
	public var supported(get, set):Bool;

	inline function get_supported():Bool return HapticsCapabilities_Ffi.get_supported(this);

	inline function set_supported(value:Bool):Bool { HapticsCapabilities_Ffi.set_supported(this, value); return value; }
}
