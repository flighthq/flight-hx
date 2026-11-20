package flight._cpp._fn;

extern class Animation {
	@:native("flight_create_animation_sample_accumulator")
	public static function createAnimationSampleAccumulator(components:Int, quaternion:Bool):flight._cpp.AnimationSampleAccumulator;
	@:native("flight_accumulate_animation_sample")
	public static function accumulateAnimationSample(accumulator:flight._cpp.AnimationSampleAccumulator, sample:cpp.Star<cpp.Void>, sampleLen:Int, weight:Single):Void;
	@:native("flight_add_animation_sample")
	public static function addAnimationSample(out:cpp.Star<cpp.Void>, outLen:Int, base:cpp.Star<cpp.Void>, baseLen:Int, delta:cpp.Star<cpp.Void>, deltaLen:Int, weight:Single, quaternion:Bool):Void;
	@:native("flight_blend_animation_samples")
	public static function blendAnimationSamples(out:cpp.Star<cpp.Void>, outLen:Int, a:cpp.Star<cpp.Void>, aLen:Int, b:cpp.Star<cpp.Void>, bLen:Int, alpha:Single, quaternion:Bool):Void;
	@:native("flight_finish_animation_sample")
	public static function finishAnimationSample(out:cpp.Star<cpp.Void>, outLen:Int, accumulator:flight._cpp.AnimationSampleAccumulator):Bool;
	@:native("flight_reset_animation_sample_accumulator")
	public static function resetAnimationSampleAccumulator(accumulator:flight._cpp.AnimationSampleAccumulator):Void;
	@:native("flight_create_animation_blend_tree")
	public static function createAnimationBlendTree(inputs:cpp.Star<cpp.Void>, inputsLen:Int):flight._cpp.AnimationBlendTree;
	@:native("flight_create_animation_blend_tree_input")
	public static function createAnimationBlendTreeInput(player:cpp.Star<cpp.Void>):flight._cpp.AnimationBlendTreeInput;
	@:native("flight_advance_animation_blend_tree")
	public static function advanceAnimationBlendTree(tree:flight._cpp.AnimationBlendTree, dt:Float):Void;
	@:native("flight_sample_animation_blend_tree")
	public static function sampleAnimationBlendTree(out:cpp.Star<cpp.Void>, outLen:Int, tree:flight._cpp.AnimationBlendTree, visitFn:cpp.Star<cpp.Void>, visitCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_sample_animation_blend_tree_channel")
	public static function sampleAnimationBlendTreeChannel(out:cpp.Star<cpp.Void>, outLen:Int, tree:flight._cpp.AnimationBlendTree, channelIndex:Int):Bool;
	@:native("flight_set_animation_blend_tree_input_weight")
	public static function setAnimationBlendTreeInputWeight(tree:flight._cpp.AnimationBlendTree, inputIndex:Int, weight:Single):Bool;
	@:native("flight_create_animation_channel")
	public static function createAnimationChannel(track:cpp.Star<cpp.Void>, targetRef:flight._cpp.TargetRef):flight._cpp.AnimationChannel;
	@:native("flight_create_animation_clip_event")
	public static function createAnimationClipEvent():flight._cpp.AnimationClipEvent;
	@:native("flight_clone_animation_clip")
	public static function cloneAnimationClip(clip:flight._cpp.AnimationClip):flight._cpp.AnimationClip;
	@:native("flight_get_animation_clip_duration")
	public static function getAnimationClipDuration(clip:flight._cpp.AnimationClip):Float;
	@:native("flight_sample_animation_clip")
	public static function sampleAnimationClip(out:cpp.Star<cpp.Void>, outLen:Int, clip:flight._cpp.AnimationClip, time:Float, visitFn:cpp.Star<cpp.Void>, visitCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_create_animation_crossfade")
	public static function createAnimationCrossfade(from:cpp.Star<cpp.Void>, to:cpp.Star<cpp.Void>, duration:Float, opts:flight._cpp.AnimationCrossfadeOptions):flight._cpp.AnimationCrossfade;
	@:native("flight_advance_animation_crossfade")
	public static function advanceAnimationCrossfade(state:flight._cpp.AnimationCrossfade, dt:Float):Void;
	@:native("flight_is_animation_crossfade_complete")
	public static function isAnimationCrossfadeComplete(state:flight._cpp.AnimationCrossfade):Bool;
	@:native("flight_sample_animation_crossfade")
	public static function sampleAnimationCrossfade(out:cpp.Star<cpp.Void>, outLen:Int, state:flight._cpp.AnimationCrossfade, visitFn:cpp.Star<cpp.Void>, visitCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_create_animation_blend_tree_layer")
	public static function createAnimationBlendTreeLayer(blendTree:cpp.Star<cpp.Void>, options:flight._cpp.AnimationLayerOptions):flight._cpp.AnimationLayer;
	@:native("flight_create_animation_layer_stack")
	public static function createAnimationLayerStack(layers:cpp.Star<cpp.Void>, layersLen:Int):flight._cpp.AnimationLayerStack;
	@:native("flight_create_animation_state_machine_layer")
	public static function createAnimationStateMachineLayer(stateMachine:cpp.Star<cpp.Void>, options:flight._cpp.AnimationLayerOptions):flight._cpp.AnimationLayer;
	@:native("flight_advance_animation_layer_stack")
	public static function advanceAnimationLayerStack(stack:flight._cpp.AnimationLayerStack, dt:Float):Void;
	@:native("flight_sample_animation_layer_stack")
	public static function sampleAnimationLayerStack(out:cpp.Star<cpp.Void>, outLen:Int, stack:flight._cpp.AnimationLayerStack, visitFn:cpp.Star<cpp.Void>, visitCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_sample_animation_layer_stack_channel")
	public static function sampleAnimationLayerStackChannel(out:cpp.Star<cpp.Void>, outLen:Int, stack:flight._cpp.AnimationLayerStack, channelIndex:Int):Bool;
	@:native("flight_set_animation_layer_weight")
	public static function setAnimationLayerWeight(stack:flight._cpp.AnimationLayerStack, layerIndex:Int, weight:Single):Bool;
	@:native("flight_create_animation_player")
	public static function createAnimationPlayer(clip:flight._cpp.AnimationClip):flight._cpp.AnimationPlayer;
	@:native("flight_advance_animation_player")
	public static function advanceAnimationPlayer(player:flight._cpp.AnimationPlayer, dt:Float):Void;
	@:native("flight_clone_animation_player")
	public static function cloneAnimationPlayer(player:flight._cpp.AnimationPlayer):flight._cpp.AnimationPlayer;
	@:native("flight_enable_animation_player_signals")
	public static function enableAnimationPlayerSignals(player:flight._cpp.AnimationPlayer):Void;
	@:native("flight_get_animation_player_normalized_time")
	public static function getAnimationPlayerNormalizedTime(player:flight._cpp.AnimationPlayer):Single;
	@:native("flight_play_animation_player")
	public static function playAnimationPlayer(player:flight._cpp.AnimationPlayer):Void;
	@:native("flight_seek_animation_player")
	public static function seekAnimationPlayer(player:flight._cpp.AnimationPlayer, time:Float):Void;
	@:native("flight_stop_animation_player")
	public static function stopAnimationPlayer(player:flight._cpp.AnimationPlayer):Void;
	@:native("flight_create_animation_root_motion_extractor")
	public static function createAnimationRootMotionExtractor(clip:cpp.Star<cpp.Void>, channelIndex:Int):flight._cpp.AnimationRootMotionExtractor;
	@:native("flight_extract_animation_root_motion")
	public static function extractAnimationRootMotion(out:cpp.Star<cpp.Void>, outLen:Int, extractor:flight._cpp.AnimationRootMotionExtractor, startTime:Float, endTime:Float):Bool;
	@:native("flight_create_animation_state_machine_state")
	public static function createAnimationStateMachineState(blendTree:cpp.Star<cpp.Void>):flight._cpp.AnimationStateMachineState;
	@:native("flight_advance_animation_state_machine")
	public static function advanceAnimationStateMachine(machine:flight._cpp.AnimationStateMachine, dt:Float):Void;
	@:native("flight_get_animation_state_machine_current_state")
	public static function getAnimationStateMachineCurrentState(machine:flight._cpp.AnimationStateMachine):flight._cpp.AnimationStateMachineState;
	@:native("flight_is_animation_state_machine_transitioning")
	public static function isAnimationStateMachineTransitioning(machine:flight._cpp.AnimationStateMachine):Bool;
	@:native("flight_sample_animation_state_machine")
	public static function sampleAnimationStateMachine(out:cpp.Star<cpp.Void>, outLen:Int, machine:flight._cpp.AnimationStateMachine, visitFn:cpp.Star<cpp.Void>, visitCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_sample_animation_state_machine_channel")
	public static function sampleAnimationStateMachineChannel(out:cpp.Star<cpp.Void>, outLen:Int, machine:flight._cpp.AnimationStateMachine, channelIndex:Int):Bool;
	@:native("flight_create_animation_track")
	public static function createAnimationTrack():flight._cpp.AnimationTrack;
	@:native("flight_clone_animation_track")
	public static function cloneAnimationTrack(track:flight._cpp.AnimationTrack):flight._cpp.AnimationTrack;
	@:native("flight_sample_animation_track")
	public static function sampleAnimationTrack(out:cpp.Star<cpp.Void>, outLen:Int, track:flight._cpp.AnimationTrack, t:Float):Void;
	@:native("flight_trim_animation_track")
	public static function trimAnimationTrack(track:flight._cpp.AnimationTrack, startTime:Float, endTime:Float):flight._cpp.AnimationTrack;
	@:native("flight_validate_animation_track")
	public static function validateAnimationTrack(out:cpp.Star<cpp.Void>, track:flight._cpp.AnimationTrack):Bool;
	@:native("flight_free_animation_sample_accumulator")
	public static function freeAnimationSampleAccumulator(ptr:flight._cpp.AnimationSampleAccumulator):Void;
	@:native("flight_free_animation_blend_tree")
	public static function freeAnimationBlendTree(ptr:flight._cpp.AnimationBlendTree):Void;
	@:native("flight_free_animation_blend_tree_input")
	public static function freeAnimationBlendTreeInput(ptr:flight._cpp.AnimationBlendTreeInput):Void;
	@:native("flight_free_animation_channel")
	public static function freeAnimationChannel(ptr:flight._cpp.AnimationChannel):Void;
	@:native("flight_free_animation_clip")
	public static function freeAnimationClip(ptr:flight._cpp.AnimationClip):Void;
	@:native("flight_free_animation_clip_event")
	public static function freeAnimationClipEvent(ptr:flight._cpp.AnimationClipEvent):Void;
	@:native("flight_free_animation_crossfade")
	public static function freeAnimationCrossfade(ptr:flight._cpp.AnimationCrossfade):Void;
	@:native("flight_free_animation_layer")
	public static function freeAnimationLayer(ptr:flight._cpp.AnimationLayer):Void;
	@:native("flight_free_animation_layer_stack")
	public static function freeAnimationLayerStack(ptr:flight._cpp.AnimationLayerStack):Void;
	@:native("flight_free_animation_player")
	public static function freeAnimationPlayer(ptr:flight._cpp.AnimationPlayer):Void;
	@:native("flight_free_animation_root_motion_extractor")
	public static function freeAnimationRootMotionExtractor(ptr:flight._cpp.AnimationRootMotionExtractor):Void;
	@:native("flight_free_animation_state_machine_state")
	public static function freeAnimationStateMachineState(ptr:flight._cpp.AnimationStateMachineState):Void;
	@:native("flight_free_animation_track")
	public static function freeAnimationTrack(ptr:flight._cpp.AnimationTrack):Void;
}
