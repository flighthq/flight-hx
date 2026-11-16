package flight._cpp;

private extern class ExternalAudioResourceReference_Ffi {
	@:native("flight_field_get_external_audio_resource_reference_uri")
	static function get_uri(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_external_audio_resource_reference_uri")
	static function set_uri(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract ExternalAudioResourceReference(cpp.Star<cpp.Void>) {
	public var uri(get, set):String;
	inline function get_uri():String {
		final bytes = ExternalAudioResourceReference_Ffi.get_uri(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_uri(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ExternalAudioResourceReference_Ffi.set_uri(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
