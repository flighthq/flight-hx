package flight._cpp;

private extern class Md5Weight_Ffi {
	@:native("flight_get_md5_weight_bias") static function get_bias(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_md5_weight_bias") static function set_bias(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_md5_weight_joint_index") static function get_jointIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_md5_weight_joint_index") static function set_jointIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_md5_weight_position_x") static function get_positionX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_md5_weight_position_x") static function set_positionX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_md5_weight_position_y") static function get_positionY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_md5_weight_position_y") static function set_positionY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_md5_weight_position_z") static function get_positionZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_md5_weight_position_z") static function set_positionZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Md5Weight(cpp.Star<cpp.Void>) {
	public var bias(get, set):Single;

	inline function get_bias():Single return Md5Weight_Ffi.get_bias(this);

	inline function set_bias(value:Single):Single { Md5Weight_Ffi.set_bias(this, value); return value; }
	public var jointIndex(get, set):Int;

	inline function get_jointIndex():Int return Md5Weight_Ffi.get_jointIndex(this);

	inline function set_jointIndex(value:Int):Int { Md5Weight_Ffi.set_jointIndex(this, value); return value; }
	public var positionX(get, set):Single;

	inline function get_positionX():Single return Md5Weight_Ffi.get_positionX(this);

	inline function set_positionX(value:Single):Single { Md5Weight_Ffi.set_positionX(this, value); return value; }
	public var positionY(get, set):Single;

	inline function get_positionY():Single return Md5Weight_Ffi.get_positionY(this);

	inline function set_positionY(value:Single):Single { Md5Weight_Ffi.set_positionY(this, value); return value; }
	public var positionZ(get, set):Single;

	inline function get_positionZ():Single return Md5Weight_Ffi.get_positionZ(this);

	inline function set_positionZ(value:Single):Single { Md5Weight_Ffi.set_positionZ(this, value); return value; }
}
