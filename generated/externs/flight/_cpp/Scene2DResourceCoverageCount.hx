package flight._cpp;

private extern class Scene2DResourceCoverageCount_Ffi {
	@:native("flight_get_scene2_dresource_coverage_count_resolved") static function get_resolved(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene2_dresource_coverage_count_resolved") static function set_resolved(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_scene2_dresource_coverage_count_total") static function get_total(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene2_dresource_coverage_count_total") static function set_total(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Scene2DResourceCoverageCount(cpp.Star<cpp.Void>) {
	public var resolved(get, set):Int;

	inline function get_resolved():Int return Scene2DResourceCoverageCount_Ffi.get_resolved(this);

	inline function set_resolved(value:Int):Int { Scene2DResourceCoverageCount_Ffi.set_resolved(this, value); return value; }
	public var total(get, set):Int;

	inline function get_total():Int return Scene2DResourceCoverageCount_Ffi.get_total(this);

	inline function set_total(value:Int):Int { Scene2DResourceCoverageCount_Ffi.set_total(this, value); return value; }
}
