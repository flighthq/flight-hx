package flight._cpp;

private extern class StrokePathTessellationExplanation_Ffi {
	@:native("flight_get_stroke_path_tessellation_explanation_supported") static function get_supported(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_stroke_path_tessellation_explanation_supported") static function set_supported(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract StrokePathTessellationExplanation(cpp.Star<cpp.Void>) {
	public var supported(get, set):Bool;

	inline function get_supported():Bool return StrokePathTessellationExplanation_Ffi.get_supported(this);

	inline function set_supported(value:Bool):Bool return StrokePathTessellationExplanation_Ffi.set_supported(this, value);
}
