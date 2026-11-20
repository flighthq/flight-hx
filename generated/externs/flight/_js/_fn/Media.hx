package flight._js._fn;

@:jsRequire("@flighthq/media")
extern class Media {
	@:native("clearAudioChannelLoopRegion")
	public static function clearAudioChannelLoopRegion(channel:Dynamic):Void;
	@:native("destroyAudioChannel")
	public static function destroyAudioChannel(channel:Dynamic):Void;
	@:native("fadeAudioChannelGain")
	public static function fadeAudioChannelGain(hostAudioDevice:flight._js.HostAudioDeviceCapability, channel:Dynamic, targetGain:Float, durationMs:Float):Void;
	@:native("getAudioChannelCurrentTime")
	public static function getAudioChannelCurrentTime(channel:Dynamic):Float;
	@:native("getAudioChannelDuration")
	public static function getAudioChannelDuration(channel:Dynamic):Float;
	@:native("getAudioChannelSourceHandle")
	public static function getAudioChannelSourceHandle(channel:Dynamic):flight._js.AudioSourceHandle;
	@:native("hasAudioChannelFade")
	public static function hasAudioChannelFade(hostAudioDevice:flight._js.HostAudioDeviceCapability):Bool;
	@:native("isAudioChannelMuted")
	public static function isAudioChannelMuted(channel:Dynamic):Bool;
	@:native("isAudioChannelPlaying")
	public static function isAudioChannelPlaying(channel:Dynamic):Bool;
	@:native("pauseAudioChannel")
	public static function pauseAudioChannel(channel:Dynamic):Void;
	@:native("playAudioResource")
	public static function playAudioResource(backend:flight._js.HostAudioDeviceCapability, device:flight._js.AudioDeviceHandle, source:Dynamic, options:Null<flight._js.AudioPlayOptions>):Null<Dynamic>;
	@:native("resumeAudioChannel")
	public static function resumeAudioChannel(channel:Dynamic):Void;
	@:native("setAudioChannelCurrentTime")
	public static function setAudioChannelCurrentTime(channel:Dynamic, value:Float):Float;
	@:native("setAudioChannelGain")
	public static function setAudioChannelGain(channel:Dynamic, value:Float):Float;
	@:native("setAudioChannelLoopRegion")
	public static function setAudioChannelLoopRegion(channel:Dynamic, startMs:Float, endMs:Float):Bool;
	@:native("setAudioChannelMuted")
	public static function setAudioChannelMuted(channel:Dynamic, value:Bool):Bool;
	@:native("setAudioChannelPan")
	public static function setAudioChannelPan(channel:Dynamic, value:Float):Float;
	@:native("setAudioChannelPlaybackRate")
	public static function setAudioChannelPlaybackRate(channel:Dynamic, value:Float):Float;
	@:native("stopAudioChannel")
	public static function stopAudioChannel(channel:Dynamic):Void;
	@:native("createAudioBus")
	public static function createAudioBus():Dynamic;
	@:native("createAudioMixer")
	public static function createAudioMixer(hostAudioMixer:flight._js.HostAudioMixerCapability, device:flight._js.AudioDeviceHandle, options:Null<flight._js.AudioMixerOptions>):Dynamic;
	@:native("addAudioBusToMixer")
	public static function addAudioBusToMixer(hostAudioMixer:flight._js.HostAudioMixerCapability, mixer:Dynamic, bus:Dynamic):Void;
	@:native("destroyAudioMixer")
	public static function destroyAudioMixer(hostAudioMixer:flight._js.HostAudioMixerCapability, mixer:Dynamic):Void;
	@:native("fadeAudioBusGain")
	public static function fadeAudioBusGain(hostAudioMixer:flight._js.HostAudioMixerCapability, mixer:Dynamic, bus:Dynamic, targetGain:Float, durationMs:Float):Void;
	@:native("pauseAllAudioMixerChannels")
	public static function pauseAllAudioMixerChannels(mixer:Dynamic):Void;
	@:native("resumeAllAudioMixerChannels")
	public static function resumeAllAudioMixerChannels(mixer:Dynamic):Void;
	@:native("routeAudioChannelToMixerBus")
	public static function routeAudioChannelToMixerBus(hostAudioMixer:flight._js.HostAudioMixerCapability, mixer:Dynamic, channel:Dynamic, bus:Dynamic):Void;
	@:native("setAudioBusGain")
	public static function setAudioBusGain(hostAudioMixer:flight._js.HostAudioMixerCapability, guardState:flight._js.AudioMixerGuardStateRef, bus:Dynamic, value:Float):Float;
	@:native("setAudioBusMuted")
	public static function setAudioBusMuted(hostAudioMixer:flight._js.HostAudioMixerCapability, guardState:flight._js.AudioMixerGuardStateRef, bus:Dynamic, muted:Bool):Bool;
	@:native("setAudioBusPan")
	public static function setAudioBusPan(hostAudioMixer:flight._js.HostAudioMixerCapability, guardState:flight._js.AudioMixerGuardStateRef, bus:Dynamic, value:Float):Float;
	@:native("setAudioMixerMasterGain")
	public static function setAudioMixerMasterGain(hostAudioMixer:flight._js.HostAudioMixerCapability, mixer:Dynamic, value:Float):Float;
	@:native("setAudioMixerMasterMuted")
	public static function setAudioMixerMasterMuted(hostAudioMixer:flight._js.HostAudioMixerCapability, mixer:Dynamic, muted:Bool):Bool;
	@:native("stopAllAudioMixerChannels")
	public static function stopAllAudioMixerChannels(mixer:Dynamic):Void;
	@:native("unrouteAudioChannelFromMixerBus")
	public static function unrouteAudioChannelFromMixerBus(hostAudioMixer:flight._js.HostAudioMixerCapability, mixer:Dynamic, channel:Dynamic):Void;
	@:native("disableAudioMixerGuards")
	public static function disableAudioMixerGuards(guardState:flight._js.AudioMixerGuardStateRef):Void;
	@:native("enableAudioMixerGuards")
	public static function enableAudioMixerGuards(guardState:flight._js.AudioMixerGuardStateRef, logState:Dynamic, clock:Dynamic):Void;
	@:native("enableAudioChannelSignals")
	public static function enableAudioChannelSignals(channel:Dynamic):Dynamic;
	@:native("enableVideoChannelSignals")
	public static function enableVideoChannelSignals(channel:Dynamic):Dynamic;
	@:native("getAudioChannelSignals")
	public static function getAudioChannelSignals(channel:Dynamic):Null<Dynamic>;
	@:native("getVideoChannelSignals")
	public static function getVideoChannelSignals(channel:Dynamic):Null<Dynamic>;
	@:native("destroyVideoChannel")
	public static function destroyVideoChannel(hostVideo:flight._js.HostVideoCapability, channel:Dynamic):Void;
	@:native("getVideoChannelCurrentTime")
	public static function getVideoChannelCurrentTime(hostVideo:flight._js.HostVideoCapability, channel:Dynamic):Float;
	@:native("getVideoChannelDuration")
	public static function getVideoChannelDuration(channel:Dynamic):Float;
	@:native("getVideoChannelHeight")
	public static function getVideoChannelHeight(hostVideo:flight._js.HostVideoCapability, channel:Dynamic):Float;
	@:native("getVideoChannelWidth")
	public static function getVideoChannelWidth(hostVideo:flight._js.HostVideoCapability, channel:Dynamic):Float;
	@:native("isVideoChannelMuted")
	public static function isVideoChannelMuted(channel:Dynamic):Bool;
	@:native("isVideoChannelPlaying")
	public static function isVideoChannelPlaying(channel:Dynamic):Bool;
	@:native("pauseVideoChannel")
	public static function pauseVideoChannel(hostVideo:flight._js.HostVideoCapability, channel:Dynamic):Void;
	@:native("playVideoResource")
	public static function playVideoResource(hostVideo:flight._js.HostVideoCapability, hostSpawn:flight._js.HostSpawnCapability, runtimeState:flight._js.VideoChannelRuntimeStateRef, source:Dynamic, options:Null<flight._js.VideoPlayOptions>):Null<Dynamic>;
	@:native("resumeVideoChannel")
	public static function resumeVideoChannel(hostVideo:flight._js.HostVideoCapability, hostSpawn:flight._js.HostSpawnCapability, channel:Dynamic):Void;
	@:native("setVideoChannelCurrentTime")
	public static function setVideoChannelCurrentTime(hostVideo:flight._js.HostVideoCapability, channel:Dynamic, value:Float):Float;
	@:native("setVideoChannelGain")
	public static function setVideoChannelGain(hostVideo:flight._js.HostVideoCapability, channel:Dynamic, value:Float):Float;
	@:native("setVideoChannelMuted")
	public static function setVideoChannelMuted(hostVideo:flight._js.HostVideoCapability, channel:Dynamic, value:Bool):Bool;
	@:native("setVideoChannelPlaybackRate")
	public static function setVideoChannelPlaybackRate(hostVideo:flight._js.HostVideoCapability, channel:Dynamic, value:Float):Float;
	@:native("stopVideoChannel")
	public static function stopVideoChannel(hostVideo:flight._js.HostVideoCapability, channel:Dynamic):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAudioSourceHandle(ptr:flight._js.AudioSourceHandle):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAudioChannelRef(ptr:flight._js.AudioChannel):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAudioBusRef(ptr:flight._js.AudioBus):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAudioMixerRef(ptr:flight._js.AudioMixer):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMediaChannelSignalsRef(ptr:flight._js.MediaChannelSignals):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeVideoChannelRef(ptr:flight._js.VideoChannel):Void {}
}
