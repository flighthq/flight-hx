package flight._hl;

private extern class Md5Joint_Ffi {
	@:hlNative("flight", "flight_field_get_md5_joint_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_md5_joint_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Md5Joint(hl.Bytes) {
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
		Md5Joint_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var orientationW(get, set):Single;

	inline function get_orientationW():Single return this.getF32(24);

	inline function set_orientationW(value:Single):Single { this.setF32(24, value); return value; }
	public var orientationX(get, set):Single;

	inline function get_orientationX():Single return this.getF32(28);

	inline function set_orientationX(value:Single):Single { this.setF32(28, value); return value; }
	public var orientationY(get, set):Single;

	inline function get_orientationY():Single return this.getF32(32);

	inline function set_orientationY(value:Single):Single { this.setF32(32, value); return value; }
	public var orientationZ(get, set):Single;

	inline function get_orientationZ():Single return this.getF32(36);

	inline function set_orientationZ(value:Single):Single { this.setF32(36, value); return value; }
	public var parentIndex(get, set):Int;

	inline function get_parentIndex():Int return this.getI32(40);

	inline function set_parentIndex(value:Int):Int { this.setI32(40, value); return value; }
	public var positionX(get, set):Single;

	inline function get_positionX():Single return this.getF32(44);

	inline function set_positionX(value:Single):Single { this.setF32(44, value); return value; }
	public var positionY(get, set):Single;

	inline function get_positionY():Single return this.getF32(48);

	inline function set_positionY(value:Single):Single { this.setF32(48, value); return value; }
	public var positionZ(get, set):Single;

	inline function get_positionZ():Single return this.getF32(52);

	inline function set_positionZ(value:Single):Single { this.setF32(52, value); return value; }
}
