package flight._cpp;

private extern class StarlingDocument_Ffi {
	@:native("flight_field_get_starling_document_image_path")
	static function get_imagePath(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_starling_document_image_path")
	static function set_imagePath(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract StarlingDocument(cpp.Star<cpp.Void>) {
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
		StarlingDocument_Ffi.set_imagePath(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
