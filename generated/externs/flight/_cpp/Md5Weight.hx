package flight._cpp;

private extern class Md5Weight_Ffi {
	@:native("flight_get_md5_weight_bias") static function get_bias(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_md5_weight_bias") static function set_bias(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_md5_weight_joint_index") static function get_jointIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_md5_weight_joint_index") static function set_jointIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_md5_weight_position_x") static function get_positionX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_md5_weight_position_x") static function set_positionX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_md5_weight_position_y") static function get_positionY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_md5_weight_position_y") static function set_positionY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_md5_weight_position_z") static function get_positionZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_md5_weight_position_z") static function set_positionZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Md5Weight(cpp.Star<cpp.Void>) {
	public var bias(get, set):Float;

	inline function get_bias():Float return Md5Weight_Ffi.get_bias(this);

	inline function set_bias(value:Float):Float { Md5Weight_Ffi.set_bias(this, value); return value; }
	public var jointIndex(get, set):Int;

	inline function get_jointIndex():Int return Md5Weight_Ffi.get_jointIndex(this);

	inline function set_jointIndex(value:Int):Int { Md5Weight_Ffi.set_jointIndex(this, value); return value; }
	public var positionX(get, set):Float;

	inline function get_positionX():Float return Md5Weight_Ffi.get_positionX(this);

	inline function set_positionX(value:Float):Float { Md5Weight_Ffi.set_positionX(this, value); return value; }
	public var positionY(get, set):Float;

	inline function get_positionY():Float return Md5Weight_Ffi.get_positionY(this);

	inline function set_positionY(value:Float):Float { Md5Weight_Ffi.set_positionY(this, value); return value; }
	public var positionZ(get, set):Float;

	inline function get_positionZ():Float return Md5Weight_Ffi.get_positionZ(this);

	inline function set_positionZ(value:Float):Float { Md5Weight_Ffi.set_positionZ(this, value); return value; }
}
