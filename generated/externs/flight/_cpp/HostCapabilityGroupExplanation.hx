package flight._cpp;

private extern class HostCapabilityGroupExplanation_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_host_capability_group_explanation_group") static function get_group(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_host_capability_group_explanation_group") static function set_group(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract HostCapabilityGroupExplanation(cpp.Star<cpp.Void>) {
	public var group(get, set):String;
	inline function get_group():String { var raw = HostCapabilityGroupExplanation_Ffi.get_group(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); HostCapabilityGroupExplanation_Ffi.freeString(raw); return value; }
	inline function set_group(value:String):String { var raw:cpp.ConstCharStar = cast value; HostCapabilityGroupExplanation_Ffi.set_group(this, raw); return value; }
}
