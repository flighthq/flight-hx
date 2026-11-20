package flight._cpp;

private extern class AnimationClipEvent_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_animation_clip_event_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_animation_clip_event_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_animation_clip_event_time") static function get_time(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_animation_clip_event_time") static function set_time(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract AnimationClipEvent(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String { var raw = AnimationClipEvent_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AnimationClipEvent_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; AnimationClipEvent_Ffi.set_name(this, raw); return value; }
	public var time(get, set):Float;

	inline function get_time():Float return AnimationClipEvent_Ffi.get_time(this);

	inline function set_time(value:Float):Float { AnimationClipEvent_Ffi.set_time(this, value); return value; }
}
