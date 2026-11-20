package flight._cpp;

private extern class RiveAnimationClip_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_rive_animation_clip_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_rive_animation_clip_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_rive_animation_clip_speed") static function get_speed(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rive_animation_clip_speed") static function set_speed(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract RiveAnimationClip(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String { var raw = RiveAnimationClip_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RiveAnimationClip_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; RiveAnimationClip_Ffi.set_name(this, raw); return value; }
	public var speed(get, set):Float;

	inline function get_speed():Float return RiveAnimationClip_Ffi.get_speed(this);

	inline function set_speed(value:Float):Float { RiveAnimationClip_Ffi.set_speed(this, value); return value; }
}
