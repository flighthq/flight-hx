package flight._cpp;

private extern class MorphShapeColorPaintBinding_Ffi {
	@:native("flight_get_morph_shape_color_paint_binding_command_index") static function get_commandIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_morph_shape_color_paint_binding_command_index") static function set_commandIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_morph_shape_color_paint_binding_end_alpha") static function get_endAlpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_morph_shape_color_paint_binding_end_alpha") static function set_endAlpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_morph_shape_color_paint_binding_end_color") static function get_endColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_morph_shape_color_paint_binding_end_color") static function set_endColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_morph_shape_color_paint_binding_start_alpha") static function get_startAlpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_morph_shape_color_paint_binding_start_alpha") static function set_startAlpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_morph_shape_color_paint_binding_start_color") static function get_startColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_morph_shape_color_paint_binding_start_color") static function set_startColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract MorphShapeColorPaintBinding(cpp.Star<cpp.Void>) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return MorphShapeColorPaintBinding_Ffi.get_commandIndex(this);

	inline function set_commandIndex(value:Int):Int return MorphShapeColorPaintBinding_Ffi.set_commandIndex(this, value);
	public var endAlpha(get, set):Single;

	inline function get_endAlpha():Single return MorphShapeColorPaintBinding_Ffi.get_endAlpha(this);

	inline function set_endAlpha(value:Single):Single return MorphShapeColorPaintBinding_Ffi.set_endAlpha(this, value);
	public var endColor(get, set):Int;

	inline function get_endColor():Int return MorphShapeColorPaintBinding_Ffi.get_endColor(this);

	inline function set_endColor(value:Int):Int return MorphShapeColorPaintBinding_Ffi.set_endColor(this, value);
	public var startAlpha(get, set):Single;

	inline function get_startAlpha():Single return MorphShapeColorPaintBinding_Ffi.get_startAlpha(this);

	inline function set_startAlpha(value:Single):Single return MorphShapeColorPaintBinding_Ffi.set_startAlpha(this, value);
	public var startColor(get, set):Int;

	inline function get_startColor():Int return MorphShapeColorPaintBinding_Ffi.get_startColor(this);

	inline function set_startColor(value:Int):Int return MorphShapeColorPaintBinding_Ffi.set_startColor(this, value);
}
