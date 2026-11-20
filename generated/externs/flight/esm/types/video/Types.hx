package flight.esm.types.video;

#if (js && flight_esm)
typedef HostVideoCapabilities = { ?playback:Null<flight.esm.types.video.Types.HostVideoCapability> };

typedef HostVideoCapability = { ?addEndedListener:Null<((element:Dynamic, listener:Dynamic) -> Void)>, ?attachStream:Null<((stream:Dynamic) -> Dynamic)>, canPlayType:((mimeType:String) -> Bool), ?createObjectUrl:Null<((data:js.html.Blob) -> String)>, ?createVideoElement:Null<(() -> Dynamic)>, ?getCurrentTime:Null<((element:Dynamic) -> Float)>, ?getDuration:Null<((element:Dynamic) -> Float)>, ?getHeight:Null<((element:Dynamic) -> Float)>, ?getLoop:Null<((element:Dynamic) -> Bool)>, ?getMuted:Null<((element:Dynamic) -> Bool)>, ?getPlaybackRate:Null<((element:Dynamic) -> Float)>, ?getVolume:Null<((element:Dynamic) -> Float)>, ?getWidth:Null<((element:Dynamic) -> Float)>, ?isReady:Null<((element:Dynamic) -> Bool)>, ?loadUrl:Null<((url:String, ?options:Dynamic, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Dynamic>)>, ?pause:Null<((element:Dynamic) -> Void)>, ?play:Null<((element:Dynamic) -> js.lib.Promise<Void>)>, ?releaseElement:Null<((element:Dynamic) -> Void)>, ?removeEndedListener:Null<((element:Dynamic, listener:Dynamic) -> Void)>, ?revokeObjectUrl:Null<((url:String) -> Void)>, ?setCurrentTime:Null<((element:Dynamic, value:Float) -> Void)>, ?setLoop:Null<((element:Dynamic, value:Bool) -> Void)>, ?setMuted:Null<((element:Dynamic, value:Bool) -> Void)>, ?setPlaybackRate:Null<((element:Dynamic, value:Float) -> Void)>, ?setVolume:Null<((element:Dynamic, value:Float) -> Void)> };

typedef VideoChannel = { currentTime:Float, gain:Float, length:Float, loops:Float, muted:Bool, playbackRate:Float, source:Null<flight.esm.types.video.Types.VideoResource>, state:flight.esm.types.video.Types.VideoChannelState, onComplete:flight.esm.types.signals.Types.Signal<Void> };

typedef VideoChannelState = String;

typedef VideoPlayOptions = { ?currentTime:Null<Float>, ?gain:Null<Float>, ?loops:Null<Float>, ?playbackRate:Null<Float> };

typedef VideoResource = { element:Dynamic, objectUrl:Null<String>, ownsElement:Bool };

typedef VideoResourceLoadOptions = { ?crossOrigin:Null<String>, ?muted:Null<Bool>, ?playsInline:Null<Bool>, ?preload:Null<String>, ?readiness:Null<String> };

typedef VideoResourceUrl = { url:String, ?type:Null<String> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
