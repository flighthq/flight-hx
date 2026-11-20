package flight._cpp;

private extern class RequirementCodegenPlan_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_requirement_codegen_plan_backend") static function get_backend(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_requirement_codegen_plan_backend") static function set_backend(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract RequirementCodegenPlan(cpp.Star<cpp.Void>) {
	public var backend(get, set):String;
	inline function get_backend():String { var raw = RequirementCodegenPlan_Ffi.get_backend(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RequirementCodegenPlan_Ffi.freeString(raw); return value; }
	inline function set_backend(value:String):String { var raw:cpp.ConstCharStar = cast value; RequirementCodegenPlan_Ffi.set_backend(this, raw); return value; }
}
