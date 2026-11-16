package flight._hl;

private extern class SpritesheetData_Ffi {
	@:hlNative("flight", "flight_field_get_spritesheet_data_image_file")
	static function get_imageFile(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_spritesheet_data_image_file")
	static function set_imageFile(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract SpritesheetData(hl.Bytes) {
	public var imageFile(get, set):String;
	inline function get_imageFile():String {
		final bytes = SpritesheetData_Ffi.get_imageFile(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_imageFile(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SpritesheetData_Ffi.set_imageFile(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var imageHeight(get, set):Single;

	inline function get_imageHeight():Single return this.getF32(88);

	inline function set_imageHeight(value:Single):Single { this.setF32(88, value); return value; }
	public var imageWidth(get, set):Single;

	inline function get_imageWidth():Single return this.getF32(92);

	inline function set_imageWidth(value:Single):Single { this.setF32(92, value); return value; }
	public var scale(get, set):Single;

	inline function get_scale():Single return this.getF32(96);

	inline function set_scale(value:Single):Single { this.setF32(96, value); return value; }
}
