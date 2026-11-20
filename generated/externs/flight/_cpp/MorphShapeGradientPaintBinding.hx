package flight._cpp;

private extern class MorphShapeGradientPaintBinding_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_morph_shape_gradient_paint_binding_command_index") static function get_commandIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_morph_shape_gradient_paint_binding_command_index") static function set_commandIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_morph_shape_gradient_paint_binding_command_key") static function get_commandKey(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_morph_shape_gradient_paint_binding_command_key") static function set_commandKey(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_morph_shape_gradient_paint_binding_end_focal_point_ratio") static function get_endFocalPointRatio(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_morph_shape_gradient_paint_binding_end_focal_point_ratio") static function set_endFocalPointRatio(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_morph_shape_gradient_paint_binding_start_focal_point_ratio") static function get_startFocalPointRatio(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_morph_shape_gradient_paint_binding_start_focal_point_ratio") static function set_startFocalPointRatio(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract MorphShapeGradientPaintBinding(cpp.Star<cpp.Void>) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return MorphShapeGradientPaintBinding_Ffi.get_commandIndex(this);

	inline function set_commandIndex(value:Int):Int { MorphShapeGradientPaintBinding_Ffi.set_commandIndex(this, value); return value; }
	public var commandKey(get, set):String;
	inline function get_commandKey():String { var raw = MorphShapeGradientPaintBinding_Ffi.get_commandKey(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); MorphShapeGradientPaintBinding_Ffi.freeString(raw); return value; }
	inline function set_commandKey(value:String):String { var raw:cpp.ConstCharStar = cast value; MorphShapeGradientPaintBinding_Ffi.set_commandKey(this, raw); return value; }
	public var endFocalPointRatio(get, set):Float;

	inline function get_endFocalPointRatio():Float return MorphShapeGradientPaintBinding_Ffi.get_endFocalPointRatio(this);

	inline function set_endFocalPointRatio(value:Float):Float { MorphShapeGradientPaintBinding_Ffi.set_endFocalPointRatio(this, value); return value; }
	public var startFocalPointRatio(get, set):Float;

	inline function get_startFocalPointRatio():Float return MorphShapeGradientPaintBinding_Ffi.get_startFocalPointRatio(this);

	inline function set_startFocalPointRatio(value:Float):Float { MorphShapeGradientPaintBinding_Ffi.set_startFocalPointRatio(this, value); return value; }
}
