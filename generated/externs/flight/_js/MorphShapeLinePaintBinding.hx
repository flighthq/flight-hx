package flight._js;

@:jsRequire("flight")
private extern class MorphShapeLinePaintBinding_Ffi {
	@:native("flight_get_morph_shape_line_paint_binding_command_index") static function get_commandIndex(ptr:Dynamic):Int;
	@:native("flight_set_morph_shape_line_paint_binding_command_index") static function set_commandIndex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_morph_shape_line_paint_binding_end_alpha") static function get_endAlpha(ptr:Dynamic):Float;
	@:native("flight_set_morph_shape_line_paint_binding_end_alpha") static function set_endAlpha(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_morph_shape_line_paint_binding_end_color") static function get_endColor(ptr:Dynamic):Int;
	@:native("flight_set_morph_shape_line_paint_binding_end_color") static function set_endColor(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_morph_shape_line_paint_binding_end_thickness") static function get_endThickness(ptr:Dynamic):Float;
	@:native("flight_set_morph_shape_line_paint_binding_end_thickness") static function set_endThickness(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_morph_shape_line_paint_binding_start_alpha") static function get_startAlpha(ptr:Dynamic):Float;
	@:native("flight_set_morph_shape_line_paint_binding_start_alpha") static function set_startAlpha(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_morph_shape_line_paint_binding_start_color") static function get_startColor(ptr:Dynamic):Int;
	@:native("flight_set_morph_shape_line_paint_binding_start_color") static function set_startColor(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_morph_shape_line_paint_binding_start_thickness") static function get_startThickness(ptr:Dynamic):Float;
	@:native("flight_set_morph_shape_line_paint_binding_start_thickness") static function set_startThickness(ptr:Dynamic, value:Float):Float;
}

abstract MorphShapeLinePaintBinding(Dynamic) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return MorphShapeLinePaintBinding_Ffi.get_commandIndex(this);

	inline function set_commandIndex(value:Int):Int return MorphShapeLinePaintBinding_Ffi.set_commandIndex(this, value);
	public var endAlpha(get, set):Float;

	inline function get_endAlpha():Float return MorphShapeLinePaintBinding_Ffi.get_endAlpha(this);

	inline function set_endAlpha(value:Float):Float return MorphShapeLinePaintBinding_Ffi.set_endAlpha(this, value);
	public var endColor(get, set):Int;

	inline function get_endColor():Int return MorphShapeLinePaintBinding_Ffi.get_endColor(this);

	inline function set_endColor(value:Int):Int return MorphShapeLinePaintBinding_Ffi.set_endColor(this, value);
	public var endThickness(get, set):Float;

	inline function get_endThickness():Float return MorphShapeLinePaintBinding_Ffi.get_endThickness(this);

	inline function set_endThickness(value:Float):Float return MorphShapeLinePaintBinding_Ffi.set_endThickness(this, value);
	public var startAlpha(get, set):Float;

	inline function get_startAlpha():Float return MorphShapeLinePaintBinding_Ffi.get_startAlpha(this);

	inline function set_startAlpha(value:Float):Float return MorphShapeLinePaintBinding_Ffi.set_startAlpha(this, value);
	public var startColor(get, set):Int;

	inline function get_startColor():Int return MorphShapeLinePaintBinding_Ffi.get_startColor(this);

	inline function set_startColor(value:Int):Int return MorphShapeLinePaintBinding_Ffi.set_startColor(this, value);
	public var startThickness(get, set):Float;

	inline function get_startThickness():Float return MorphShapeLinePaintBinding_Ffi.get_startThickness(this);

	inline function set_startThickness(value:Float):Float return MorphShapeLinePaintBinding_Ffi.set_startThickness(this, value);
}
