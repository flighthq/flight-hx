package flight._hl;

private extern class AudioMixer_Ffi {
	@:hlNative("flight", "flight_get_audio_mixer_master_gain")
	static function get_masterGain(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_get_audio_mixer_master_muted")
	static function get_masterMuted(ptr:hl.Bytes):Bool;
}

abstract AudioMixer(hl.Bytes) {
	public var masterGain(get, never):Single;

	inline function get_masterGain():Single return AudioMixer_Ffi.get_masterGain(this);

	public var masterMuted(get, never):Bool;

	inline function get_masterMuted():Bool return AudioMixer_Ffi.get_masterMuted(this);

}
