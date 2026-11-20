package flight.esm.types.animation;

#if (js && flight_esm)
typedef AnimationBlendTree = { channels:Array<flight.esm.types.animation.Types.AnimationBlendTreeChannel>, inputs:Array<flight.esm.types.animation.Types.AnimationBlendTreeInput>, players:Array<flight.esm.types.animation.Types.AnimationPlayer>, sampleScratch:js.lib.Float32Array };

typedef AnimationBlendTreeChannel = { accumulator:flight.esm.types.animation.Types.AnimationSampleAccumulator, channel:flight.esm.types.animation.Types.AnimationChannel, sources:Array<flight.esm.types.animation.Types.AnimationBlendTreeChannelSource> };

typedef AnimationBlendTreeChannelSource = { channelIndex:Float, inputIndex:Float };

typedef AnimationBlendTreeInput = { additive:Bool, player:flight.esm.types.animation.Types.AnimationPlayer, weight:Float };

typedef AnimationChannel = { track:flight.esm.types.animation.Types.AnimationTrack, targetRef:Dynamic };

typedef AnimationClip = { channels:Array<flight.esm.types.animation.Types.AnimationChannel>, duration:Float, events:Array<flight.esm.types.animation.Types.AnimationClipEvent> };

typedef AnimationClipEvent = { name:String, payload:Dynamic, time:Float };

typedef AnimationCrossfade = { channels:Array<flight.esm.types.animation.Types.AnimationCrossfadeChannel>, curve:((t:Float) -> Float), duration:Float, elapsed:Float, from:flight.esm.types.animation.Types.AnimationPlayer, fromSample:js.lib.Float32Array, to:flight.esm.types.animation.Types.AnimationPlayer, toSample:js.lib.Float32Array, weight:Float };

typedef AnimationCrossfadeChannel = { channel:flight.esm.types.animation.Types.AnimationChannel, fromIndex:Null<Float>, toIndex:Null<Float> };

typedef AnimationCrossfadeOptions = { ?curve:Null<((t:Float) -> Float)> };

typedef AnimationInterpolation = String;

typedef AnimationLayer = { additive:Bool, blendTree:Null<flight.esm.types.animation.Types.AnimationBlendTree>, channelIndices:Null<Array<Float>>, stateMachine:Null<flight.esm.types.animation.Types.AnimationStateMachine>, weight:Float };

typedef AnimationLayerOptions = { ?additive:Null<Bool>, ?channelIndices:Null<Array<Float>>, ?weight:Null<Float> };

typedef AnimationLayerStack = { advanceScratch:Array<flight.esm.types.animation.Types.AnimationPlayer>, blendTrees:Array<flight.esm.types.animation.Types.AnimationBlendTree>, channels:Array<flight.esm.types.animation.Types.AnimationLayerStackChannel>, layers:Array<flight.esm.types.animation.Types.AnimationLayer>, sampleScratch:js.lib.Float32Array, stateMachines:Array<flight.esm.types.animation.Types.AnimationStateMachine> };

typedef AnimationLayerStackChannel = { channel:flight.esm.types.animation.Types.AnimationChannel, sources:Array<flight.esm.types.animation.Types.AnimationLayerStackChannelSource> };

typedef AnimationLayerStackChannelSource = { channelIndex:Float, layerIndex:Float };

typedef AnimationLoopMode = String;

typedef AnimationPlayer = { clip:flight.esm.types.animation.Types.AnimationClip, loop:Bool, ?loopMode:Null<String>, ?onEvent:Null<flight.esm.types.signals.Types.Signal<flight.esm.types.animation.Types.AnimationClipEvent>>, ?onFinished:Null<flight.esm.types.signals.Types.Signal<Void>>, ?onLooped:Null<flight.esm.types.signals.Types.Signal<Void>>, playing:Bool, ?repeatCount:Null<Float>, speed:Float, time:Float };

typedef AnimationRootMotionExtractor = { channel:flight.esm.types.animation.Types.AnimationChannel, channelIndex:Float, clip:flight.esm.types.animation.Types.AnimationClip, cycleDelta:js.lib.Float32Array, fromMotion:js.lib.Float32Array, fromSample:js.lib.Float32Array, powerScratch:js.lib.Float32Array, startSample:js.lib.Float32Array, toMotion:js.lib.Float32Array, toSample:js.lib.Float32Array };

typedef AnimationSampleAccumulator = { components:Float, quaternion:Bool, values:js.lib.Float32Array, weight:Float };

typedef AnimationStateMachine = { advanceScratch:Array<flight.esm.types.animation.Types.AnimationPlayer>, channels:Array<flight.esm.types.animation.Types.AnimationStateMachineChannel>, currentStateIndex:Float, fromSample:js.lib.Float32Array, states:Array<flight.esm.types.animation.Types.AnimationStateMachineState>, toSample:js.lib.Float32Array, transitionCurve:((t:Float) -> Float), transitionDuration:Float, transitionElapsed:Float, transitionFromStateIndex:Null<Float>, transitionToStateIndex:Null<Float>, transitionWeight:Float };

typedef AnimationStateMachineChannel = { channel:flight.esm.types.animation.Types.AnimationChannel, stateChannelIndices:Array<Null<Float>> };

typedef AnimationStateMachineState = { blendTree:flight.esm.types.animation.Types.AnimationBlendTree, name:String };

typedef AnimationTrack = { interpolation:flight.esm.types.animation.Types.AnimationInterpolation, times:Dynamic, values:Dynamic, components:Float, quaternion:Bool, easing:Null<((t:Float) -> Float)>, segmentEasings:Null<Array<Dynamic>> };

typedef AnimationTrackValidationCode = String;

typedef AnimationTrackValidationDiagnostic = { code:flight.esm.types.animation.Types.AnimationTrackValidationCode, index:Null<Float>, message:String };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
