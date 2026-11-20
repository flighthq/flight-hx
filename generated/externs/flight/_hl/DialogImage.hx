package flight._hl;

private extern class DialogImage_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_dialog_image_data_url")
	static function get_dataUrl(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_dialog_image_data_url")
	static function set_dataUrl(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_dialog_image_mime_type")
	static function get_mimeType(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_dialog_image_mime_type")
	static function set_mimeType(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract DialogImage(hl.Bytes) {
	public var dataUrl(get, set):String;
	inline function get_dataUrl():String { var raw = DialogImage_Ffi.get_dataUrl(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DialogImage_Ffi.freeString(raw); return value; }
	inline function set_dataUrl(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DialogImage_Ffi.set_dataUrl(this, raw); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(48);

	inline function set_height(value:Single):Single { this.setF32(48, value); return value; }
	public var mimeType(get, set):String;
	inline function get_mimeType():String { var raw = DialogImage_Ffi.get_mimeType(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DialogImage_Ffi.freeString(raw); return value; }
	inline function set_mimeType(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DialogImage_Ffi.set_mimeType(this, raw); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(52);

	inline function set_width(value:Single):Single { this.setF32(52, value); return value; }
}
