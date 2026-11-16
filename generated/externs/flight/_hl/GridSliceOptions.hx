package flight._hl;

private extern class GridSliceOptions_Ffi {
	@:hlNative("flight", "flight_field_get_grid_slice_options_image_file")
	static function get_imageFile(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_grid_slice_options_image_file")
	static function set_imageFile(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract GridSliceOptions(hl.Bytes) {
	public var columns(get, set):Int;

	inline function get_columns():Int return this.getI32(0);

	inline function set_columns(value:Int):Int { this.setI32(0, value); return value; }
	public var imageFile(get, set):String;
	inline function get_imageFile():String {
		final bytes = GridSliceOptions_Ffi.get_imageFile(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_imageFile(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		GridSliceOptions_Ffi.set_imageFile(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var imageHeight(get, set):Single;

	inline function get_imageHeight():Single return this.getF32(48);

	inline function set_imageHeight(value:Single):Single { this.setF32(48, value); return value; }
	public var imageWidth(get, set):Single;

	inline function get_imageWidth():Single return this.getF32(52);

	inline function set_imageWidth(value:Single):Single { this.setF32(52, value); return value; }
	public var rows(get, set):Int;

	inline function get_rows():Int return this.getI32(96);

	inline function set_rows(value:Int):Int { this.setI32(96, value); return value; }
}
