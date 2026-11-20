package flight._hl._fn;

extern class Media {
	@:hlNative("flight", "flight_clear_audio_channel_loop_region")
	public static function clearAudioChannelLoopRegion(channel:hl.Bytes):Void;
	@:hlNative("flight", "flight_destroy_audio_channel")
	public static function destroyAudioChannel(channel:hl.Bytes):Void;
	@:hlNative("flight", "flight_fade_audio_channel_gain")
	public static function fadeAudioChannelGain(hostAudioDevice:flight._hl.HostAudioDeviceCapability, channel:hl.Bytes, targetGain:Single, durationMs:Single):Void;
	@:hlNative("flight", "flight_get_audio_channel_current_time")
	public static function getAudioChannelCurrentTime(channel:hl.Bytes):Single;
	@:hlNative("flight", "flight_get_audio_channel_duration")
	public static function getAudioChannelDuration(channel:hl.Bytes):Single;
	@:hlNative("flight", "flight_get_audio_channel_source_handle")
	public static function getAudioChannelSourceHandle(channel:hl.Bytes):flight._hl.AudioSourceHandle;
	@:hlNative("flight", "flight_has_audio_channel_fade")
	public static function hasAudioChannelFade(hostAudioDevice:flight._hl.HostAudioDeviceCapability):Bool;
	@:hlNative("flight", "flight_is_audio_channel_muted")
	public static function isAudioChannelMuted(channel:hl.Bytes):Bool;
	@:hlNative("flight", "flight_is_audio_channel_playing")
	public static function isAudioChannelPlaying(channel:hl.Bytes):Bool;
	@:hlNative("flight", "flight_pause_audio_channel")
	public static function pauseAudioChannel(channel:hl.Bytes):Void;
	@:hlNative("flight", "flight_play_audio_resource")
	public static function playAudioResource(backend:flight._hl.HostAudioDeviceCapability, device:flight._hl.AudioDeviceHandle, source:hl.Bytes, options:flight._hl.AudioPlayOptions):hl.Bytes;
	@:hlNative("flight", "flight_resume_audio_channel")
	public static function resumeAudioChannel(channel:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_audio_channel_current_time")
	public static function setAudioChannelCurrentTime(channel:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_set_audio_channel_gain")
	public static function setAudioChannelGain(channel:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_set_audio_channel_loop_region")
	public static function setAudioChannelLoopRegion(channel:hl.Bytes, startMs:Single, endMs:Single):Bool;
	@:hlNative("flight", "flight_set_audio_channel_muted")
	public static function setAudioChannelMuted(channel:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_set_audio_channel_pan")
	public static function setAudioChannelPan(channel:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_set_audio_channel_playback_rate")
	public static function setAudioChannelPlaybackRate(channel:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_stop_audio_channel")
	public static function stopAudioChannel(channel:hl.Bytes):Void;
	@:hlNative("flight", "flight_create_audio_bus")
	public static function createAudioBus():hl.Bytes;
	@:hlNative("flight", "flight_create_audio_mixer")
	public static function createAudioMixer(hostAudioMixer:flight._hl.HostAudioMixerCapability, device:flight._hl.AudioDeviceHandle, options:flight._hl.AudioMixerOptions):hl.Bytes;
	@:hlNative("flight", "flight_add_audio_bus_to_mixer")
	public static function addAudioBusToMixer(hostAudioMixer:flight._hl.HostAudioMixerCapability, mixer:hl.Bytes, bus:hl.Bytes):Void;
	@:hlNative("flight", "flight_destroy_audio_mixer")
	public static function destroyAudioMixer(hostAudioMixer:flight._hl.HostAudioMixerCapability, mixer:hl.Bytes):Void;
	@:hlNative("flight", "flight_fade_audio_bus_gain")
	public static function fadeAudioBusGain(hostAudioMixer:flight._hl.HostAudioMixerCapability, mixer:hl.Bytes, bus:hl.Bytes, targetGain:Single, durationMs:Single):Void;
	@:hlNative("flight", "flight_pause_all_audio_mixer_channels")
	public static function pauseAllAudioMixerChannels(mixer:hl.Bytes):Void;
	@:hlNative("flight", "flight_resume_all_audio_mixer_channels")
	public static function resumeAllAudioMixerChannels(mixer:hl.Bytes):Void;
	@:hlNative("flight", "flight_route_audio_channel_to_mixer_bus")
	public static function routeAudioChannelToMixerBus(hostAudioMixer:flight._hl.HostAudioMixerCapability, mixer:hl.Bytes, channel:hl.Bytes, bus:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_audio_bus_gain")
	public static function setAudioBusGain(hostAudioMixer:flight._hl.HostAudioMixerCapability, guardState:flight._hl.AudioMixerGuardStateRef, bus:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_set_audio_bus_muted")
	public static function setAudioBusMuted(hostAudioMixer:flight._hl.HostAudioMixerCapability, guardState:flight._hl.AudioMixerGuardStateRef, bus:hl.Bytes, muted:Bool):Bool;
	@:hlNative("flight", "flight_set_audio_bus_pan")
	public static function setAudioBusPan(hostAudioMixer:flight._hl.HostAudioMixerCapability, guardState:flight._hl.AudioMixerGuardStateRef, bus:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_set_audio_mixer_master_gain")
	public static function setAudioMixerMasterGain(hostAudioMixer:flight._hl.HostAudioMixerCapability, mixer:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_set_audio_mixer_master_muted")
	public static function setAudioMixerMasterMuted(hostAudioMixer:flight._hl.HostAudioMixerCapability, mixer:hl.Bytes, muted:Bool):Bool;
	@:hlNative("flight", "flight_stop_all_audio_mixer_channels")
	public static function stopAllAudioMixerChannels(mixer:hl.Bytes):Void;
	@:hlNative("flight", "flight_unroute_audio_channel_from_mixer_bus")
	public static function unrouteAudioChannelFromMixerBus(hostAudioMixer:flight._hl.HostAudioMixerCapability, mixer:hl.Bytes, channel:hl.Bytes):Void;
	@:hlNative("flight", "flight_disable_audio_mixer_guards")
	public static function disableAudioMixerGuards(guardState:flight._hl.AudioMixerGuardStateRef):Void;
	@:hlNative("flight", "flight_enable_audio_channel_signals")
	public static function enableAudioChannelSignals(channel:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_enable_video_channel_signals")
	public static function enableVideoChannelSignals(channel:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_audio_channel_signals")
	public static function getAudioChannelSignals(channel:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_video_channel_signals")
	public static function getVideoChannelSignals(channel:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_destroy_video_channel")
	public static function destroyVideoChannel(hostVideo:flight._hl.HostVideoCapability, channel:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_video_channel_current_time")
	public static function getVideoChannelCurrentTime(hostVideo:flight._hl.HostVideoCapability, channel:hl.Bytes):Single;
	@:hlNative("flight", "flight_get_video_channel_duration")
	public static function getVideoChannelDuration(channel:hl.Bytes):Single;
	@:hlNative("flight", "flight_get_video_channel_height")
	public static function getVideoChannelHeight(hostVideo:flight._hl.HostVideoCapability, channel:hl.Bytes):Single;
	@:hlNative("flight", "flight_get_video_channel_width")
	public static function getVideoChannelWidth(hostVideo:flight._hl.HostVideoCapability, channel:hl.Bytes):Single;
	@:hlNative("flight", "flight_is_video_channel_muted")
	public static function isVideoChannelMuted(channel:hl.Bytes):Bool;
	@:hlNative("flight", "flight_is_video_channel_playing")
	public static function isVideoChannelPlaying(channel:hl.Bytes):Bool;
	@:hlNative("flight", "flight_pause_video_channel")
	public static function pauseVideoChannel(hostVideo:flight._hl.HostVideoCapability, channel:hl.Bytes):Void;
	@:hlNative("flight", "flight_play_video_resource")
	public static function playVideoResource(hostVideo:flight._hl.HostVideoCapability, hostSpawn:flight._hl.HostSpawnCapability, runtimeState:flight._hl.VideoChannelRuntimeStateRef, source:hl.Bytes, options:flight._hl.VideoPlayOptions):hl.Bytes;
	@:hlNative("flight", "flight_resume_video_channel")
	public static function resumeVideoChannel(hostVideo:flight._hl.HostVideoCapability, hostSpawn:flight._hl.HostSpawnCapability, channel:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_video_channel_current_time")
	public static function setVideoChannelCurrentTime(hostVideo:flight._hl.HostVideoCapability, channel:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_set_video_channel_gain")
	public static function setVideoChannelGain(hostVideo:flight._hl.HostVideoCapability, channel:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_set_video_channel_muted")
	public static function setVideoChannelMuted(hostVideo:flight._hl.HostVideoCapability, channel:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_set_video_channel_playback_rate")
	public static function setVideoChannelPlaybackRate(hostVideo:flight._hl.HostVideoCapability, channel:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_stop_video_channel")
	public static function stopVideoChannel(hostVideo:flight._hl.HostVideoCapability, channel:hl.Bytes):Void;
	@:hlNative("flight", "flight_free_audio_source_handle")
	public static function freeAudioSourceHandle(ptr:flight._hl.AudioSourceHandle):Void;
	@:hlNative("flight", "flight_free_audio_channel_ref")
	public static function freeAudioChannelRef(ptr:flight._hl.AudioChannel):Void;
	@:hlNative("flight", "flight_free_audio_bus_ref")
	public static function freeAudioBusRef(ptr:flight._hl.AudioBus):Void;
	@:hlNative("flight", "flight_free_audio_mixer_ref")
	public static function freeAudioMixerRef(ptr:flight._hl.AudioMixer):Void;
	@:hlNative("flight", "flight_free_media_channel_signals_ref")
	public static function freeMediaChannelSignalsRef(ptr:flight._hl.MediaChannelSignals):Void;
	@:hlNative("flight", "flight_free_video_channel_ref")
	public static function freeVideoChannelRef(ptr:flight._hl.VideoChannel):Void;
}
