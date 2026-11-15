package flight._js;

@:jsRequire("flight")
private extern class LookupTableGradeAdjustment_Ffi {
	@:native("flight_get_lookup_table_grade_adjustment_strength") static function get_strength(ptr:Dynamic):Float;
	@:native("flight_set_lookup_table_grade_adjustment_strength") static function set_strength(ptr:Dynamic, value:Float):Float;
}

abstract LookupTableGradeAdjustment(Dynamic) {
	public var strength(get, set):Float;

	inline function get_strength():Float return LookupTableGradeAdjustment_Ffi.get_strength(this);

	inline function set_strength(value:Float):Float return LookupTableGradeAdjustment_Ffi.set_strength(this, value);
}
