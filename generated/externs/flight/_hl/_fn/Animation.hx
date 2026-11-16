package flight._hl._fn;

extern class Animation {
	@:hlNative("flight", "flight_create_animation_sample_accumulator")
	public static function createAnimationSampleAccumulator(components:Int, quaternion:Bool):flight._hl.AnimationSampleAccumulator;
	@:hlNative("flight", "flight_accumulate_animation_sample")
	public static function accumulateAnimationSample(accumulator:flight._hl.AnimationSampleAccumulator, sample:hl.Bytes, sampleLen:Int, weight:Single):Void;
	@:hlNative("flight", "flight_add_animation_sample")
	public static function addAnimationSample(out:hl.Bytes, outLen:Int, base:hl.Bytes, baseLen:Int, delta:hl.Bytes, deltaLen:Int, weight:Single, quaternion:Bool):Void;
	@:hlNative("flight", "flight_blend_animation_samples")
	public static function blendAnimationSamples(out:hl.Bytes, outLen:Int, a:hl.Bytes, aLen:Int, b:hl.Bytes, bLen:Int, alpha:Single, quaternion:Bool):Void;
	@:hlNative("flight", "flight_finish_animation_sample")
	public static function finishAnimationSample(out:hl.Bytes, outLen:Int, accumulator:flight._hl.AnimationSampleAccumulator):Bool;
	@:hlNative("flight", "flight_reset_animation_sample_accumulator")
	public static function resetAnimationSampleAccumulator(accumulator:flight._hl.AnimationSampleAccumulator):Void;
	@:hlNative("flight", "flight_create_animation_blend_tree")
	public static function createAnimationBlendTree(inputs:hl.Bytes, inputsLen:Int):flight._hl.AnimationBlendTree;
	@:hlNative("flight", "flight_create_animation_blend_tree_input")
	public static function createAnimationBlendTreeInput(player:hl.Bytes):flight._hl.AnimationBlendTreeInput;
	@:hlNative("flight", "flight_advance_animation_blend_tree")
	public static function advanceAnimationBlendTree(tree:flight._hl.AnimationBlendTree, dt:Single):Void;
	@:hlNative("flight", "flight_sample_animation_blend_tree")
	public static function sampleAnimationBlendTree(out:hl.Bytes, outLen:Int, tree:flight._hl.AnimationBlendTree, visitFn:hl.Bytes, visitCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_sample_animation_blend_tree_channel")
	public static function sampleAnimationBlendTreeChannel(out:hl.Bytes, outLen:Int, tree:flight._hl.AnimationBlendTree, channelIndex:Int):Bool;
	@:hlNative("flight", "flight_set_animation_blend_tree_input_weight")
	public static function setAnimationBlendTreeInputWeight(tree:flight._hl.AnimationBlendTree, inputIndex:Int, weight:Single):Bool;
	@:hlNative("flight", "flight_create_animation_channel")
	public static function createAnimationChannel(track:hl.Bytes, targetRef:flight._hl.TargetRef):flight._hl.AnimationChannel;
	@:hlNative("flight", "flight_create_animation_clip")
	public static function createAnimationClip(channels:hl.Bytes, duration:Single, events:hl.Bytes, eventsLen:Int):flight._hl.AnimationClip;
	@:hlNative("flight", "flight_create_animation_clip_event")
	public static function createAnimationClipEvent():flight._hl.AnimationClipEvent;
	@:hlNative("flight", "flight_clone_animation_clip")
	public static function cloneAnimationClip(clip:flight._hl.AnimationClip):flight._hl.AnimationClip;
	@:hlNative("flight", "flight_get_animation_clip_duration")
	public static function getAnimationClipDuration(clip:flight._hl.AnimationClip):Single;
	@:hlNative("flight", "flight_sample_animation_clip")
	public static function sampleAnimationClip(out:hl.Bytes, outLen:Int, clip:flight._hl.AnimationClip, time:Single, visitFn:hl.Bytes, visitCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_create_animation_crossfade")
	public static function createAnimationCrossfade(from:hl.Bytes, to:hl.Bytes, duration:Single, opts:flight._hl.AnimationCrossfadeOptions):flight._hl.AnimationCrossfade;
	@:hlNative("flight", "flight_advance_animation_crossfade")
	public static function advanceAnimationCrossfade(state:flight._hl.AnimationCrossfade, dt:Single):Void;
	@:hlNative("flight", "flight_is_animation_crossfade_complete")
	public static function isAnimationCrossfadeComplete(state:flight._hl.AnimationCrossfade):Bool;
	@:hlNative("flight", "flight_sample_animation_crossfade")
	public static function sampleAnimationCrossfade(out:hl.Bytes, outLen:Int, state:flight._hl.AnimationCrossfade, visitFn:hl.Bytes, visitCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_create_animation_blend_tree_layer")
	public static function createAnimationBlendTreeLayer(blendTree:hl.Bytes, options:flight._hl.AnimationLayerOptions):flight._hl.AnimationLayer;
	@:hlNative("flight", "flight_create_animation_layer_stack")
	public static function createAnimationLayerStack(layers:hl.Bytes, layersLen:Int):flight._hl.AnimationLayerStack;
	@:hlNative("flight", "flight_create_animation_state_machine_layer")
	public static function createAnimationStateMachineLayer(stateMachine:hl.Bytes, options:flight._hl.AnimationLayerOptions):flight._hl.AnimationLayer;
	@:hlNative("flight", "flight_advance_animation_layer_stack")
	public static function advanceAnimationLayerStack(stack:flight._hl.AnimationLayerStack, dt:Single):Void;
	@:hlNative("flight", "flight_sample_animation_layer_stack")
	public static function sampleAnimationLayerStack(out:hl.Bytes, outLen:Int, stack:flight._hl.AnimationLayerStack, visitFn:hl.Bytes, visitCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_sample_animation_layer_stack_channel")
	public static function sampleAnimationLayerStackChannel(out:hl.Bytes, outLen:Int, stack:flight._hl.AnimationLayerStack, channelIndex:Int):Bool;
	@:hlNative("flight", "flight_set_animation_layer_weight")
	public static function setAnimationLayerWeight(stack:flight._hl.AnimationLayerStack, layerIndex:Int, weight:Single):Bool;
	@:hlNative("flight", "flight_create_animation_player")
	public static function createAnimationPlayer(clip:flight._hl.AnimationClip):flight._hl.AnimationPlayer;
	@:hlNative("flight", "flight_advance_animation_player")
	public static function advanceAnimationPlayer(player:flight._hl.AnimationPlayer, dt:Single):Void;
	@:hlNative("flight", "flight_clone_animation_player")
	public static function cloneAnimationPlayer(player:flight._hl.AnimationPlayer):flight._hl.AnimationPlayer;
	@:hlNative("flight", "flight_enable_animation_player_signals")
	public static function enableAnimationPlayerSignals(player:flight._hl.AnimationPlayer):Void;
	@:hlNative("flight", "flight_get_animation_player_normalized_time")
	public static function getAnimationPlayerNormalizedTime(player:flight._hl.AnimationPlayer):Single;
	@:hlNative("flight", "flight_play_animation_player")
	public static function playAnimationPlayer(player:flight._hl.AnimationPlayer):Void;
	@:hlNative("flight", "flight_seek_animation_player")
	public static function seekAnimationPlayer(player:flight._hl.AnimationPlayer, time:Single):Void;
	@:hlNative("flight", "flight_stop_animation_player")
	public static function stopAnimationPlayer(player:flight._hl.AnimationPlayer):Void;
	@:hlNative("flight", "flight_create_animation_root_motion_extractor")
	public static function createAnimationRootMotionExtractor(clip:hl.Bytes, channelIndex:Int):flight._hl.AnimationRootMotionExtractor;
	@:hlNative("flight", "flight_extract_animation_root_motion")
	public static function extractAnimationRootMotion(out:hl.Bytes, outLen:Int, extractor:flight._hl.AnimationRootMotionExtractor, startTime:Single, endTime:Single):Bool;
	@:hlNative("flight", "flight_create_animation_state_machine_state")
	public static function createAnimationStateMachineState(blendTree:hl.Bytes):flight._hl.AnimationStateMachineState;
	@:hlNative("flight", "flight_advance_animation_state_machine")
	public static function advanceAnimationStateMachine(machine:flight._hl.AnimationStateMachine, dt:Single):Void;
	@:hlNative("flight", "flight_get_animation_state_machine_current_state")
	public static function getAnimationStateMachineCurrentState(machine:flight._hl.AnimationStateMachine):flight._hl.AnimationStateMachineState;
	@:hlNative("flight", "flight_is_animation_state_machine_transitioning")
	public static function isAnimationStateMachineTransitioning(machine:flight._hl.AnimationStateMachine):Bool;
	@:hlNative("flight", "flight_sample_animation_state_machine")
	public static function sampleAnimationStateMachine(out:hl.Bytes, outLen:Int, machine:flight._hl.AnimationStateMachine, visitFn:hl.Bytes, visitCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_sample_animation_state_machine_channel")
	public static function sampleAnimationStateMachineChannel(out:hl.Bytes, outLen:Int, machine:flight._hl.AnimationStateMachine, channelIndex:Int):Bool;
	@:hlNative("flight", "flight_transition_animation_state_machine")
	public static function transitionAnimationStateMachine(machine:flight._hl.AnimationStateMachine, toState:flight._hl.StateRef, duration:Single, curveFn:hl.Bytes, curveCtx:hl.Bytes):Bool;
	@:hlNative("flight", "flight_create_animation_track")
	public static function createAnimationTrack():flight._hl.AnimationTrack;
	@:hlNative("flight", "flight_clone_animation_track")
	public static function cloneAnimationTrack(track:flight._hl.AnimationTrack):flight._hl.AnimationTrack;
	@:hlNative("flight", "flight_sample_animation_track")
	public static function sampleAnimationTrack(out:hl.Bytes, outLen:Int, track:flight._hl.AnimationTrack, t:Single):Void;
	@:hlNative("flight", "flight_trim_animation_track")
	public static function trimAnimationTrack(track:flight._hl.AnimationTrack, startTime:Single, endTime:Single):flight._hl.AnimationTrack;
	@:hlNative("flight", "flight_validate_animation_track")
	public static function validateAnimationTrack(out:hl.Bytes, track:flight._hl.AnimationTrack):Bool;
	@:hlNative("flight", "flight_create_state_ref_from_index")
	public static function createStateRefFromIndex(index:Int):flight._hl.StateRef;
	@:hlNative("flight", "flight_create_state_ref_from_name")
	public static function createStateRefFromName(name:hl.Bytes):flight._hl.StateRef;
	@:hlNative("flight", "flight_free_animation_sample_accumulator")
	public static function freeAnimationSampleAccumulator(ptr:flight._hl.AnimationSampleAccumulator):Void;
	@:hlNative("flight", "flight_free_animation_blend_tree")
	public static function freeAnimationBlendTree(ptr:flight._hl.AnimationBlendTree):Void;
	@:hlNative("flight", "flight_free_animation_blend_tree_input")
	public static function freeAnimationBlendTreeInput(ptr:flight._hl.AnimationBlendTreeInput):Void;
	@:hlNative("flight", "flight_free_animation_channel")
	public static function freeAnimationChannel(ptr:flight._hl.AnimationChannel):Void;
	@:hlNative("flight", "flight_free_animation_clip")
	public static function freeAnimationClip(ptr:flight._hl.AnimationClip):Void;
	@:hlNative("flight", "flight_free_animation_clip_event")
	public static function freeAnimationClipEvent(ptr:flight._hl.AnimationClipEvent):Void;
	@:hlNative("flight", "flight_free_animation_crossfade")
	public static function freeAnimationCrossfade(ptr:flight._hl.AnimationCrossfade):Void;
	@:hlNative("flight", "flight_free_animation_layer")
	public static function freeAnimationLayer(ptr:flight._hl.AnimationLayer):Void;
	@:hlNative("flight", "flight_free_animation_layer_stack")
	public static function freeAnimationLayerStack(ptr:flight._hl.AnimationLayerStack):Void;
	@:hlNative("flight", "flight_free_animation_player")
	public static function freeAnimationPlayer(ptr:flight._hl.AnimationPlayer):Void;
	@:hlNative("flight", "flight_free_animation_root_motion_extractor")
	public static function freeAnimationRootMotionExtractor(ptr:flight._hl.AnimationRootMotionExtractor):Void;
	@:hlNative("flight", "flight_free_animation_state_machine_state")
	public static function freeAnimationStateMachineState(ptr:flight._hl.AnimationStateMachineState):Void;
	@:hlNative("flight", "flight_free_animation_track")
	public static function freeAnimationTrack(ptr:flight._hl.AnimationTrack):Void;
	@:hlNative("flight", "flight_free_state_ref")
	public static function freeStateRef(ptr:flight._hl.StateRef):Void;
}
