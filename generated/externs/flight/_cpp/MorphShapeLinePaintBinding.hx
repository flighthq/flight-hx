package flight._cpp;

private extern class MorphShapeLinePaintBinding_Ffi {
	@:native("flight_get_morph_shape_line_paint_binding_command_index") static function get_commandIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_morph_shape_line_paint_binding_command_index") static function set_commandIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_morph_shape_line_paint_binding_end_alpha") static function get_endAlpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_morph_shape_line_paint_binding_end_alpha") static function set_endAlpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_morph_shape_line_paint_binding_end_color") static function get_endColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_morph_shape_line_paint_binding_end_color") static function set_endColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_morph_shape_line_paint_binding_end_thickness") static function get_endThickness(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_morph_shape_line_paint_binding_end_thickness") static function set_endThickness(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_morph_shape_line_paint_binding_start_alpha") static function get_startAlpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_morph_shape_line_paint_binding_start_alpha") static function set_startAlpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_morph_shape_line_paint_binding_start_color") static function get_startColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_morph_shape_line_paint_binding_start_color") static function set_startColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_morph_shape_line_paint_binding_start_thickness") static function get_startThickness(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_morph_shape_line_paint_binding_start_thickness") static function set_startThickness(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract MorphShapeLinePaintBinding(cpp.Star<cpp.Void>) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return MorphShapeLinePaintBinding_Ffi.get_commandIndex(this);

	inline function set_commandIndex(value:Int):Int { MorphShapeLinePaintBinding_Ffi.set_commandIndex(this, value); return value; }
	public var endAlpha(get, set):Single;

	inline function get_endAlpha():Single return MorphShapeLinePaintBinding_Ffi.get_endAlpha(this);

	inline function set_endAlpha(value:Single):Single { MorphShapeLinePaintBinding_Ffi.set_endAlpha(this, value); return value; }
	public var endColor(get, set):Int;

	inline function get_endColor():Int return MorphShapeLinePaintBinding_Ffi.get_endColor(this);

	inline function set_endColor(value:Int):Int { MorphShapeLinePaintBinding_Ffi.set_endColor(this, value); return value; }
	public var endThickness(get, set):Float;

	inline function get_endThickness():Float return MorphShapeLinePaintBinding_Ffi.get_endThickness(this);

	inline function set_endThickness(value:Float):Float { MorphShapeLinePaintBinding_Ffi.set_endThickness(this, value); return value; }
	public var startAlpha(get, set):Single;

	inline function get_startAlpha():Single return MorphShapeLinePaintBinding_Ffi.get_startAlpha(this);

	inline function set_startAlpha(value:Single):Single { MorphShapeLinePaintBinding_Ffi.set_startAlpha(this, value); return value; }
	public var startColor(get, set):Int;

	inline function get_startColor():Int return MorphShapeLinePaintBinding_Ffi.get_startColor(this);

	inline function set_startColor(value:Int):Int { MorphShapeLinePaintBinding_Ffi.set_startColor(this, value); return value; }
	public var startThickness(get, set):Float;

	inline function get_startThickness():Float return MorphShapeLinePaintBinding_Ffi.get_startThickness(this);

	inline function set_startThickness(value:Float):Float { MorphShapeLinePaintBinding_Ffi.set_startThickness(this, value); return value; }
}
