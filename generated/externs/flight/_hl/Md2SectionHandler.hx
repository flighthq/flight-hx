package flight._hl;

private extern class Md2SectionHandler_Ffi {
	@:hlNative("flight", "flight_field_get_md2_section_handler_feature")
	static function get_feature(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_md2_section_handler_feature")
	static function set_feature(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Md2SectionHandler(hl.Bytes) {
	public var feature(get, set):String;
	inline function get_feature():String {
		final bytes = Md2SectionHandler_Ffi.get_feature(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_feature(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Md2SectionHandler_Ffi.set_feature(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
