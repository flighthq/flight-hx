package flight._hl;

private extern class SpritesheetData_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_spritesheet_data_image_file")
	static function get_imageFile(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_spritesheet_data_image_file")
	static function set_imageFile(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract SpritesheetData(hl.Bytes) {
	public var imageFile(get, set):String;
	inline function get_imageFile():String { var raw = SpritesheetData_Ffi.get_imageFile(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); SpritesheetData_Ffi.freeString(raw); return value; }
	inline function set_imageFile(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } SpritesheetData_Ffi.set_imageFile(this, raw); return value; }
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
