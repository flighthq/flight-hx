package flight._cpp;

private extern class AnimationRootMotionExtractor_Ffi {
	@:native("flight_get_animation_root_motion_extractor_channel_index") static function get_channelIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_animation_root_motion_extractor_channel_index") static function set_channelIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract AnimationRootMotionExtractor(cpp.Star<cpp.Void>) {
	public var channelIndex(get, set):Int;

	inline function get_channelIndex():Int return AnimationRootMotionExtractor_Ffi.get_channelIndex(this);

	inline function set_channelIndex(value:Int):Int return AnimationRootMotionExtractor_Ffi.set_channelIndex(this, value);
}
