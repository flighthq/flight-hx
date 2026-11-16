package flight._cpp;

private extern class AudioResourceUrl_Ffi {
	@:native("flight_field_get_audio_resource_url_url")
	static function get_url(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_audio_resource_url_url")
	static function set_url(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract AudioResourceUrl(cpp.Star<cpp.Void>) {
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
		AudioResourceUrl_Ffi.set_url(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
