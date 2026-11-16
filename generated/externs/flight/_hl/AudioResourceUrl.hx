package flight._hl;

private extern class AudioResourceUrl_Ffi {
	@:hlNative("flight", "flight_field_get_audio_resource_url_url")
	static function get_url(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_audio_resource_url_url")
	static function set_url(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract AudioResourceUrl(hl.Bytes) {
	public var url(get, set):String;
	inline function get_url():String {
		final bytes = AudioResourceUrl_Ffi.get_url(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_url(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		AudioResourceUrl_Ffi.set_url(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
