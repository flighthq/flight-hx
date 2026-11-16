package flight._hl;

private extern class ExternalImageResourceReference_Ffi {
	@:hlNative("flight", "flight_field_get_external_image_resource_reference_uri")
	static function get_uri(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_external_image_resource_reference_uri")
	static function set_uri(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ExternalImageResourceReference(hl.Bytes) {
	public var uri(get, set):String;
	inline function get_uri():String {
		final bytes = ExternalImageResourceReference_Ffi.get_uri(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_uri(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ExternalImageResourceReference_Ffi.set_uri(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
