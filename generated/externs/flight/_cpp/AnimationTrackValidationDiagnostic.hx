package flight._cpp;

private extern class AnimationTrackValidationDiagnostic_Ffi {
	@:native("flight_field_get_animation_track_validation_diagnostic_code")
	static function get_code(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_animation_track_validation_diagnostic_code")
	static function set_code(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_animation_track_validation_diagnostic_message")
	static function get_message(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_animation_track_validation_diagnostic_message")
	static function set_message(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract AnimationTrackValidationDiagnostic(cpp.Star<cpp.Void>) {
	public var code(get, set):String;
	inline function get_code():String {
		final bytes = AnimationTrackValidationDiagnostic_Ffi.get_code(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_code(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		AnimationTrackValidationDiagnostic_Ffi.set_code(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var message(get, set):String;
	inline function get_message():String {
		final bytes = AnimationTrackValidationDiagnostic_Ffi.get_message(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_message(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		AnimationTrackValidationDiagnostic_Ffi.set_message(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
