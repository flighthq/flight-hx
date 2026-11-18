package flight._js._fn;

@:jsRequire("@flighthq/animation")
extern class Animation {
	@:native("createAnimationSampleAccumulator")
	public static function createAnimationSampleAccumulator(components:Int, quaternion:Bool):flight._js.AnimationSampleAccumulator;
	@:native("accumulateAnimationSample")
	public static function accumulateAnimationSample(accumulator:flight._js.AnimationSampleAccumulator, sample:Dynamic, weight:Float):Void;
	@:native("addAnimationSample")
	public static function addAnimationSample(out:Dynamic, base:Dynamic, delta:Dynamic, weight:Float, quaternion:Bool):Void;
	@:native("blendAnimationSamples")
	public static function blendAnimationSamples(out:Dynamic, a:Dynamic, b:Dynamic, alpha:Float, quaternion:Bool):Void;
	@:native("finishAnimationSample")
	public static function finishAnimationSample(out:Dynamic, accumulator:flight._js.AnimationSampleAccumulator):Bool;
	@:native("resetAnimationSampleAccumulator")
	public static function resetAnimationSampleAccumulator(accumulator:flight._js.AnimationSampleAccumulator):Void;
	@:native("createAnimationBlendTree")
	public static function createAnimationBlendTree(inputs:Dynamic):flight._js.AnimationBlendTree;
	@:native("createAnimationBlendTreeInput")
	public static function createAnimationBlendTreeInput(player:Dynamic):flight._js.AnimationBlendTreeInput;
	@:native("advanceAnimationBlendTree")
	public static function advanceAnimationBlendTree(tree:flight._js.AnimationBlendTree, dt:Float):Void;
	@:native("sampleAnimationBlendTree")
	public static function sampleAnimationBlendTree(out:Dynamic, tree:flight._js.AnimationBlendTree, visit:Dynamic):Void;
	@:native("sampleAnimationBlendTreeChannel")
	public static function sampleAnimationBlendTreeChannel(out:Dynamic, tree:flight._js.AnimationBlendTree, channelIndex:Int):Bool;
	@:native("setAnimationBlendTreeInputWeight")
	public static function setAnimationBlendTreeInputWeight(tree:flight._js.AnimationBlendTree, inputIndex:Int, weight:Float):Bool;
	@:native("createAnimationClip")
	public static function createAnimationClip(channels:Dynamic, duration:Null<Float>, events:Dynamic):flight._js.AnimationClip;
	@:native("createAnimationClipEvent")
	public static function createAnimationClipEvent():flight._js.AnimationClipEvent;
	@:native("cloneAnimationClip")
	public static function cloneAnimationClip(clip:flight._js.AnimationClip):flight._js.AnimationClip;
	@:native("getAnimationClipDuration")
	public static function getAnimationClipDuration(clip:flight._js.AnimationClip):Float;
	@:native("sampleAnimationClip")
	public static function sampleAnimationClip(out:Dynamic, clip:flight._js.AnimationClip, time:Float, visit:Dynamic):Void;
	@:native("createAnimationCrossfade")
	public static function createAnimationCrossfade(from:Dynamic, to:Dynamic, duration:Float, opts:Null<flight._js.AnimationCrossfadeOptions>):flight._js.AnimationCrossfade;
	@:native("advanceAnimationCrossfade")
	public static function advanceAnimationCrossfade(state:flight._js.AnimationCrossfade, dt:Float):Void;
	@:native("isAnimationCrossfadeComplete")
	public static function isAnimationCrossfadeComplete(state:flight._js.AnimationCrossfade):Bool;
	@:native("sampleAnimationCrossfade")
	public static function sampleAnimationCrossfade(out:Dynamic, state:flight._js.AnimationCrossfade, visit:Dynamic):Void;
	@:native("createAnimationBlendTreeLayer")
	public static function createAnimationBlendTreeLayer(blendTree:Dynamic, options:Null<flight._js.AnimationLayerOptions>):flight._js.AnimationLayer;
	@:native("createAnimationLayerStack")
	public static function createAnimationLayerStack(layers:Dynamic):flight._js.AnimationLayerStack;
	@:native("createAnimationStateMachineLayer")
	public static function createAnimationStateMachineLayer(stateMachine:Dynamic, options:Null<flight._js.AnimationLayerOptions>):flight._js.AnimationLayer;
	@:native("advanceAnimationLayerStack")
	public static function advanceAnimationLayerStack(stack:flight._js.AnimationLayerStack, dt:Float):Void;
	@:native("sampleAnimationLayerStack")
	public static function sampleAnimationLayerStack(out:Dynamic, stack:flight._js.AnimationLayerStack, visit:Dynamic):Void;
	@:native("sampleAnimationLayerStackChannel")
	public static function sampleAnimationLayerStackChannel(out:Dynamic, stack:flight._js.AnimationLayerStack, channelIndex:Int):Bool;
	@:native("setAnimationLayerWeight")
	public static function setAnimationLayerWeight(stack:flight._js.AnimationLayerStack, layerIndex:Int, weight:Float):Bool;
	@:native("createAnimationPlayer")
	public static function createAnimationPlayer(clip:flight._js.AnimationClip):flight._js.AnimationPlayer;
	@:native("advanceAnimationPlayer")
	public static function advanceAnimationPlayer(player:flight._js.AnimationPlayer, dt:Float):Void;
	@:native("cloneAnimationPlayer")
	public static function cloneAnimationPlayer(player:flight._js.AnimationPlayer):flight._js.AnimationPlayer;
	@:native("enableAnimationPlayerSignals")
	public static function enableAnimationPlayerSignals(player:flight._js.AnimationPlayer):Void;
	@:native("getAnimationPlayerNormalizedTime")
	public static function getAnimationPlayerNormalizedTime(player:flight._js.AnimationPlayer):Float;
	@:native("playAnimationPlayer")
	public static function playAnimationPlayer(player:flight._js.AnimationPlayer):Void;
	@:native("seekAnimationPlayer")
	public static function seekAnimationPlayer(player:flight._js.AnimationPlayer, time:Float):Void;
	@:native("stopAnimationPlayer")
	public static function stopAnimationPlayer(player:flight._js.AnimationPlayer):Void;
	@:native("createAnimationRootMotionExtractor")
	public static function createAnimationRootMotionExtractor(clip:Dynamic, channelIndex:Int):flight._js.AnimationRootMotionExtractor;
	@:native("extractAnimationRootMotion")
	public static function extractAnimationRootMotion(out:Dynamic, extractor:flight._js.AnimationRootMotionExtractor, startTime:Float, endTime:Float):Bool;
	@:native("createAnimationStateMachineState")
	public static function createAnimationStateMachineState(blendTree:Dynamic):flight._js.AnimationStateMachineState;
	@:native("advanceAnimationStateMachine")
	public static function advanceAnimationStateMachine(machine:flight._js.AnimationStateMachine, dt:Float):Void;
	@:native("getAnimationStateMachineCurrentState")
	public static function getAnimationStateMachineCurrentState(machine:flight._js.AnimationStateMachine):flight._js.AnimationStateMachineState;
	@:native("isAnimationStateMachineTransitioning")
	public static function isAnimationStateMachineTransitioning(machine:flight._js.AnimationStateMachine):Bool;
	@:native("sampleAnimationStateMachine")
	public static function sampleAnimationStateMachine(out:Dynamic, machine:flight._js.AnimationStateMachine, visit:Dynamic):Void;
	@:native("sampleAnimationStateMachineChannel")
	public static function sampleAnimationStateMachineChannel(out:Dynamic, machine:flight._js.AnimationStateMachine, channelIndex:Int):Bool;
	@:native("createAnimationTrack")
	public static function createAnimationTrack():flight._js.AnimationTrack;
	@:native("cloneAnimationTrack")
	public static function cloneAnimationTrack(track:flight._js.AnimationTrack):flight._js.AnimationTrack;
	@:native("sampleAnimationTrack")
	public static function sampleAnimationTrack(out:Dynamic, track:flight._js.AnimationTrack, t:Float):Void;
	@:native("trimAnimationTrack")
	public static function trimAnimationTrack(track:flight._js.AnimationTrack, startTime:Float, endTime:Float):flight._js.AnimationTrack;
	@:native("validateAnimationTrack")
	public static function validateAnimationTrack(out:Dynamic, track:flight._js.AnimationTrack):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAnimationSampleAccumulator(ptr:flight._js.AnimationSampleAccumulator):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAnimationBlendTree(ptr:flight._js.AnimationBlendTree):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAnimationBlendTreeInput(ptr:flight._js.AnimationBlendTreeInput):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAnimationClip(ptr:flight._js.AnimationClip):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAnimationClipEvent(ptr:flight._js.AnimationClipEvent):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAnimationCrossfade(ptr:flight._js.AnimationCrossfade):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAnimationLayer(ptr:flight._js.AnimationLayer):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAnimationLayerStack(ptr:flight._js.AnimationLayerStack):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAnimationPlayer(ptr:flight._js.AnimationPlayer):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAnimationRootMotionExtractor(ptr:flight._js.AnimationRootMotionExtractor):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAnimationStateMachineState(ptr:flight._js.AnimationStateMachineState):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAnimationTrack(ptr:flight._js.AnimationTrack):Void {}
}
