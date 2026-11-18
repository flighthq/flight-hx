package flight._cpp;

private extern class Blob_Ffi {
	@:native("flight_field_get_blob_mime_type")
	static function get_mimeType(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_blob_mime_type")
	static function set_mimeType(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_blob_size") static function get_size(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_blob_size") static function set_size(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Blob(cpp.Star<cpp.Void>) {
	public var mimeType(get, set):String;
	inline function get_mimeType():String {
		final bytes = Blob_Ffi.get_mimeType(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_mimeType(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Blob_Ffi.set_mimeType(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var size(get, set):Int;

	inline function get_size():Int return Blob_Ffi.get_size(this);

	inline function set_size(value:Int):Int { Blob_Ffi.set_size(this, value); return value; }
}
