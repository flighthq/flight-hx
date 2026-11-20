package flight._hl;

private extern class GridSliceOptions_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_grid_slice_options_image_file")
	static function get_imageFile(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_grid_slice_options_image_file")
	static function set_imageFile(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract GridSliceOptions(hl.Bytes) {
	public var columns(get, set):Int;

	inline function get_columns():Int return this.getI32(0);

	inline function set_columns(value:Int):Int { this.setI32(0, value); return value; }
	public var imageFile(get, set):String;
	inline function get_imageFile():String { var raw = GridSliceOptions_Ffi.get_imageFile(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); GridSliceOptions_Ffi.freeString(raw); return value; }
	inline function set_imageFile(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } GridSliceOptions_Ffi.set_imageFile(this, raw); return value; }
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
