package flight._cpp;

private extern class RequirementDisposition_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_requirement_disposition_backend") static function get_backend(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_requirement_disposition_backend") static function set_backend(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_requirement_disposition_reason") static function get_reason(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_requirement_disposition_reason") static function set_reason(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract RequirementDisposition(cpp.Star<cpp.Void>) {
	public var backend(get, set):String;
	inline function get_backend():String { var raw = RequirementDisposition_Ffi.get_backend(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RequirementDisposition_Ffi.freeString(raw); return value; }
	inline function set_backend(value:String):String { var raw:cpp.ConstCharStar = cast value; RequirementDisposition_Ffi.set_backend(this, raw); return value; }
	public var reason(get, set):String;
	inline function get_reason():String { var raw = RequirementDisposition_Ffi.get_reason(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RequirementDisposition_Ffi.freeString(raw); return value; }
	inline function set_reason(value:String):String { var raw:cpp.ConstCharStar = cast value; RequirementDisposition_Ffi.set_reason(this, raw); return value; }
}
