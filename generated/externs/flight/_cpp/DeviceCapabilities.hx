package flight._cpp;

private extern class DeviceCapabilities_Ffi {
	@:native("flight_get_device_capabilities_has_keyboard") static function get_hasKeyboard(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_device_capabilities_has_keyboard") static function set_hasKeyboard(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_device_capabilities_has_mouse") static function get_hasMouse(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_device_capabilities_has_mouse") static function set_hasMouse(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_device_capabilities_has_stylus") static function get_hasStylus(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_device_capabilities_has_stylus") static function set_hasStylus(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract DeviceCapabilities(cpp.Star<cpp.Void>) {
	public var hasKeyboard(get, set):Bool;

	inline function get_hasKeyboard():Bool return DeviceCapabilities_Ffi.get_hasKeyboard(this);

	inline function set_hasKeyboard(value:Bool):Bool { DeviceCapabilities_Ffi.set_hasKeyboard(this, value); return value; }
	public var hasMouse(get, set):Bool;

	inline function get_hasMouse():Bool return DeviceCapabilities_Ffi.get_hasMouse(this);

	inline function set_hasMouse(value:Bool):Bool { DeviceCapabilities_Ffi.set_hasMouse(this, value); return value; }
	public var hasStylus(get, set):Bool;

	inline function get_hasStylus():Bool return DeviceCapabilities_Ffi.get_hasStylus(this);

	inline function set_hasStylus(value:Bool):Bool { DeviceCapabilities_Ffi.set_hasStylus(this, value); return value; }
}
