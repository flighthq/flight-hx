package flight._hl;

private extern class Awd2ParsedCamera_Ffi {
	@:hlNative("flight", "flight_field_get_awd2_parsed_camera_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_awd2_parsed_camera_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Awd2ParsedCamera(hl.Bytes) {
	public var bottom(get, set):Single;

	inline function get_bottom():Single return this.getF32(40);

	inline function set_bottom(value:Single):Single { this.setF32(40, value); return value; }
	public var fov(get, set):Single;

	inline function get_fov():Single return this.getF32(44);

	inline function set_fov(value:Single):Single { this.setF32(44, value); return value; }
	public var left(get, set):Single;

	inline function get_left():Single return this.getF32(48);

	inline function set_left(value:Single):Single { this.setF32(48, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = Awd2ParsedCamera_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Awd2ParsedCamera_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var parentId(get, set):Int;

	inline function get_parentId():Int return this.getI32(52);

	inline function set_parentId(value:Int):Int { this.setI32(52, value); return value; }
	public var projectionType(get, set):Int;

	inline function get_projectionType():Int return this.getUI16(64);

	inline function set_projectionType(value:Int):Int { this.setUI16(64, value); return value; }
	public var right(get, set):Single;

	inline function get_right():Single return this.getF32(56);

	inline function set_right(value:Single):Single { this.setF32(56, value); return value; }
	public var top(get, set):Single;

	inline function get_top():Single return this.getF32(60);

	inline function set_top(value:Single):Single { this.setF32(60, value); return value; }
}
