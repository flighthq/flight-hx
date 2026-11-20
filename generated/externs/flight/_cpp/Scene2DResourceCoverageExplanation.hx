package flight._cpp;

private extern class Scene2DResourceCoverageExplanation_Ffi {
	@:native("flight_get_scene2_dresource_coverage_explanation_complete") static function get_complete(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_scene2_dresource_coverage_explanation_complete") static function set_complete(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Scene2DResourceCoverageExplanation(cpp.Star<cpp.Void>) {
	public var complete(get, set):Bool;

	inline function get_complete():Bool return Scene2DResourceCoverageExplanation_Ffi.get_complete(this);

	inline function set_complete(value:Bool):Bool { Scene2DResourceCoverageExplanation_Ffi.set_complete(this, value); return value; }
}
