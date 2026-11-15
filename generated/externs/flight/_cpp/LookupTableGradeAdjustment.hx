package flight._cpp;

private extern class LookupTableGradeAdjustment_Ffi {
	@:native("flight_get_lookup_table_grade_adjustment_strength") static function get_strength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_lookup_table_grade_adjustment_strength") static function set_strength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract LookupTableGradeAdjustment(cpp.Star<cpp.Void>) {
	public var strength(get, set):Single;

	inline function get_strength():Single return LookupTableGradeAdjustment_Ffi.get_strength(this);

	inline function set_strength(value:Single):Single return LookupTableGradeAdjustment_Ffi.set_strength(this, value);
}
