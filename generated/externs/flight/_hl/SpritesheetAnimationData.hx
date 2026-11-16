package flight._hl;

private extern class SpritesheetAnimationData_Ffi {
	@:hlNative("flight", "flight_field_get_spritesheet_animation_data_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_spritesheet_animation_data_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract SpritesheetAnimationData(hl.Bytes) {
	public var frameDuration(get, set):Float;

	inline function get_frameDuration():Float return this.getF64(24);

	inline function set_frameDuration(value:Float):Float { this.setF64(24, value); return value; }
	public var repeatCount(get, set):Int;

	inline function get_repeatCount():Int return this.getI32(80);

	inline function set_repeatCount(value:Int):Int { this.setI32(80, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = SpritesheetAnimationData_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SpritesheetAnimationData_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var originX(get, set):Single;

	inline function get_originX():Single return this.getF32(112);

	inline function set_originX(value:Single):Single { this.setF32(112, value); return value; }
	public var originY(get, set):Single;

	inline function get_originY():Single return this.getF32(116);

	inline function set_originY(value:Single):Single { this.setF32(116, value); return value; }
}
