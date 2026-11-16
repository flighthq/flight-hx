package flight._hl;

private extern class StarlingDocument_Ffi {
	@:hlNative("flight", "flight_field_get_starling_document_image_path")
	static function get_imagePath(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_starling_document_image_path")
	static function set_imagePath(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract StarlingDocument(hl.Bytes) {
	public var imagePath(get, set):String;
	inline function get_imagePath():String {
		final bytes = StarlingDocument_Ffi.get_imagePath(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_imagePath(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		StarlingDocument_Ffi.set_imagePath(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
