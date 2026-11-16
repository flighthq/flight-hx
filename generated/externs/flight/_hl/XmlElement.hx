package flight._hl;

private extern class XmlElement_Ffi {
	@:hlNative("flight", "flight_field_get_xml_element_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_xml_element_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_xml_element_text")
	static function get_text(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_xml_element_text")
	static function set_text(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract XmlElement(hl.Bytes) {
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = XmlElement_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		XmlElement_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var text(get, set):String;
	inline function get_text():String {
		final bytes = XmlElement_Ffi.get_text(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_text(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		XmlElement_Ffi.set_text(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
