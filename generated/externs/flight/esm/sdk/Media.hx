package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/media")
extern class Media {
  public static function addAudioBusToMixer(hostAudioMixer:flight.esm.types.media_contract.Types.HostAudioMixerCapability, mixer:flight.esm.types.media.Types.AudioMixer, bus:flight.esm.types.media.Types.AudioBus):Void;
  public static function clearAudioChannelLoopRegion(channel:flight.esm.types.media.Types.AudioChannel):Void;
  public static function createAudioBus(?options:Null<flight.esm.types.media.Types.AudioBusOptions>):flight.esm.types.media.Types.AudioBus;
  public static function createAudioMixer(hostAudioMixer:flight.esm.types.media_contract.Types.HostAudioMixerCapability, device:flight.esm.types.host_contract.Types.AudioDeviceHandle, ?options:Null<flight.esm.types.media.Types.AudioMixerOptions>):flight.esm.types.media.Types.AudioMixer;
  public static function destroyAudioChannel(channel:flight.esm.types.media.Types.AudioChannel):Void;
  public static function destroyAudioMixer(hostAudioMixer:flight.esm.types.media_contract.Types.HostAudioMixerCapability, mixer:flight.esm.types.media.Types.AudioMixer):Void;
  public static function destroyVideoChannel(hostVideo:flight.esm.types.video.Types.HostVideoCapability, channel:flight.esm.types.video.Types.VideoChannel):Void;
  public static function disableAudioMixerGuards():Void;
  public static function enableAudioChannelSignals(channel:flight.esm.types.media.Types.AudioChannel):flight.esm.types.media.Types.MediaChannelSignals;
  public static function enableAudioMixerGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function enableVideoChannelSignals(channel:flight.esm.types.video.Types.VideoChannel):flight.esm.types.media.Types.MediaChannelSignals;
  public static function fadeAudioBusGain(hostAudioMixer:flight.esm.types.media_contract.Types.HostAudioMixerCapability, mixer:flight.esm.types.media.Types.AudioMixer, bus:flight.esm.types.media.Types.AudioBus, targetGain:Float, durationMs:Float):Void;
  public static function fadeAudioChannelGain(hostAudioDevice:flight.esm.types.media_contract.Types.HostAudioDeviceCapability, channel:flight.esm.types.media.Types.AudioChannel, targetGain:Float, durationMs:Float):Void;
  public static function getAudioChannelCurrentTime(channel:flight.esm.types.media.Types.AudioChannel):Float;
  public static function getAudioChannelDuration(channel:flight.esm.types.media.Types.AudioChannel):Float;
  public static function getAudioChannelSignals(channel:flight.esm.types.media.Types.AudioChannel):Null<flight.esm.types.media.Types.MediaChannelSignals>;
  public static function getAudioChannelSourceHandle(channel:flight.esm.types.media.Types.AudioChannel):flight.esm.types.host_contract.Types.AudioSourceHandle;
  public static function getAudioMixerActiveChannels(mixer:flight.esm.types.media.Types.AudioMixer):Array<flight.esm.types.media.Types.AudioChannel>;
  public static function getVideoChannelCurrentTime(hostVideo:flight.esm.types.video.Types.HostVideoCapability, channel:flight.esm.types.video.Types.VideoChannel):Float;
  public static function getVideoChannelDuration(channel:flight.esm.types.video.Types.VideoChannel):Float;
  public static function getVideoChannelHeight(hostVideo:flight.esm.types.video.Types.HostVideoCapability, channel:flight.esm.types.video.Types.VideoChannel):Float;
  public static function getVideoChannelSignals(channel:flight.esm.types.video.Types.VideoChannel):Null<flight.esm.types.media.Types.MediaChannelSignals>;
  public static function getVideoChannelWidth(hostVideo:flight.esm.types.video.Types.HostVideoCapability, channel:flight.esm.types.video.Types.VideoChannel):Float;
  public static function hasAudioChannelFade(hostAudioDevice:flight.esm.types.media_contract.Types.HostAudioDeviceCapability):Bool;
  public static function isAudioChannelMuted(channel:flight.esm.types.media.Types.AudioChannel):Bool;
  public static function isAudioChannelPlaying(channel:flight.esm.types.media.Types.AudioChannel):Bool;
  public static function isVideoChannelMuted(channel:flight.esm.types.video.Types.VideoChannel):Bool;
  public static function isVideoChannelPlaying(channel:flight.esm.types.video.Types.VideoChannel):Bool;
  public static function pauseAllAudioMixerChannels(mixer:flight.esm.types.media.Types.AudioMixer):Void;
  public static function pauseAudioChannel(channel:flight.esm.types.media.Types.AudioChannel):Void;
  public static function pauseVideoChannel(hostVideo:flight.esm.types.video.Types.HostVideoCapability, channel:flight.esm.types.video.Types.VideoChannel):Void;
  public static function playAudioResource(backend:flight.esm.types.media_contract.Types.HostAudioDeviceCapability, device:flight.esm.types.host_contract.Types.AudioDeviceHandle, source:flight.esm.types.audio.Types.AudioResource, ?options:Null<flight.esm.types.audio.Types.AudioPlayOptions>):Null<flight.esm.types.media.Types.AudioChannel>;
  public static function playVideoResource(hostVideo:flight.esm.types.video.Types.HostVideoCapability, source:flight.esm.types.video.Types.VideoResource, ?options:Null<flight.esm.types.video.Types.VideoPlayOptions>):Null<flight.esm.types.video.Types.VideoChannel>;
  public static function resumeAllAudioMixerChannels(mixer:flight.esm.types.media.Types.AudioMixer):Void;
  public static function resumeAudioChannel(channel:flight.esm.types.media.Types.AudioChannel):Void;
  public static function resumeVideoChannel(hostVideo:flight.esm.types.video.Types.HostVideoCapability, channel:flight.esm.types.video.Types.VideoChannel):Void;
  public static function routeAudioChannelToMixerBus(hostAudioMixer:flight.esm.types.media_contract.Types.HostAudioMixerCapability, mixer:flight.esm.types.media.Types.AudioMixer, channel:flight.esm.types.media.Types.AudioChannel, bus:flight.esm.types.media.Types.AudioBus):Void;
  public static function setAudioBusGain(hostAudioMixer:flight.esm.types.media_contract.Types.HostAudioMixerCapability, bus:flight.esm.types.media.Types.AudioBus, value:Float):Float;
  public static function setAudioBusMuted(hostAudioMixer:flight.esm.types.media_contract.Types.HostAudioMixerCapability, bus:flight.esm.types.media.Types.AudioBus, muted:Bool):Bool;
  public static function setAudioBusPan(hostAudioMixer:flight.esm.types.media_contract.Types.HostAudioMixerCapability, bus:flight.esm.types.media.Types.AudioBus, value:Float):Float;
  public static function setAudioChannelCurrentTime(channel:flight.esm.types.media.Types.AudioChannel, value:Float):Float;
  public static function setAudioChannelGain(channel:flight.esm.types.media.Types.AudioChannel, value:Float):Float;
  public static function setAudioChannelLoopRegion(channel:flight.esm.types.media.Types.AudioChannel, startMs:Float, endMs:Float):Bool;
  public static function setAudioChannelMuted(channel:flight.esm.types.media.Types.AudioChannel, value:Bool):Bool;
  public static function setAudioChannelPan(channel:flight.esm.types.media.Types.AudioChannel, value:Float):Float;
  public static function setAudioChannelPlaybackRate(channel:flight.esm.types.media.Types.AudioChannel, value:Float):Float;
  public static function setAudioMixerMasterGain(hostAudioMixer:flight.esm.types.media_contract.Types.HostAudioMixerCapability, mixer:flight.esm.types.media.Types.AudioMixer, value:Float):Float;
  public static function setAudioMixerMasterMuted(hostAudioMixer:flight.esm.types.media_contract.Types.HostAudioMixerCapability, mixer:flight.esm.types.media.Types.AudioMixer, muted:Bool):Bool;
  public static function setVideoChannelCurrentTime(hostVideo:flight.esm.types.video.Types.HostVideoCapability, channel:flight.esm.types.video.Types.VideoChannel, value:Float):Float;
  public static function setVideoChannelGain(hostVideo:flight.esm.types.video.Types.HostVideoCapability, channel:flight.esm.types.video.Types.VideoChannel, value:Float):Float;
  public static function setVideoChannelMuted(hostVideo:flight.esm.types.video.Types.HostVideoCapability, channel:flight.esm.types.video.Types.VideoChannel, value:Bool):Bool;
  public static function setVideoChannelPlaybackRate(hostVideo:flight.esm.types.video.Types.HostVideoCapability, channel:flight.esm.types.video.Types.VideoChannel, value:Float):Float;
  public static function stopAllAudioMixerChannels(mixer:flight.esm.types.media.Types.AudioMixer):Void;
  public static function stopAudioChannel(channel:flight.esm.types.media.Types.AudioChannel):Void;
  public static function stopVideoChannel(hostVideo:flight.esm.types.video.Types.HostVideoCapability, channel:flight.esm.types.video.Types.VideoChannel):Void;
  public static function unrouteAudioChannelFromMixerBus(hostAudioMixer:flight.esm.types.media_contract.Types.HostAudioMixerCapability, mixer:flight.esm.types.media.Types.AudioMixer, channel:flight.esm.types.media.Types.AudioChannel):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
