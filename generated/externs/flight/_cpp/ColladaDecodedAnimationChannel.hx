package flight._cpp;

private extern class ColladaDecodedAnimationChannel_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_collada_decoded_animation_channel_target") static function get_target(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_collada_decoded_animation_channel_target") static function set_target(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ColladaDecodedAnimationChannel(cpp.Star<cpp.Void>) {
	public var target(get, set):String;
	inline function get_target():String { var raw = ColladaDecodedAnimationChannel_Ffi.get_target(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ColladaDecodedAnimationChannel_Ffi.freeString(raw); return value; }
	inline function set_target(value:String):String { var raw:cpp.ConstCharStar = cast value; ColladaDecodedAnimationChannel_Ffi.set_target(this, raw); return value; }
}
