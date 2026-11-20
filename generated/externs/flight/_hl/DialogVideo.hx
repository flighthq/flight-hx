package flight._hl;

private extern class DialogVideo_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_dialog_video_data_url")
	static function get_dataUrl(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_dialog_video_data_url")
	static function set_dataUrl(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_dialog_video_mime_type")
	static function get_mimeType(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_dialog_video_mime_type")
	static function set_mimeType(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract DialogVideo(hl.Bytes) {
	public var dataUrl(get, set):String;
	inline function get_dataUrl():String { var raw = DialogVideo_Ffi.get_dataUrl(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DialogVideo_Ffi.freeString(raw); return value; }
	inline function set_dataUrl(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DialogVideo_Ffi.set_dataUrl(this, raw); return value; }
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(48);

	inline function set_duration(value:Single):Single { this.setF32(48, value); return value; }
	public var mimeType(get, set):String;
	inline function get_mimeType():String { var raw = DialogVideo_Ffi.get_mimeType(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DialogVideo_Ffi.freeString(raw); return value; }
	inline function set_mimeType(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DialogVideo_Ffi.set_mimeType(this, raw); return value; }
}
