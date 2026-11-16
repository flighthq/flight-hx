package flight._hl;

private extern class ThreeDsCamera_Ffi {
	@:hlNative("flight", "flight_field_get_three_ds_camera_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_three_ds_camera_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ThreeDsCamera(hl.Bytes) {
	public var focalLength(get, set):Single;

	inline function get_focalLength():Single return this.getF32(40);

	inline function set_focalLength(value:Single):Single { this.setF32(40, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = ThreeDsCamera_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ThreeDsCamera_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var roll(get, set):Single;

	inline function get_roll():Single return this.getF32(56);

	inline function set_roll(value:Single):Single { this.setF32(56, value); return value; }
}
