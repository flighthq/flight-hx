package flight._cpp;

private extern class HostCapabilityCoverage_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_host_capability_coverage_capability") static function get_capability(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_host_capability_coverage_capability") static function set_capability(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_host_capability_coverage_group") static function get_group(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_host_capability_coverage_group") static function set_group(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_host_capability_coverage_is_present") static function get_isPresent(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_host_capability_coverage_is_present") static function set_isPresent(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_field_get_host_capability_coverage_slot") static function get_slot(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_host_capability_coverage_slot") static function set_slot(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract HostCapabilityCoverage(cpp.Star<cpp.Void>) {
	public var capability(get, set):String;
	inline function get_capability():String { var raw = HostCapabilityCoverage_Ffi.get_capability(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); HostCapabilityCoverage_Ffi.freeString(raw); return value; }
	inline function set_capability(value:String):String { var raw:cpp.ConstCharStar = cast value; HostCapabilityCoverage_Ffi.set_capability(this, raw); return value; }
	public var group(get, set):String;
	inline function get_group():String { var raw = HostCapabilityCoverage_Ffi.get_group(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); HostCapabilityCoverage_Ffi.freeString(raw); return value; }
	inline function set_group(value:String):String { var raw:cpp.ConstCharStar = cast value; HostCapabilityCoverage_Ffi.set_group(this, raw); return value; }
	public var isPresent(get, set):Bool;

	inline function get_isPresent():Bool return HostCapabilityCoverage_Ffi.get_isPresent(this);

	inline function set_isPresent(value:Bool):Bool { HostCapabilityCoverage_Ffi.set_isPresent(this, value); return value; }
	public var slot(get, set):String;
	inline function get_slot():String { var raw = HostCapabilityCoverage_Ffi.get_slot(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); HostCapabilityCoverage_Ffi.freeString(raw); return value; }
	inline function set_slot(value:String):String { var raw:cpp.ConstCharStar = cast value; HostCapabilityCoverage_Ffi.set_slot(this, raw); return value; }
}
