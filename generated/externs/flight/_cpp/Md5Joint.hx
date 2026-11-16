package flight._cpp;

private extern class Md5Joint_Ffi {
	@:native("flight_field_get_md5_joint_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_md5_joint_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_md5_joint_orientation_w") static function get_orientationW(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_md5_joint_orientation_w") static function set_orientationW(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_md5_joint_orientation_x") static function get_orientationX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_md5_joint_orientation_x") static function set_orientationX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_md5_joint_orientation_y") static function get_orientationY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_md5_joint_orientation_y") static function set_orientationY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_md5_joint_orientation_z") static function get_orientationZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_md5_joint_orientation_z") static function set_orientationZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_md5_joint_parent_index") static function get_parentIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_md5_joint_parent_index") static function set_parentIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_md5_joint_position_x") static function get_positionX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_md5_joint_position_x") static function set_positionX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_md5_joint_position_y") static function get_positionY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_md5_joint_position_y") static function set_positionY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_md5_joint_position_z") static function get_positionZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_md5_joint_position_z") static function set_positionZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Md5Joint(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = Md5Joint_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Md5Joint_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var orientationW(get, set):Single;

	inline function get_orientationW():Single return Md5Joint_Ffi.get_orientationW(this);

	inline function set_orientationW(value:Single):Single { Md5Joint_Ffi.set_orientationW(this, value); return value; }
	public var orientationX(get, set):Single;

	inline function get_orientationX():Single return Md5Joint_Ffi.get_orientationX(this);

	inline function set_orientationX(value:Single):Single { Md5Joint_Ffi.set_orientationX(this, value); return value; }
	public var orientationY(get, set):Single;

	inline function get_orientationY():Single return Md5Joint_Ffi.get_orientationY(this);

	inline function set_orientationY(value:Single):Single { Md5Joint_Ffi.set_orientationY(this, value); return value; }
	public var orientationZ(get, set):Single;

	inline function get_orientationZ():Single return Md5Joint_Ffi.get_orientationZ(this);

	inline function set_orientationZ(value:Single):Single { Md5Joint_Ffi.set_orientationZ(this, value); return value; }
	public var parentIndex(get, set):Int;

	inline function get_parentIndex():Int return Md5Joint_Ffi.get_parentIndex(this);

	inline function set_parentIndex(value:Int):Int { Md5Joint_Ffi.set_parentIndex(this, value); return value; }
	public var positionX(get, set):Single;

	inline function get_positionX():Single return Md5Joint_Ffi.get_positionX(this);

	inline function set_positionX(value:Single):Single { Md5Joint_Ffi.set_positionX(this, value); return value; }
	public var positionY(get, set):Single;

	inline function get_positionY():Single return Md5Joint_Ffi.get_positionY(this);

	inline function set_positionY(value:Single):Single { Md5Joint_Ffi.set_positionY(this, value); return value; }
	public var positionZ(get, set):Single;

	inline function get_positionZ():Single return Md5Joint_Ffi.get_positionZ(this);

	inline function set_positionZ(value:Single):Single { Md5Joint_Ffi.set_positionZ(this, value); return value; }
}
