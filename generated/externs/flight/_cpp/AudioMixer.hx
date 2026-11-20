package flight._cpp;

private extern class AudioMixer_Ffi {
	@:native("flight_get_audio_mixer_master_gain") static function get_masterGain(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_get_audio_mixer_master_muted") static function get_masterMuted(ptr:cpp.Star<cpp.Void>):Bool;
}

abstract AudioMixer(cpp.Star<cpp.Void>) {
	public var masterGain(get, never):Single;

	inline function get_masterGain():Single return AudioMixer_Ffi.get_masterGain(this);
	public var masterMuted(get, never):Bool;

	inline function get_masterMuted():Bool return AudioMixer_Ffi.get_masterMuted(this);
}
