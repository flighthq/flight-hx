package flight._cpp;

private extern class Scene3DForwardLightSelectionExplanation_Ffi {
	@:native("flight_get_scene3_dforward_light_selection_explanation_point_light_count") static function get_pointLightCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene3_dforward_light_selection_explanation_point_light_count") static function set_pointLightCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_scene3_dforward_light_selection_explanation_selection_prepared") static function get_selectionPrepared(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_scene3_dforward_light_selection_explanation_selection_prepared") static function set_selectionPrepared(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_scene3_dforward_light_selection_explanation_spot_light_count") static function get_spotLightCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene3_dforward_light_selection_explanation_spot_light_count") static function set_spotLightCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Scene3DForwardLightSelectionExplanation(cpp.Star<cpp.Void>) {
	public var pointLightCount(get, set):Int;

	inline function get_pointLightCount():Int return Scene3DForwardLightSelectionExplanation_Ffi.get_pointLightCount(this);

	inline function set_pointLightCount(value:Int):Int return Scene3DForwardLightSelectionExplanation_Ffi.set_pointLightCount(this, value);
	public var selectionPrepared(get, set):Bool;

	inline function get_selectionPrepared():Bool return Scene3DForwardLightSelectionExplanation_Ffi.get_selectionPrepared(this);

	inline function set_selectionPrepared(value:Bool):Bool return Scene3DForwardLightSelectionExplanation_Ffi.set_selectionPrepared(this, value);
	public var spotLightCount(get, set):Int;

	inline function get_spotLightCount():Int return Scene3DForwardLightSelectionExplanation_Ffi.get_spotLightCount(this);

	inline function set_spotLightCount(value:Int):Int return Scene3DForwardLightSelectionExplanation_Ffi.set_spotLightCount(this, value);
}
