package flight._js;

@:jsRequire("flight")
private extern class MorphShapeGradientPaintBinding_Ffi {
	@:native("flight_get_morph_shape_gradient_paint_binding_command_index") static function get_commandIndex(ptr:Dynamic):Int;
	@:native("flight_set_morph_shape_gradient_paint_binding_command_index") static function set_commandIndex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_morph_shape_gradient_paint_binding_end_focal_point_ratio") static function get_endFocalPointRatio(ptr:Dynamic):Float;
	@:native("flight_set_morph_shape_gradient_paint_binding_end_focal_point_ratio") static function set_endFocalPointRatio(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_morph_shape_gradient_paint_binding_start_focal_point_ratio") static function get_startFocalPointRatio(ptr:Dynamic):Float;
	@:native("flight_set_morph_shape_gradient_paint_binding_start_focal_point_ratio") static function set_startFocalPointRatio(ptr:Dynamic, value:Float):Float;
}

abstract MorphShapeGradientPaintBinding(Dynamic) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return MorphShapeGradientPaintBinding_Ffi.get_commandIndex(this);

	inline function set_commandIndex(value:Int):Int return MorphShapeGradientPaintBinding_Ffi.set_commandIndex(this, value);
	public var endFocalPointRatio(get, set):Float;

	inline function get_endFocalPointRatio():Float return MorphShapeGradientPaintBinding_Ffi.get_endFocalPointRatio(this);

	inline function set_endFocalPointRatio(value:Float):Float return MorphShapeGradientPaintBinding_Ffi.set_endFocalPointRatio(this, value);
	public var startFocalPointRatio(get, set):Float;

	inline function get_startFocalPointRatio():Float return MorphShapeGradientPaintBinding_Ffi.get_startFocalPointRatio(this);

	inline function set_startFocalPointRatio(value:Float):Float return MorphShapeGradientPaintBinding_Ffi.set_startFocalPointRatio(this, value);
}
