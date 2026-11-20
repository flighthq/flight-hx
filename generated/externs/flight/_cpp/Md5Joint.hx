package flight._cpp;

private extern class Md5Joint_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_md5_joint_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_md5_joint_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_md5_joint_orientation_w") static function get_orientationW(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_md5_joint_orientation_w") static function set_orientationW(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_md5_joint_orientation_x") static function get_orientationX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_md5_joint_orientation_x") static function set_orientationX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_md5_joint_orientation_y") static function get_orientationY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_md5_joint_orientation_y") static function set_orientationY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_md5_joint_orientation_z") static function get_orientationZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_md5_joint_orientation_z") static function set_orientationZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_md5_joint_parent_index") static function get_parentIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_md5_joint_parent_index") static function set_parentIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_md5_joint_position_x") static function get_positionX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_md5_joint_position_x") static function set_positionX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_md5_joint_position_y") static function get_positionY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_md5_joint_position_y") static function set_positionY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_md5_joint_position_z") static function get_positionZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_md5_joint_position_z") static function set_positionZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Md5Joint(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String { var raw = Md5Joint_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Md5Joint_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; Md5Joint_Ffi.set_name(this, raw); return value; }
	public var orientationW(get, set):Float;

	inline function get_orientationW():Float return Md5Joint_Ffi.get_orientationW(this);

	inline function set_orientationW(value:Float):Float { Md5Joint_Ffi.set_orientationW(this, value); return value; }
	public var orientationX(get, set):Float;

	inline function get_orientationX():Float return Md5Joint_Ffi.get_orientationX(this);

	inline function set_orientationX(value:Float):Float { Md5Joint_Ffi.set_orientationX(this, value); return value; }
	public var orientationY(get, set):Float;

	inline function get_orientationY():Float return Md5Joint_Ffi.get_orientationY(this);

	inline function set_orientationY(value:Float):Float { Md5Joint_Ffi.set_orientationY(this, value); return value; }
	public var orientationZ(get, set):Float;

	inline function get_orientationZ():Float return Md5Joint_Ffi.get_orientationZ(this);

	inline function set_orientationZ(value:Float):Float { Md5Joint_Ffi.set_orientationZ(this, value); return value; }
	public var parentIndex(get, set):Int;

	inline function get_parentIndex():Int return Md5Joint_Ffi.get_parentIndex(this);

	inline function set_parentIndex(value:Int):Int { Md5Joint_Ffi.set_parentIndex(this, value); return value; }
	public var positionX(get, set):Float;

	inline function get_positionX():Float return Md5Joint_Ffi.get_positionX(this);

	inline function set_positionX(value:Float):Float { Md5Joint_Ffi.set_positionX(this, value); return value; }
	public var positionY(get, set):Float;

	inline function get_positionY():Float return Md5Joint_Ffi.get_positionY(this);

	inline function set_positionY(value:Float):Float { Md5Joint_Ffi.set_positionY(this, value); return value; }
	public var positionZ(get, set):Float;

	inline function get_positionZ():Float return Md5Joint_Ffi.get_positionZ(this);

	inline function set_positionZ(value:Float):Float { Md5Joint_Ffi.set_positionZ(this, value); return value; }
}
