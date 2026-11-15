package flight._js._fn;

@:jsRequire("flight")
extern class Animation {
	@:native("flight_create_animation_sample_accumulator")
	public static function createAnimationSampleAccumulator(components:Int, quaternion:Bool):flight._js.AnimationSampleAccumulator;
	@:native("flight_accumulate_animation_sample")
	public static function accumulateAnimationSample(accumulator:flight._js.AnimationSampleAccumulator, sample:Dynamic, sampleLen:Int, weight:Float):Void;
	@:native("flight_add_animation_sample")
	public static function addAnimationSample(out:Dynamic, outLen:Int, base:Dynamic, baseLen:Int, delta:Dynamic, deltaLen:Int, weight:Float, quaternion:Bool):Void;
	@:native("flight_blend_animation_samples")
	public static function blendAnimationSamples(out:Dynamic, outLen:Int, a:Dynamic, aLen:Int, b:Dynamic, bLen:Int, alpha:Float, quaternion:Bool):Void;
	@:native("flight_finish_animation_sample")
	public static function finishAnimationSample(out:Dynamic, outLen:Int, accumulator:flight._js.AnimationSampleAccumulator):Bool;
	@:native("flight_reset_animation_sample_accumulator")
	public static function resetAnimationSampleAccumulator(accumulator:flight._js.AnimationSampleAccumulator):Void;
	@:native("flight_create_animation_blend_tree")
	public static function createAnimationBlendTree(inputs:Dynamic, inputsLen:Int):flight._js.AnimationBlendTree;
	@:native("flight_create_animation_blend_tree_input")
	public static function createAnimationBlendTreeInput(player:Dynamic):flight._js.AnimationBlendTreeInput;
	@:native("flight_advance_animation_blend_tree")
	public static function advanceAnimationBlendTree(tree:flight._js.AnimationBlendTree, dt:Float):Void;
	@:native("flight_sample_animation_blend_tree")
	public static function sampleAnimationBlendTree(out:Dynamic, outLen:Int, tree:flight._js.AnimationBlendTree, visitFn:Dynamic, visitCtx:Dynamic):Void;
	@:native("flight_sample_animation_blend_tree_channel")
	public static function sampleAnimationBlendTreeChannel(out:Dynamic, outLen:Int, tree:flight._js.AnimationBlendTree, channelIndex:Int):Bool;
	@:native("flight_set_animation_blend_tree_input_weight")
	public static function setAnimationBlendTreeInputWeight(tree:flight._js.AnimationBlendTree, inputIndex:Int, weight:Float):Bool;
	@:native("flight_create_animation_channel")
	public static function createAnimationChannel(track:Dynamic, targetRef:flight._js.TargetRef):flight._js.AnimationChannel;
	@:native("flight_create_animation_clip")
	public static function createAnimationClip(channels:Dynamic, duration:Float, events:Dynamic, eventsLen:Int):flight._js.AnimationClip;
	@:native("flight_create_animation_clip_event")
	public static function createAnimationClipEvent():flight._js.AnimationClipEvent;
	@:native("flight_clone_animation_clip")
	public static function cloneAnimationClip(clip:flight._js.AnimationClip):flight._js.AnimationClip;
	@:native("flight_get_animation_clip_duration")
	public static function getAnimationClipDuration(clip:flight._js.AnimationClip):Float;
	@:native("flight_sample_animation_clip")
	public static function sampleAnimationClip(out:Dynamic, outLen:Int, clip:flight._js.AnimationClip, time:Float, visitFn:Dynamic, visitCtx:Dynamic):Void;
	@:native("flight_create_animation_crossfade")
	public static function createAnimationCrossfade(from:Dynamic, to:Dynamic, duration:Float, opts:flight._js.AnimationCrossfadeOptions):flight._js.AnimationCrossfade;
	@:native("flight_advance_animation_crossfade")
	public static function advanceAnimationCrossfade(state:flight._js.AnimationCrossfade, dt:Float):Void;
	@:native("flight_is_animation_crossfade_complete")
	public static function isAnimationCrossfadeComplete(state:flight._js.AnimationCrossfade):Bool;
	@:native("flight_sample_animation_crossfade")
	public static function sampleAnimationCrossfade(out:Dynamic, outLen:Int, state:flight._js.AnimationCrossfade, visitFn:Dynamic, visitCtx:Dynamic):Void;
	@:native("flight_create_animation_blend_tree_layer")
	public static function createAnimationBlendTreeLayer(blendTree:Dynamic, options:flight._js.AnimationLayerOptions):flight._js.AnimationLayer;
	@:native("flight_create_animation_layer_stack")
	public static function createAnimationLayerStack(layers:Dynamic, layersLen:Int):flight._js.AnimationLayerStack;
	@:native("flight_create_animation_state_machine_layer")
	public static function createAnimationStateMachineLayer(stateMachine:Dynamic, options:flight._js.AnimationLayerOptions):flight._js.AnimationLayer;
	@:native("flight_advance_animation_layer_stack")
	public static function advanceAnimationLayerStack(stack:flight._js.AnimationLayerStack, dt:Float):Void;
	@:native("flight_sample_animation_layer_stack")
	public static function sampleAnimationLayerStack(out:Dynamic, outLen:Int, stack:flight._js.AnimationLayerStack, visitFn:Dynamic, visitCtx:Dynamic):Void;
	@:native("flight_sample_animation_layer_stack_channel")
	public static function sampleAnimationLayerStackChannel(out:Dynamic, outLen:Int, stack:flight._js.AnimationLayerStack, channelIndex:Int):Bool;
	@:native("flight_set_animation_layer_weight")
	public static function setAnimationLayerWeight(stack:flight._js.AnimationLayerStack, layerIndex:Int, weight:Float):Bool;
	@:native("flight_create_animation_player")
	public static function createAnimationPlayer(clip:flight._js.AnimationClip):flight._js.AnimationPlayer;
	@:native("flight_advance_animation_player")
	public static function advanceAnimationPlayer(player:flight._js.AnimationPlayer, dt:Float):Void;
	@:native("flight_clone_animation_player")
	public static function cloneAnimationPlayer(player:flight._js.AnimationPlayer):flight._js.AnimationPlayer;
	@:native("flight_enable_animation_player_signals")
	public static function enableAnimationPlayerSignals(player:flight._js.AnimationPlayer):Void;
	@:native("flight_get_animation_player_normalized_time")
	public static function getAnimationPlayerNormalizedTime(player:flight._js.AnimationPlayer):Float;
	@:native("flight_play_animation_player")
	public static function playAnimationPlayer(player:flight._js.AnimationPlayer):Void;
	@:native("flight_seek_animation_player")
	public static function seekAnimationPlayer(player:flight._js.AnimationPlayer, time:Float):Void;
	@:native("flight_stop_animation_player")
	public static function stopAnimationPlayer(player:flight._js.AnimationPlayer):Void;
	@:native("flight_create_animation_root_motion_extractor")
	public static function createAnimationRootMotionExtractor(clip:Dynamic, channelIndex:Int):flight._js.AnimationRootMotionExtractor;
	@:native("flight_extract_animation_root_motion")
	public static function extractAnimationRootMotion(out:Dynamic, outLen:Int, extractor:flight._js.AnimationRootMotionExtractor, startTime:Float, endTime:Float):Bool;
	@:native("flight_create_animation_state_machine_state")
	public static function createAnimationStateMachineState(blendTree:Dynamic):flight._js.AnimationStateMachineState;
	@:native("flight_advance_animation_state_machine")
	public static function advanceAnimationStateMachine(machine:flight._js.AnimationStateMachine, dt:Float):Void;
	@:native("flight_get_animation_state_machine_current_state")
	public static function getAnimationStateMachineCurrentState(machine:flight._js.AnimationStateMachine):flight._js.AnimationStateMachineState;
	@:native("flight_is_animation_state_machine_transitioning")
	public static function isAnimationStateMachineTransitioning(machine:flight._js.AnimationStateMachine):Bool;
	@:native("flight_sample_animation_state_machine")
	public static function sampleAnimationStateMachine(out:Dynamic, outLen:Int, machine:flight._js.AnimationStateMachine, visitFn:Dynamic, visitCtx:Dynamic):Void;
	@:native("flight_sample_animation_state_machine_channel")
	public static function sampleAnimationStateMachineChannel(out:Dynamic, outLen:Int, machine:flight._js.AnimationStateMachine, channelIndex:Int):Bool;
	@:native("flight_transition_animation_state_machine")
	public static function transitionAnimationStateMachine(machine:flight._js.AnimationStateMachine, toState:Int, duration:Float, curveFn:Dynamic, curveCtx:Dynamic):Bool;
	@:native("flight_create_animation_track")
	public static function createAnimationTrack():flight._js.AnimationTrack;
	@:native("flight_clone_animation_track")
	public static function cloneAnimationTrack(track:flight._js.AnimationTrack):flight._js.AnimationTrack;
	@:native("flight_sample_animation_track")
	public static function sampleAnimationTrack(out:Dynamic, outLen:Int, track:flight._js.AnimationTrack, t:Float):Void;
	@:native("flight_trim_animation_track")
	public static function trimAnimationTrack(track:flight._js.AnimationTrack, startTime:Float, endTime:Float):flight._js.AnimationTrack;
	@:native("flight_validate_animation_track")
	public static function validateAnimationTrack(out:Dynamic, track:flight._js.AnimationTrack):Bool;
	@:native("flight_create_state_ref_from_index")
	public static function createStateRefFromIndex(index:Int):Int;
	@:native("flight_create_state_ref_from_name")
	public static function createStateRefFromName(name:String):Int;
	@:native("flight_free_animation_sample_accumulator")
	public static function freeAnimationSampleAccumulator(ptr:flight._js.AnimationSampleAccumulator):Void;
	@:native("flight_free_animation_blend_tree")
	public static function freeAnimationBlendTree(ptr:flight._js.AnimationBlendTree):Void;
	@:native("flight_free_animation_blend_tree_input")
	public static function freeAnimationBlendTreeInput(ptr:flight._js.AnimationBlendTreeInput):Void;
	@:native("flight_free_animation_channel")
	public static function freeAnimationChannel(ptr:flight._js.AnimationChannel):Void;
	@:native("flight_free_animation_clip")
	public static function freeAnimationClip(ptr:flight._js.AnimationClip):Void;
	@:native("flight_free_animation_clip_event")
	public static function freeAnimationClipEvent(ptr:flight._js.AnimationClipEvent):Void;
	@:native("flight_free_animation_crossfade")
	public static function freeAnimationCrossfade(ptr:flight._js.AnimationCrossfade):Void;
	@:native("flight_free_animation_layer")
	public static function freeAnimationLayer(ptr:flight._js.AnimationLayer):Void;
	@:native("flight_free_animation_layer_stack")
	public static function freeAnimationLayerStack(ptr:flight._js.AnimationLayerStack):Void;
	@:native("flight_free_animation_player")
	public static function freeAnimationPlayer(ptr:flight._js.AnimationPlayer):Void;
	@:native("flight_free_animation_root_motion_extractor")
	public static function freeAnimationRootMotionExtractor(ptr:flight._js.AnimationRootMotionExtractor):Void;
	@:native("flight_free_animation_state_machine_state")
	public static function freeAnimationStateMachineState(ptr:flight._js.AnimationStateMachineState):Void;
	@:native("flight_free_animation_track")
	public static function freeAnimationTrack(ptr:flight._js.AnimationTrack):Void;
}
