package flight._cpp;

private extern class HostCapabilityBackend_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_host_capability_backend_entry_point") static function get_entryPoint(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_host_capability_backend_entry_point") static function set_entryPoint(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_host_capability_backend_package_name") static function get_packageName(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_host_capability_backend_package_name") static function set_packageName(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_host_capability_backend_platform") static function get_platform(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_host_capability_backend_platform") static function set_platform(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract HostCapabilityBackend(cpp.Star<cpp.Void>) {
	public var entryPoint(get, set):String;
	inline function get_entryPoint():String { var raw = HostCapabilityBackend_Ffi.get_entryPoint(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); HostCapabilityBackend_Ffi.freeString(raw); return value; }
	inline function set_entryPoint(value:String):String { var raw:cpp.ConstCharStar = cast value; HostCapabilityBackend_Ffi.set_entryPoint(this, raw); return value; }
	public var packageName(get, set):String;
	inline function get_packageName():String { var raw = HostCapabilityBackend_Ffi.get_packageName(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); HostCapabilityBackend_Ffi.freeString(raw); return value; }
	inline function set_packageName(value:String):String { var raw:cpp.ConstCharStar = cast value; HostCapabilityBackend_Ffi.set_packageName(this, raw); return value; }
	public var platform(get, set):String;
	inline function get_platform():String { var raw = HostCapabilityBackend_Ffi.get_platform(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); HostCapabilityBackend_Ffi.freeString(raw); return value; }
	inline function set_platform(value:String):String { var raw:cpp.ConstCharStar = cast value; HostCapabilityBackend_Ffi.set_platform(this, raw); return value; }
}
