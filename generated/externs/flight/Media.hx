package flight;

#if (js && flight_esm)
extern inline function clearAudioChannelLoopRegion(channel:Dynamic):Void {
	flight._js._fn.Media.clearAudioChannelLoopRegion(channel);
}
#else
extern inline function clearAudioChannelLoopRegion(channel:Dynamic):Void {
#if hl
	flight._hl._fn.Media.clearAudioChannelLoopRegion(channel);
#elseif cpp
	flight._cpp._fn.Media.clearAudioChannelLoopRegion(channel);
#elseif (js && flight_esm)
	flight._js._fn.Media.clearAudioChannelLoopRegion(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function destroyAudioChannel(channel:Dynamic):Void {
	flight._js._fn.Media.destroyAudioChannel(channel);
}
#else
extern inline function destroyAudioChannel(channel:Dynamic):Void {
#if hl
	flight._hl._fn.Media.destroyAudioChannel(channel);
#elseif cpp
	flight._cpp._fn.Media.destroyAudioChannel(channel);
#elseif (js && flight_esm)
	flight._js._fn.Media.destroyAudioChannel(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function fadeAudioChannelGain(hostAudioDevice:HostAudioDeviceCapability, channel:Dynamic, targetGain:Float, durationMs:Float):Void {
	flight._js._fn.Media.fadeAudioChannelGain(hostAudioDevice, channel, targetGain, durationMs);
}
#else
extern inline function fadeAudioChannelGain(hostAudioDevice:HostAudioDeviceCapability, channel:Dynamic, targetGain:Float, durationMs:Float):Void {
#if hl
	flight._hl._fn.Media.fadeAudioChannelGain(hostAudioDevice, channel, targetGain, durationMs);
#elseif cpp
	flight._cpp._fn.Media.fadeAudioChannelGain(hostAudioDevice, channel, targetGain, durationMs);
#elseif (js && flight_esm)
	flight._js._fn.Media.fadeAudioChannelGain(hostAudioDevice, channel, targetGain, durationMs);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAudioChannelCurrentTime(channel:Dynamic):Float {
	return flight._js._fn.Media.getAudioChannelCurrentTime(channel);
}
#else
extern inline function getAudioChannelCurrentTime(channel:Dynamic):Float {
#if hl
	return flight._hl._fn.Media.getAudioChannelCurrentTime(channel);
#elseif cpp
	return flight._cpp._fn.Media.getAudioChannelCurrentTime(channel);
#elseif (js && flight_esm)
	return flight._js._fn.Media.getAudioChannelCurrentTime(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAudioChannelDuration(channel:Dynamic):Float {
	return flight._js._fn.Media.getAudioChannelDuration(channel);
}
#else
extern inline function getAudioChannelDuration(channel:Dynamic):Float {
#if hl
	return flight._hl._fn.Media.getAudioChannelDuration(channel);
#elseif cpp
	return flight._cpp._fn.Media.getAudioChannelDuration(channel);
#elseif (js && flight_esm)
	return flight._js._fn.Media.getAudioChannelDuration(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAudioChannelSourceHandle(channel:Dynamic):AudioSourceHandle {
	return flight._js._fn.Media.getAudioChannelSourceHandle(channel);
}
#else
extern inline function getAudioChannelSourceHandle(channel:Dynamic):AudioSourceHandle {
#if hl
	return flight._hl._fn.Media.getAudioChannelSourceHandle(channel);
#elseif cpp
	return flight._cpp._fn.Media.getAudioChannelSourceHandle(channel);
#elseif (js && flight_esm)
	return flight._js._fn.Media.getAudioChannelSourceHandle(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasAudioChannelFade(hostAudioDevice:HostAudioDeviceCapability):Bool {
	return flight._js._fn.Media.hasAudioChannelFade(hostAudioDevice);
}
#else
extern inline function hasAudioChannelFade(hostAudioDevice:HostAudioDeviceCapability):Bool {
#if hl
	return flight._hl._fn.Media.hasAudioChannelFade(hostAudioDevice);
#elseif cpp
	return flight._cpp._fn.Media.hasAudioChannelFade(hostAudioDevice);
#elseif (js && flight_esm)
	return flight._js._fn.Media.hasAudioChannelFade(hostAudioDevice);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isAudioChannelMuted(channel:Dynamic):Bool {
	return flight._js._fn.Media.isAudioChannelMuted(channel);
}
#else
extern inline function isAudioChannelMuted(channel:Dynamic):Bool {
#if hl
	return flight._hl._fn.Media.isAudioChannelMuted(channel);
#elseif cpp
	return flight._cpp._fn.Media.isAudioChannelMuted(channel);
#elseif (js && flight_esm)
	return flight._js._fn.Media.isAudioChannelMuted(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isAudioChannelPlaying(channel:Dynamic):Bool {
	return flight._js._fn.Media.isAudioChannelPlaying(channel);
}
#else
extern inline function isAudioChannelPlaying(channel:Dynamic):Bool {
#if hl
	return flight._hl._fn.Media.isAudioChannelPlaying(channel);
#elseif cpp
	return flight._cpp._fn.Media.isAudioChannelPlaying(channel);
#elseif (js && flight_esm)
	return flight._js._fn.Media.isAudioChannelPlaying(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function pauseAudioChannel(channel:Dynamic):Void {
	flight._js._fn.Media.pauseAudioChannel(channel);
}
#else
extern inline function pauseAudioChannel(channel:Dynamic):Void {
#if hl
	flight._hl._fn.Media.pauseAudioChannel(channel);
#elseif cpp
	flight._cpp._fn.Media.pauseAudioChannel(channel);
#elseif (js && flight_esm)
	flight._js._fn.Media.pauseAudioChannel(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function playAudioResource(backend:HostAudioDeviceCapability, device:AudioDeviceHandle, source:Dynamic, options:Null<AudioPlayOptions>):Null<Dynamic> {
	return flight._js._fn.Media.playAudioResource(backend, device, source, options);
}
#else
extern inline function playAudioResource(backend:HostAudioDeviceCapability, device:AudioDeviceHandle, source:Dynamic, options:AudioPlayOptions):Dynamic {
#if hl
	return flight._hl._fn.Media.playAudioResource(backend, device, source, options);
#elseif cpp
	return flight._cpp._fn.Media.playAudioResource(backend, device, source, options);
#elseif (js && flight_esm)
	return flight._js._fn.Media.playAudioResource(backend, device, source, options);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resumeAudioChannel(channel:Dynamic):Void {
	flight._js._fn.Media.resumeAudioChannel(channel);
}
#else
extern inline function resumeAudioChannel(channel:Dynamic):Void {
#if hl
	flight._hl._fn.Media.resumeAudioChannel(channel);
#elseif cpp
	flight._cpp._fn.Media.resumeAudioChannel(channel);
#elseif (js && flight_esm)
	flight._js._fn.Media.resumeAudioChannel(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAudioChannelCurrentTime(channel:Dynamic, value:Float):Float {
	return flight._js._fn.Media.setAudioChannelCurrentTime(channel, value);
}
#else
extern inline function setAudioChannelCurrentTime(channel:Dynamic, value:Float):Float {
#if hl
	return flight._hl._fn.Media.setAudioChannelCurrentTime(channel, value);
#elseif cpp
	return flight._cpp._fn.Media.setAudioChannelCurrentTime(channel, value);
#elseif (js && flight_esm)
	return flight._js._fn.Media.setAudioChannelCurrentTime(channel, value);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAudioChannelGain(channel:Dynamic, value:Float):Float {
	return flight._js._fn.Media.setAudioChannelGain(channel, value);
}
#else
extern inline function setAudioChannelGain(channel:Dynamic, value:Float):Float {
#if hl
	return flight._hl._fn.Media.setAudioChannelGain(channel, value);
#elseif cpp
	return flight._cpp._fn.Media.setAudioChannelGain(channel, value);
#elseif (js && flight_esm)
	return flight._js._fn.Media.setAudioChannelGain(channel, value);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAudioChannelLoopRegion(channel:Dynamic, startMs:Float, endMs:Float):Bool {
	return flight._js._fn.Media.setAudioChannelLoopRegion(channel, startMs, endMs);
}
#else
extern inline function setAudioChannelLoopRegion(channel:Dynamic, startMs:Float, endMs:Float):Bool {
#if hl
	return flight._hl._fn.Media.setAudioChannelLoopRegion(channel, startMs, endMs);
#elseif cpp
	return flight._cpp._fn.Media.setAudioChannelLoopRegion(channel, startMs, endMs);
#elseif (js && flight_esm)
	return flight._js._fn.Media.setAudioChannelLoopRegion(channel, startMs, endMs);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAudioChannelMuted(channel:Dynamic, value:Bool):Bool {
	return flight._js._fn.Media.setAudioChannelMuted(channel, value);
}
#else
extern inline function setAudioChannelMuted(channel:Dynamic, value:Bool):Bool {
#if hl
	return flight._hl._fn.Media.setAudioChannelMuted(channel, value);
#elseif cpp
	return flight._cpp._fn.Media.setAudioChannelMuted(channel, value);
#elseif (js && flight_esm)
	return flight._js._fn.Media.setAudioChannelMuted(channel, value);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAudioChannelPan(channel:Dynamic, value:Float):Float {
	return flight._js._fn.Media.setAudioChannelPan(channel, value);
}
#else
extern inline function setAudioChannelPan(channel:Dynamic, value:Float):Float {
#if hl
	return flight._hl._fn.Media.setAudioChannelPan(channel, value);
#elseif cpp
	return flight._cpp._fn.Media.setAudioChannelPan(channel, value);
#elseif (js && flight_esm)
	return flight._js._fn.Media.setAudioChannelPan(channel, value);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAudioChannelPlaybackRate(channel:Dynamic, value:Float):Float {
	return flight._js._fn.Media.setAudioChannelPlaybackRate(channel, value);
}
#else
extern inline function setAudioChannelPlaybackRate(channel:Dynamic, value:Float):Float {
#if hl
	return flight._hl._fn.Media.setAudioChannelPlaybackRate(channel, value);
#elseif cpp
	return flight._cpp._fn.Media.setAudioChannelPlaybackRate(channel, value);
#elseif (js && flight_esm)
	return flight._js._fn.Media.setAudioChannelPlaybackRate(channel, value);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function stopAudioChannel(channel:Dynamic):Void {
	flight._js._fn.Media.stopAudioChannel(channel);
}
#else
extern inline function stopAudioChannel(channel:Dynamic):Void {
#if hl
	flight._hl._fn.Media.stopAudioChannel(channel);
#elseif cpp
	flight._cpp._fn.Media.stopAudioChannel(channel);
#elseif (js && flight_esm)
	flight._js._fn.Media.stopAudioChannel(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createAudioBus():Dynamic {
	return flight._js._fn.Media.createAudioBus();
}
#else
extern inline function createAudioBus():Dynamic {
#if hl
	return flight._hl._fn.Media.createAudioBus();
#elseif cpp
	return flight._cpp._fn.Media.createAudioBus();
#elseif (js && flight_esm)
	return flight._js._fn.Media.createAudioBus();
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createAudioMixer(hostAudioMixer:HostAudioMixerCapability, device:AudioDeviceHandle, options:Null<AudioMixerOptions>):Dynamic {
	return flight._js._fn.Media.createAudioMixer(hostAudioMixer, device, options);
}
#else
extern inline function createAudioMixer(hostAudioMixer:HostAudioMixerCapability, device:AudioDeviceHandle, options:AudioMixerOptions):Dynamic {
#if hl
	return flight._hl._fn.Media.createAudioMixer(hostAudioMixer, device, options);
#elseif cpp
	return flight._cpp._fn.Media.createAudioMixer(hostAudioMixer, device, options);
#elseif (js && flight_esm)
	return flight._js._fn.Media.createAudioMixer(hostAudioMixer, device, options);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addAudioBusToMixer(hostAudioMixer:HostAudioMixerCapability, mixer:Dynamic, bus:Dynamic):Void {
	flight._js._fn.Media.addAudioBusToMixer(hostAudioMixer, mixer, bus);
}
#else
extern inline function addAudioBusToMixer(hostAudioMixer:HostAudioMixerCapability, mixer:Dynamic, bus:Dynamic):Void {
#if hl
	flight._hl._fn.Media.addAudioBusToMixer(hostAudioMixer, mixer, bus);
#elseif cpp
	flight._cpp._fn.Media.addAudioBusToMixer(hostAudioMixer, mixer, bus);
#elseif (js && flight_esm)
	flight._js._fn.Media.addAudioBusToMixer(hostAudioMixer, mixer, bus);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function destroyAudioMixer(hostAudioMixer:HostAudioMixerCapability, mixer:Dynamic):Void {
	flight._js._fn.Media.destroyAudioMixer(hostAudioMixer, mixer);
}
#else
extern inline function destroyAudioMixer(hostAudioMixer:HostAudioMixerCapability, mixer:Dynamic):Void {
#if hl
	flight._hl._fn.Media.destroyAudioMixer(hostAudioMixer, mixer);
#elseif cpp
	flight._cpp._fn.Media.destroyAudioMixer(hostAudioMixer, mixer);
#elseif (js && flight_esm)
	flight._js._fn.Media.destroyAudioMixer(hostAudioMixer, mixer);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function fadeAudioBusGain(hostAudioMixer:HostAudioMixerCapability, mixer:Dynamic, bus:Dynamic, targetGain:Float, durationMs:Float):Void {
	flight._js._fn.Media.fadeAudioBusGain(hostAudioMixer, mixer, bus, targetGain, durationMs);
}
#else
extern inline function fadeAudioBusGain(hostAudioMixer:HostAudioMixerCapability, mixer:Dynamic, bus:Dynamic, targetGain:Float, durationMs:Float):Void {
#if hl
	flight._hl._fn.Media.fadeAudioBusGain(hostAudioMixer, mixer, bus, targetGain, durationMs);
#elseif cpp
	flight._cpp._fn.Media.fadeAudioBusGain(hostAudioMixer, mixer, bus, targetGain, durationMs);
#elseif (js && flight_esm)
	flight._js._fn.Media.fadeAudioBusGain(hostAudioMixer, mixer, bus, targetGain, durationMs);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function pauseAllAudioMixerChannels(mixer:Dynamic):Void {
	flight._js._fn.Media.pauseAllAudioMixerChannels(mixer);
}
#else
extern inline function pauseAllAudioMixerChannels(mixer:Dynamic):Void {
#if hl
	flight._hl._fn.Media.pauseAllAudioMixerChannels(mixer);
#elseif cpp
	flight._cpp._fn.Media.pauseAllAudioMixerChannels(mixer);
#elseif (js && flight_esm)
	flight._js._fn.Media.pauseAllAudioMixerChannels(mixer);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resumeAllAudioMixerChannels(mixer:Dynamic):Void {
	flight._js._fn.Media.resumeAllAudioMixerChannels(mixer);
}
#else
extern inline function resumeAllAudioMixerChannels(mixer:Dynamic):Void {
#if hl
	flight._hl._fn.Media.resumeAllAudioMixerChannels(mixer);
#elseif cpp
	flight._cpp._fn.Media.resumeAllAudioMixerChannels(mixer);
#elseif (js && flight_esm)
	flight._js._fn.Media.resumeAllAudioMixerChannels(mixer);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function routeAudioChannelToMixerBus(hostAudioMixer:HostAudioMixerCapability, mixer:Dynamic, channel:Dynamic, bus:Dynamic):Void {
	flight._js._fn.Media.routeAudioChannelToMixerBus(hostAudioMixer, mixer, channel, bus);
}
#else
extern inline function routeAudioChannelToMixerBus(hostAudioMixer:HostAudioMixerCapability, mixer:Dynamic, channel:Dynamic, bus:Dynamic):Void {
#if hl
	flight._hl._fn.Media.routeAudioChannelToMixerBus(hostAudioMixer, mixer, channel, bus);
#elseif cpp
	flight._cpp._fn.Media.routeAudioChannelToMixerBus(hostAudioMixer, mixer, channel, bus);
#elseif (js && flight_esm)
	flight._js._fn.Media.routeAudioChannelToMixerBus(hostAudioMixer, mixer, channel, bus);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAudioBusGain(hostAudioMixer:HostAudioMixerCapability, guardState:AudioMixerGuardStateRef, bus:Dynamic, value:Float):Float {
	return flight._js._fn.Media.setAudioBusGain(hostAudioMixer, guardState, bus, value);
}
#else
extern inline function setAudioBusGain(hostAudioMixer:HostAudioMixerCapability, guardState:AudioMixerGuardStateRef, bus:Dynamic, value:Float):Float {
#if hl
	return flight._hl._fn.Media.setAudioBusGain(hostAudioMixer, guardState, bus, value);
#elseif cpp
	return flight._cpp._fn.Media.setAudioBusGain(hostAudioMixer, guardState, bus, value);
#elseif (js && flight_esm)
	return flight._js._fn.Media.setAudioBusGain(hostAudioMixer, guardState, bus, value);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAudioBusMuted(hostAudioMixer:HostAudioMixerCapability, guardState:AudioMixerGuardStateRef, bus:Dynamic, muted:Bool):Bool {
	return flight._js._fn.Media.setAudioBusMuted(hostAudioMixer, guardState, bus, muted);
}
#else
extern inline function setAudioBusMuted(hostAudioMixer:HostAudioMixerCapability, guardState:AudioMixerGuardStateRef, bus:Dynamic, muted:Bool):Bool {
#if hl
	return flight._hl._fn.Media.setAudioBusMuted(hostAudioMixer, guardState, bus, muted);
#elseif cpp
	return flight._cpp._fn.Media.setAudioBusMuted(hostAudioMixer, guardState, bus, muted);
#elseif (js && flight_esm)
	return flight._js._fn.Media.setAudioBusMuted(hostAudioMixer, guardState, bus, muted);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAudioBusPan(hostAudioMixer:HostAudioMixerCapability, guardState:AudioMixerGuardStateRef, bus:Dynamic, value:Float):Float {
	return flight._js._fn.Media.setAudioBusPan(hostAudioMixer, guardState, bus, value);
}
#else
extern inline function setAudioBusPan(hostAudioMixer:HostAudioMixerCapability, guardState:AudioMixerGuardStateRef, bus:Dynamic, value:Float):Float {
#if hl
	return flight._hl._fn.Media.setAudioBusPan(hostAudioMixer, guardState, bus, value);
#elseif cpp
	return flight._cpp._fn.Media.setAudioBusPan(hostAudioMixer, guardState, bus, value);
#elseif (js && flight_esm)
	return flight._js._fn.Media.setAudioBusPan(hostAudioMixer, guardState, bus, value);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAudioMixerMasterGain(hostAudioMixer:HostAudioMixerCapability, mixer:Dynamic, value:Float):Float {
	return flight._js._fn.Media.setAudioMixerMasterGain(hostAudioMixer, mixer, value);
}
#else
extern inline function setAudioMixerMasterGain(hostAudioMixer:HostAudioMixerCapability, mixer:Dynamic, value:Float):Float {
#if hl
	return flight._hl._fn.Media.setAudioMixerMasterGain(hostAudioMixer, mixer, value);
#elseif cpp
	return flight._cpp._fn.Media.setAudioMixerMasterGain(hostAudioMixer, mixer, value);
#elseif (js && flight_esm)
	return flight._js._fn.Media.setAudioMixerMasterGain(hostAudioMixer, mixer, value);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAudioMixerMasterMuted(hostAudioMixer:HostAudioMixerCapability, mixer:Dynamic, muted:Bool):Bool {
	return flight._js._fn.Media.setAudioMixerMasterMuted(hostAudioMixer, mixer, muted);
}
#else
extern inline function setAudioMixerMasterMuted(hostAudioMixer:HostAudioMixerCapability, mixer:Dynamic, muted:Bool):Bool {
#if hl
	return flight._hl._fn.Media.setAudioMixerMasterMuted(hostAudioMixer, mixer, muted);
#elseif cpp
	return flight._cpp._fn.Media.setAudioMixerMasterMuted(hostAudioMixer, mixer, muted);
#elseif (js && flight_esm)
	return flight._js._fn.Media.setAudioMixerMasterMuted(hostAudioMixer, mixer, muted);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function stopAllAudioMixerChannels(mixer:Dynamic):Void {
	flight._js._fn.Media.stopAllAudioMixerChannels(mixer);
}
#else
extern inline function stopAllAudioMixerChannels(mixer:Dynamic):Void {
#if hl
	flight._hl._fn.Media.stopAllAudioMixerChannels(mixer);
#elseif cpp
	flight._cpp._fn.Media.stopAllAudioMixerChannels(mixer);
#elseif (js && flight_esm)
	flight._js._fn.Media.stopAllAudioMixerChannels(mixer);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unrouteAudioChannelFromMixerBus(hostAudioMixer:HostAudioMixerCapability, mixer:Dynamic, channel:Dynamic):Void {
	flight._js._fn.Media.unrouteAudioChannelFromMixerBus(hostAudioMixer, mixer, channel);
}
#else
extern inline function unrouteAudioChannelFromMixerBus(hostAudioMixer:HostAudioMixerCapability, mixer:Dynamic, channel:Dynamic):Void {
#if hl
	flight._hl._fn.Media.unrouteAudioChannelFromMixerBus(hostAudioMixer, mixer, channel);
#elseif cpp
	flight._cpp._fn.Media.unrouteAudioChannelFromMixerBus(hostAudioMixer, mixer, channel);
#elseif (js && flight_esm)
	flight._js._fn.Media.unrouteAudioChannelFromMixerBus(hostAudioMixer, mixer, channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disableAudioMixerGuards(guardState:AudioMixerGuardStateRef):Void {
	flight._js._fn.Media.disableAudioMixerGuards(guardState);
}
#else
extern inline function disableAudioMixerGuards(guardState:AudioMixerGuardStateRef):Void {
#if hl
	flight._hl._fn.Media.disableAudioMixerGuards(guardState);
#elseif cpp
	flight._cpp._fn.Media.disableAudioMixerGuards(guardState);
#elseif (js && flight_esm)
	flight._js._fn.Media.disableAudioMixerGuards(guardState);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableAudioMixerGuards(guardState:AudioMixerGuardStateRef, logState:Dynamic, clock:Dynamic):Void {
	flight._js._fn.Media.enableAudioMixerGuards(guardState, logState, clock);
}
#end
#if (js && flight_esm)
extern inline function enableAudioChannelSignals(channel:Dynamic):Dynamic {
	return flight._js._fn.Media.enableAudioChannelSignals(channel);
}
#else
extern inline function enableAudioChannelSignals(channel:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Media.enableAudioChannelSignals(channel);
#elseif cpp
	return flight._cpp._fn.Media.enableAudioChannelSignals(channel);
#elseif (js && flight_esm)
	return flight._js._fn.Media.enableAudioChannelSignals(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableVideoChannelSignals(channel:Dynamic):Dynamic {
	return flight._js._fn.Media.enableVideoChannelSignals(channel);
}
#else
extern inline function enableVideoChannelSignals(channel:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Media.enableVideoChannelSignals(channel);
#elseif cpp
	return flight._cpp._fn.Media.enableVideoChannelSignals(channel);
#elseif (js && flight_esm)
	return flight._js._fn.Media.enableVideoChannelSignals(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAudioChannelSignals(channel:Dynamic):Null<Dynamic> {
	return flight._js._fn.Media.getAudioChannelSignals(channel);
}
#else
extern inline function getAudioChannelSignals(channel:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Media.getAudioChannelSignals(channel);
#elseif cpp
	return flight._cpp._fn.Media.getAudioChannelSignals(channel);
#elseif (js && flight_esm)
	return flight._js._fn.Media.getAudioChannelSignals(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getVideoChannelSignals(channel:Dynamic):Null<Dynamic> {
	return flight._js._fn.Media.getVideoChannelSignals(channel);
}
#else
extern inline function getVideoChannelSignals(channel:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Media.getVideoChannelSignals(channel);
#elseif cpp
	return flight._cpp._fn.Media.getVideoChannelSignals(channel);
#elseif (js && flight_esm)
	return flight._js._fn.Media.getVideoChannelSignals(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function destroyVideoChannel(hostVideo:HostVideoCapability, channel:Dynamic):Void {
	flight._js._fn.Media.destroyVideoChannel(hostVideo, channel);
}
#else
extern inline function destroyVideoChannel(hostVideo:HostVideoCapability, channel:Dynamic):Void {
#if hl
	flight._hl._fn.Media.destroyVideoChannel(hostVideo, channel);
#elseif cpp
	flight._cpp._fn.Media.destroyVideoChannel(hostVideo, channel);
#elseif (js && flight_esm)
	flight._js._fn.Media.destroyVideoChannel(hostVideo, channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getVideoChannelCurrentTime(hostVideo:HostVideoCapability, channel:Dynamic):Float {
	return flight._js._fn.Media.getVideoChannelCurrentTime(hostVideo, channel);
}
#else
extern inline function getVideoChannelCurrentTime(hostVideo:HostVideoCapability, channel:Dynamic):Float {
#if hl
	return flight._hl._fn.Media.getVideoChannelCurrentTime(hostVideo, channel);
#elseif cpp
	return flight._cpp._fn.Media.getVideoChannelCurrentTime(hostVideo, channel);
#elseif (js && flight_esm)
	return flight._js._fn.Media.getVideoChannelCurrentTime(hostVideo, channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getVideoChannelDuration(channel:Dynamic):Float {
	return flight._js._fn.Media.getVideoChannelDuration(channel);
}
#else
extern inline function getVideoChannelDuration(channel:Dynamic):Float {
#if hl
	return flight._hl._fn.Media.getVideoChannelDuration(channel);
#elseif cpp
	return flight._cpp._fn.Media.getVideoChannelDuration(channel);
#elseif (js && flight_esm)
	return flight._js._fn.Media.getVideoChannelDuration(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getVideoChannelHeight(hostVideo:HostVideoCapability, channel:Dynamic):Float {
	return flight._js._fn.Media.getVideoChannelHeight(hostVideo, channel);
}
#else
extern inline function getVideoChannelHeight(hostVideo:HostVideoCapability, channel:Dynamic):Float {
#if hl
	return flight._hl._fn.Media.getVideoChannelHeight(hostVideo, channel);
#elseif cpp
	return flight._cpp._fn.Media.getVideoChannelHeight(hostVideo, channel);
#elseif (js && flight_esm)
	return flight._js._fn.Media.getVideoChannelHeight(hostVideo, channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getVideoChannelWidth(hostVideo:HostVideoCapability, channel:Dynamic):Float {
	return flight._js._fn.Media.getVideoChannelWidth(hostVideo, channel);
}
#else
extern inline function getVideoChannelWidth(hostVideo:HostVideoCapability, channel:Dynamic):Float {
#if hl
	return flight._hl._fn.Media.getVideoChannelWidth(hostVideo, channel);
#elseif cpp
	return flight._cpp._fn.Media.getVideoChannelWidth(hostVideo, channel);
#elseif (js && flight_esm)
	return flight._js._fn.Media.getVideoChannelWidth(hostVideo, channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isVideoChannelMuted(channel:Dynamic):Bool {
	return flight._js._fn.Media.isVideoChannelMuted(channel);
}
#else
extern inline function isVideoChannelMuted(channel:Dynamic):Bool {
#if hl
	return flight._hl._fn.Media.isVideoChannelMuted(channel);
#elseif cpp
	return flight._cpp._fn.Media.isVideoChannelMuted(channel);
#elseif (js && flight_esm)
	return flight._js._fn.Media.isVideoChannelMuted(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isVideoChannelPlaying(channel:Dynamic):Bool {
	return flight._js._fn.Media.isVideoChannelPlaying(channel);
}
#else
extern inline function isVideoChannelPlaying(channel:Dynamic):Bool {
#if hl
	return flight._hl._fn.Media.isVideoChannelPlaying(channel);
#elseif cpp
	return flight._cpp._fn.Media.isVideoChannelPlaying(channel);
#elseif (js && flight_esm)
	return flight._js._fn.Media.isVideoChannelPlaying(channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function pauseVideoChannel(hostVideo:HostVideoCapability, channel:Dynamic):Void {
	flight._js._fn.Media.pauseVideoChannel(hostVideo, channel);
}
#else
extern inline function pauseVideoChannel(hostVideo:HostVideoCapability, channel:Dynamic):Void {
#if hl
	flight._hl._fn.Media.pauseVideoChannel(hostVideo, channel);
#elseif cpp
	flight._cpp._fn.Media.pauseVideoChannel(hostVideo, channel);
#elseif (js && flight_esm)
	flight._js._fn.Media.pauseVideoChannel(hostVideo, channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function playVideoResource(hostVideo:HostVideoCapability, hostSpawn:HostSpawnCapability, runtimeState:VideoChannelRuntimeStateRef, source:Dynamic, options:Null<VideoPlayOptions>):Null<Dynamic> {
	return flight._js._fn.Media.playVideoResource(hostVideo, hostSpawn, runtimeState, source, options);
}
#else
extern inline function playVideoResource(hostVideo:HostVideoCapability, hostSpawn:HostSpawnCapability, runtimeState:VideoChannelRuntimeStateRef, source:Dynamic, options:VideoPlayOptions):Dynamic {
#if hl
	return flight._hl._fn.Media.playVideoResource(hostVideo, hostSpawn, runtimeState, source, options);
#elseif cpp
	return flight._cpp._fn.Media.playVideoResource(hostVideo, hostSpawn, runtimeState, source, options);
#elseif (js && flight_esm)
	return flight._js._fn.Media.playVideoResource(hostVideo, hostSpawn, runtimeState, source, options);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resumeVideoChannel(hostVideo:HostVideoCapability, hostSpawn:HostSpawnCapability, channel:Dynamic):Void {
	flight._js._fn.Media.resumeVideoChannel(hostVideo, hostSpawn, channel);
}
#else
extern inline function resumeVideoChannel(hostVideo:HostVideoCapability, hostSpawn:HostSpawnCapability, channel:Dynamic):Void {
#if hl
	flight._hl._fn.Media.resumeVideoChannel(hostVideo, hostSpawn, channel);
#elseif cpp
	flight._cpp._fn.Media.resumeVideoChannel(hostVideo, hostSpawn, channel);
#elseif (js && flight_esm)
	flight._js._fn.Media.resumeVideoChannel(hostVideo, hostSpawn, channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setVideoChannelCurrentTime(hostVideo:HostVideoCapability, channel:Dynamic, value:Float):Float {
	return flight._js._fn.Media.setVideoChannelCurrentTime(hostVideo, channel, value);
}
#else
extern inline function setVideoChannelCurrentTime(hostVideo:HostVideoCapability, channel:Dynamic, value:Float):Float {
#if hl
	return flight._hl._fn.Media.setVideoChannelCurrentTime(hostVideo, channel, value);
#elseif cpp
	return flight._cpp._fn.Media.setVideoChannelCurrentTime(hostVideo, channel, value);
#elseif (js && flight_esm)
	return flight._js._fn.Media.setVideoChannelCurrentTime(hostVideo, channel, value);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setVideoChannelGain(hostVideo:HostVideoCapability, channel:Dynamic, value:Float):Float {
	return flight._js._fn.Media.setVideoChannelGain(hostVideo, channel, value);
}
#else
extern inline function setVideoChannelGain(hostVideo:HostVideoCapability, channel:Dynamic, value:Float):Float {
#if hl
	return flight._hl._fn.Media.setVideoChannelGain(hostVideo, channel, value);
#elseif cpp
	return flight._cpp._fn.Media.setVideoChannelGain(hostVideo, channel, value);
#elseif (js && flight_esm)
	return flight._js._fn.Media.setVideoChannelGain(hostVideo, channel, value);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setVideoChannelMuted(hostVideo:HostVideoCapability, channel:Dynamic, value:Bool):Bool {
	return flight._js._fn.Media.setVideoChannelMuted(hostVideo, channel, value);
}
#else
extern inline function setVideoChannelMuted(hostVideo:HostVideoCapability, channel:Dynamic, value:Bool):Bool {
#if hl
	return flight._hl._fn.Media.setVideoChannelMuted(hostVideo, channel, value);
#elseif cpp
	return flight._cpp._fn.Media.setVideoChannelMuted(hostVideo, channel, value);
#elseif (js && flight_esm)
	return flight._js._fn.Media.setVideoChannelMuted(hostVideo, channel, value);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setVideoChannelPlaybackRate(hostVideo:HostVideoCapability, channel:Dynamic, value:Float):Float {
	return flight._js._fn.Media.setVideoChannelPlaybackRate(hostVideo, channel, value);
}
#else
extern inline function setVideoChannelPlaybackRate(hostVideo:HostVideoCapability, channel:Dynamic, value:Float):Float {
#if hl
	return flight._hl._fn.Media.setVideoChannelPlaybackRate(hostVideo, channel, value);
#elseif cpp
	return flight._cpp._fn.Media.setVideoChannelPlaybackRate(hostVideo, channel, value);
#elseif (js && flight_esm)
	return flight._js._fn.Media.setVideoChannelPlaybackRate(hostVideo, channel, value);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function stopVideoChannel(hostVideo:HostVideoCapability, channel:Dynamic):Void {
	flight._js._fn.Media.stopVideoChannel(hostVideo, channel);
}
#else
extern inline function stopVideoChannel(hostVideo:HostVideoCapability, channel:Dynamic):Void {
#if hl
	flight._hl._fn.Media.stopVideoChannel(hostVideo, channel);
#elseif cpp
	flight._cpp._fn.Media.stopVideoChannel(hostVideo, channel);
#elseif (js && flight_esm)
	flight._js._fn.Media.stopVideoChannel(hostVideo, channel);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAudioSourceHandle(ptr:AudioSourceHandle):Void {
	flight._js._fn.Media.freeAudioSourceHandle(ptr);
}
#else
extern inline function freeAudioSourceHandle(ptr:AudioSourceHandle):Void {
#if hl
	flight._hl._fn.Media.freeAudioSourceHandle(ptr);
#elseif cpp
	flight._cpp._fn.Media.freeAudioSourceHandle(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Media.freeAudioSourceHandle(ptr);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAudioChannelRef(ptr:AudioChannel):Void {
	flight._js._fn.Media.freeAudioChannelRef(ptr);
}
#else
extern inline function freeAudioChannelRef(ptr:AudioChannel):Void {
#if hl
	flight._hl._fn.Media.freeAudioChannelRef(ptr);
#elseif cpp
	flight._cpp._fn.Media.freeAudioChannelRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Media.freeAudioChannelRef(ptr);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAudioBusRef(ptr:AudioBus):Void {
	flight._js._fn.Media.freeAudioBusRef(ptr);
}
#else
extern inline function freeAudioBusRef(ptr:AudioBus):Void {
#if hl
	flight._hl._fn.Media.freeAudioBusRef(ptr);
#elseif cpp
	flight._cpp._fn.Media.freeAudioBusRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Media.freeAudioBusRef(ptr);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAudioMixerRef(ptr:AudioMixer):Void {
	flight._js._fn.Media.freeAudioMixerRef(ptr);
}
#else
extern inline function freeAudioMixerRef(ptr:AudioMixer):Void {
#if hl
	flight._hl._fn.Media.freeAudioMixerRef(ptr);
#elseif cpp
	flight._cpp._fn.Media.freeAudioMixerRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Media.freeAudioMixerRef(ptr);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMediaChannelSignalsRef(ptr:MediaChannelSignals):Void {
	flight._js._fn.Media.freeMediaChannelSignalsRef(ptr);
}
#else
extern inline function freeMediaChannelSignalsRef(ptr:MediaChannelSignals):Void {
#if hl
	flight._hl._fn.Media.freeMediaChannelSignalsRef(ptr);
#elseif cpp
	flight._cpp._fn.Media.freeMediaChannelSignalsRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Media.freeMediaChannelSignalsRef(ptr);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeVideoChannelRef(ptr:VideoChannel):Void {
	flight._js._fn.Media.freeVideoChannelRef(ptr);
}
#else
extern inline function freeVideoChannelRef(ptr:VideoChannel):Void {
#if hl
	flight._hl._fn.Media.freeVideoChannelRef(ptr);
#elseif cpp
	flight._cpp._fn.Media.freeVideoChannelRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Media.freeVideoChannelRef(ptr);
#else
	#error "flight.Media: no backend for this target."
#end
}
#end
