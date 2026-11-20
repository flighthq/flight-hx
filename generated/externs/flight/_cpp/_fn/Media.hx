package flight._cpp._fn;

extern class Media {
	@:native("flight_clear_audio_channel_loop_region")
	public static function clearAudioChannelLoopRegion(channel:cpp.Star<cpp.Void>):Void;
	@:native("flight_destroy_audio_channel")
	public static function destroyAudioChannel(channel:cpp.Star<cpp.Void>):Void;
	@:native("flight_fade_audio_channel_gain")
	public static function fadeAudioChannelGain(hostAudioDevice:flight._cpp.HostAudioDeviceCapability, channel:cpp.Star<cpp.Void>, targetGain:Single, durationMs:Single):Void;
	@:native("flight_get_audio_channel_current_time")
	public static function getAudioChannelCurrentTime(channel:cpp.Star<cpp.Void>):Single;
	@:native("flight_get_audio_channel_duration")
	public static function getAudioChannelDuration(channel:cpp.Star<cpp.Void>):Single;
	@:native("flight_get_audio_channel_source_handle")
	public static function getAudioChannelSourceHandle(channel:cpp.Star<cpp.Void>):flight._cpp.AudioSourceHandle;
	@:native("flight_has_audio_channel_fade")
	public static function hasAudioChannelFade(hostAudioDevice:flight._cpp.HostAudioDeviceCapability):Bool;
	@:native("flight_is_audio_channel_muted")
	public static function isAudioChannelMuted(channel:cpp.Star<cpp.Void>):Bool;
	@:native("flight_is_audio_channel_playing")
	public static function isAudioChannelPlaying(channel:cpp.Star<cpp.Void>):Bool;
	@:native("flight_pause_audio_channel")
	public static function pauseAudioChannel(channel:cpp.Star<cpp.Void>):Void;
	@:native("flight_play_audio_resource")
	public static function playAudioResource(backend:flight._cpp.HostAudioDeviceCapability, device:flight._cpp.AudioDeviceHandle, source:cpp.Star<cpp.Void>, options:flight._cpp.AudioPlayOptions):cpp.Star<cpp.Void>;
	@:native("flight_resume_audio_channel")
	public static function resumeAudioChannel(channel:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_audio_channel_current_time")
	public static function setAudioChannelCurrentTime(channel:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_set_audio_channel_gain")
	public static function setAudioChannelGain(channel:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_set_audio_channel_loop_region")
	public static function setAudioChannelLoopRegion(channel:cpp.Star<cpp.Void>, startMs:Single, endMs:Single):Bool;
	@:native("flight_set_audio_channel_muted")
	public static function setAudioChannelMuted(channel:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_set_audio_channel_pan")
	public static function setAudioChannelPan(channel:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_set_audio_channel_playback_rate")
	public static function setAudioChannelPlaybackRate(channel:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_stop_audio_channel")
	public static function stopAudioChannel(channel:cpp.Star<cpp.Void>):Void;
	@:native("flight_create_audio_bus")
	public static function createAudioBus():cpp.Star<cpp.Void>;
	@:native("flight_create_audio_mixer")
	public static function createAudioMixer(hostAudioMixer:flight._cpp.HostAudioMixerCapability, device:flight._cpp.AudioDeviceHandle, options:flight._cpp.AudioMixerOptions):cpp.Star<cpp.Void>;
	@:native("flight_add_audio_bus_to_mixer")
	public static function addAudioBusToMixer(hostAudioMixer:flight._cpp.HostAudioMixerCapability, mixer:cpp.Star<cpp.Void>, bus:cpp.Star<cpp.Void>):Void;
	@:native("flight_destroy_audio_mixer")
	public static function destroyAudioMixer(hostAudioMixer:flight._cpp.HostAudioMixerCapability, mixer:cpp.Star<cpp.Void>):Void;
	@:native("flight_fade_audio_bus_gain")
	public static function fadeAudioBusGain(hostAudioMixer:flight._cpp.HostAudioMixerCapability, mixer:cpp.Star<cpp.Void>, bus:cpp.Star<cpp.Void>, targetGain:Single, durationMs:Single):Void;
	@:native("flight_pause_all_audio_mixer_channels")
	public static function pauseAllAudioMixerChannels(mixer:cpp.Star<cpp.Void>):Void;
	@:native("flight_resume_all_audio_mixer_channels")
	public static function resumeAllAudioMixerChannels(mixer:cpp.Star<cpp.Void>):Void;
	@:native("flight_route_audio_channel_to_mixer_bus")
	public static function routeAudioChannelToMixerBus(hostAudioMixer:flight._cpp.HostAudioMixerCapability, mixer:cpp.Star<cpp.Void>, channel:cpp.Star<cpp.Void>, bus:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_audio_bus_gain")
	public static function setAudioBusGain(hostAudioMixer:flight._cpp.HostAudioMixerCapability, guardState:flight._cpp.AudioMixerGuardStateRef, bus:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_set_audio_bus_muted")
	public static function setAudioBusMuted(hostAudioMixer:flight._cpp.HostAudioMixerCapability, guardState:flight._cpp.AudioMixerGuardStateRef, bus:cpp.Star<cpp.Void>, muted:Bool):Bool;
	@:native("flight_set_audio_bus_pan")
	public static function setAudioBusPan(hostAudioMixer:flight._cpp.HostAudioMixerCapability, guardState:flight._cpp.AudioMixerGuardStateRef, bus:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_set_audio_mixer_master_gain")
	public static function setAudioMixerMasterGain(hostAudioMixer:flight._cpp.HostAudioMixerCapability, mixer:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_set_audio_mixer_master_muted")
	public static function setAudioMixerMasterMuted(hostAudioMixer:flight._cpp.HostAudioMixerCapability, mixer:cpp.Star<cpp.Void>, muted:Bool):Bool;
	@:native("flight_stop_all_audio_mixer_channels")
	public static function stopAllAudioMixerChannels(mixer:cpp.Star<cpp.Void>):Void;
	@:native("flight_unroute_audio_channel_from_mixer_bus")
	public static function unrouteAudioChannelFromMixerBus(hostAudioMixer:flight._cpp.HostAudioMixerCapability, mixer:cpp.Star<cpp.Void>, channel:cpp.Star<cpp.Void>):Void;
	@:native("flight_disable_audio_mixer_guards")
	public static function disableAudioMixerGuards(guardState:flight._cpp.AudioMixerGuardStateRef):Void;
	@:native("flight_enable_audio_channel_signals")
	public static function enableAudioChannelSignals(channel:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_enable_video_channel_signals")
	public static function enableVideoChannelSignals(channel:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_audio_channel_signals")
	public static function getAudioChannelSignals(channel:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_video_channel_signals")
	public static function getVideoChannelSignals(channel:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_destroy_video_channel")
	public static function destroyVideoChannel(hostVideo:flight._cpp.HostVideoCapability, channel:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_video_channel_current_time")
	public static function getVideoChannelCurrentTime(hostVideo:flight._cpp.HostVideoCapability, channel:cpp.Star<cpp.Void>):Single;
	@:native("flight_get_video_channel_duration")
	public static function getVideoChannelDuration(channel:cpp.Star<cpp.Void>):Single;
	@:native("flight_get_video_channel_height")
	public static function getVideoChannelHeight(hostVideo:flight._cpp.HostVideoCapability, channel:cpp.Star<cpp.Void>):Single;
	@:native("flight_get_video_channel_width")
	public static function getVideoChannelWidth(hostVideo:flight._cpp.HostVideoCapability, channel:cpp.Star<cpp.Void>):Single;
	@:native("flight_is_video_channel_muted")
	public static function isVideoChannelMuted(channel:cpp.Star<cpp.Void>):Bool;
	@:native("flight_is_video_channel_playing")
	public static function isVideoChannelPlaying(channel:cpp.Star<cpp.Void>):Bool;
	@:native("flight_pause_video_channel")
	public static function pauseVideoChannel(hostVideo:flight._cpp.HostVideoCapability, channel:cpp.Star<cpp.Void>):Void;
	@:native("flight_play_video_resource")
	public static function playVideoResource(hostVideo:flight._cpp.HostVideoCapability, hostSpawn:flight._cpp.HostSpawnCapability, runtimeState:flight._cpp.VideoChannelRuntimeStateRef, source:cpp.Star<cpp.Void>, options:flight._cpp.VideoPlayOptions):cpp.Star<cpp.Void>;
	@:native("flight_resume_video_channel")
	public static function resumeVideoChannel(hostVideo:flight._cpp.HostVideoCapability, hostSpawn:flight._cpp.HostSpawnCapability, channel:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_video_channel_current_time")
	public static function setVideoChannelCurrentTime(hostVideo:flight._cpp.HostVideoCapability, channel:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_set_video_channel_gain")
	public static function setVideoChannelGain(hostVideo:flight._cpp.HostVideoCapability, channel:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_set_video_channel_muted")
	public static function setVideoChannelMuted(hostVideo:flight._cpp.HostVideoCapability, channel:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_set_video_channel_playback_rate")
	public static function setVideoChannelPlaybackRate(hostVideo:flight._cpp.HostVideoCapability, channel:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_stop_video_channel")
	public static function stopVideoChannel(hostVideo:flight._cpp.HostVideoCapability, channel:cpp.Star<cpp.Void>):Void;
	@:native("flight_free_audio_source_handle")
	public static function freeAudioSourceHandle(ptr:flight._cpp.AudioSourceHandle):Void;
	@:native("flight_free_audio_channel_ref")
	public static function freeAudioChannelRef(ptr:flight._cpp.AudioChannel):Void;
	@:native("flight_free_audio_bus_ref")
	public static function freeAudioBusRef(ptr:flight._cpp.AudioBus):Void;
	@:native("flight_free_audio_mixer_ref")
	public static function freeAudioMixerRef(ptr:flight._cpp.AudioMixer):Void;
	@:native("flight_free_media_channel_signals_ref")
	public static function freeMediaChannelSignalsRef(ptr:flight._cpp.MediaChannelSignals):Void;
	@:native("flight_free_video_channel_ref")
	public static function freeVideoChannelRef(ptr:flight._cpp.VideoChannel):Void;
}
