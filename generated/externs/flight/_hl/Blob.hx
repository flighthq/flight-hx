package flight._hl;

private extern class Blob_Ffi {
	@:hlNative("flight", "flight_field_get_blob_mime_type")
	static function get_mimeType(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_blob_mime_type")
	static function set_mimeType(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Blob(hl.Bytes) {
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
		Blob_Ffi.set_mimeType(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var size(get, set):Int;

	inline function get_size():Int return this.getI32(24);

	inline function set_size(value:Int):Int { this.setI32(24, value); return value; }
}
