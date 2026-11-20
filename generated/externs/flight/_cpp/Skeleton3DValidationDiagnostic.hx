package flight._cpp;

private extern class Skeleton3DValidationDiagnostic_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_skeleton3_dvalidation_diagnostic_joint_count") static function get_jointCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton3_dvalidation_diagnostic_joint_count") static function set_jointCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_skeleton3_dvalidation_diagnostic_inverse_bind_matrices_length") static function get_inverseBindMatricesLength(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton3_dvalidation_diagnostic_inverse_bind_matrices_length") static function set_inverseBindMatricesLength(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_skeleton3_dvalidation_diagnostic_expected_inverse_bind_matrices_length") static function get_expectedInverseBindMatricesLength(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton3_dvalidation_diagnostic_expected_inverse_bind_matrices_length") static function set_expectedInverseBindMatricesLength(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_skeleton3_dvalidation_diagnostic_message") static function get_message(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_skeleton3_dvalidation_diagnostic_message") static function set_message(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract Skeleton3DValidationDiagnostic(cpp.Star<cpp.Void>) {
	public var jointCount(get, set):Int;

	inline function get_jointCount():Int return Skeleton3DValidationDiagnostic_Ffi.get_jointCount(this);

	inline function set_jointCount(value:Int):Int { Skeleton3DValidationDiagnostic_Ffi.set_jointCount(this, value); return value; }
	public var inverseBindMatricesLength(get, set):Int;

	inline function get_inverseBindMatricesLength():Int return Skeleton3DValidationDiagnostic_Ffi.get_inverseBindMatricesLength(this);

	inline function set_inverseBindMatricesLength(value:Int):Int { Skeleton3DValidationDiagnostic_Ffi.set_inverseBindMatricesLength(this, value); return value; }
	public var expectedInverseBindMatricesLength(get, set):Int;

	inline function get_expectedInverseBindMatricesLength():Int return Skeleton3DValidationDiagnostic_Ffi.get_expectedInverseBindMatricesLength(this);

	inline function set_expectedInverseBindMatricesLength(value:Int):Int { Skeleton3DValidationDiagnostic_Ffi.set_expectedInverseBindMatricesLength(this, value); return value; }
	public var message(get, set):String;
	inline function get_message():String { var raw = Skeleton3DValidationDiagnostic_Ffi.get_message(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Skeleton3DValidationDiagnostic_Ffi.freeString(raw); return value; }
	inline function set_message(value:String):String { var raw:cpp.ConstCharStar = cast value; Skeleton3DValidationDiagnostic_Ffi.set_message(this, raw); return value; }
}
