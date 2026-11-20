package flight.esm.animation;

#if (js && flight_esm)
@:jsRequire("@flighthq/animation/contract")
extern class Contract {
  public static final AnimationInterpolationCubic:String;
  public static final AnimationInterpolationLinear:String;
  public static final AnimationInterpolationStep:String;
  public static final AnimationLoopModePingPong:String;
  public static final AnimationLoopModeRepeat:String;
  public static function accumulateAnimationSample(accumulator:flight.esm.types.animation.Types.AnimationSampleAccumulator, sample:Dynamic, weight:Float):Void;
  public static function addAnimationSample(out:js.lib.Float32Array, base:Dynamic, delta:Dynamic, weight:Float, ?quaternion:Bool):Void;
  public static function advanceAnimationBlendTree(tree:flight.esm.types.animation.Types.AnimationBlendTree, dt:Float):Void;
  public static function advanceAnimationCrossfade(state:flight.esm.types.animation.Types.AnimationCrossfade, dt:Float):Void;
  public static function advanceAnimationLayerStack(stack:flight.esm.types.animation.Types.AnimationLayerStack, dt:Float):Void;
  public static function advanceAnimationPlayer(player:flight.esm.types.animation.Types.AnimationPlayer, dt:Float):Void;
  public static function advanceAnimationPlayers(players:Array<flight.esm.types.animation.Types.AnimationPlayer>, dt:Float, advanced:Array<flight.esm.types.animation.Types.AnimationPlayer>):Void;
  public static function advanceAnimationStateMachine(machine:flight.esm.types.animation.Types.AnimationStateMachine, dt:Float):Void;
  public static function advanceAnimationStateMachineWithScratch(machine:flight.esm.types.animation.Types.AnimationStateMachine, dt:Float, advanced:Array<flight.esm.types.animation.Types.AnimationPlayer>):Void;
  public static function blendAnimationSamples(out:js.lib.Float32Array, a:Dynamic, b:Dynamic, alpha:Float, ?quaternion:Bool):Void;
  public static function cloneAnimationClip(clip:flight.esm.types.animation.Types.AnimationClip):flight.esm.types.animation.Types.AnimationClip;
  public static function cloneAnimationPlayer(player:flight.esm.types.animation.Types.AnimationPlayer):flight.esm.types.animation.Types.AnimationPlayer;
  public static function cloneAnimationTrack(track:flight.esm.types.animation.Types.AnimationTrack):flight.esm.types.animation.Types.AnimationTrack;
  public static function createAnimationBlendTree(inputs:Array<flight.esm.types.animation.Types.AnimationBlendTreeInput>):flight.esm.types.animation.Types.AnimationBlendTree;
  public static function createAnimationBlendTreeInput(player:flight.esm.types.animation.Types.AnimationPlayer, ?weight:Float, ?additive:Bool):flight.esm.types.animation.Types.AnimationBlendTreeInput;
  public static function createAnimationBlendTreeLayer(blendTree:flight.esm.types.animation.Types.AnimationBlendTree, ?options:Null<flight.esm.types.animation.Types.AnimationLayerOptions>):flight.esm.types.animation.Types.AnimationLayer;
  public static function createAnimationChannel(track:flight.esm.types.animation.Types.AnimationTrack, targetRef:Dynamic):flight.esm.types.animation.Types.AnimationChannel;
  public static function createAnimationClip(channels:Array<flight.esm.types.animation.Types.AnimationChannel>, ?duration:Null<Float>, ?events:Array<flight.esm.types.animation.Types.AnimationClipEvent>):flight.esm.types.animation.Types.AnimationClip;
  public static function createAnimationClipEvent(time:Float, name:String, ?payload:Dynamic):flight.esm.types.animation.Types.AnimationClipEvent;
  public static function createAnimationCrossfade(from:flight.esm.types.animation.Types.AnimationPlayer, to:flight.esm.types.animation.Types.AnimationPlayer, duration:Float, ?opts:Null<flight.esm.types.animation.Types.AnimationCrossfadeOptions>):flight.esm.types.animation.Types.AnimationCrossfade;
  public static function createAnimationLayerStack(layers:Array<flight.esm.types.animation.Types.AnimationLayer>):flight.esm.types.animation.Types.AnimationLayerStack;
  public static function createAnimationPlayer(clip:flight.esm.types.animation.Types.AnimationClip, ?opts:Dynamic):flight.esm.types.animation.Types.AnimationPlayer;
  public static function createAnimationRootMotionExtractor(clip:flight.esm.types.animation.Types.AnimationClip, channelIndex:Float):flight.esm.types.animation.Types.AnimationRootMotionExtractor;
  public static function createAnimationSampleAccumulator(components:Float, ?quaternion:Bool):flight.esm.types.animation.Types.AnimationSampleAccumulator;
  public static function createAnimationStateMachine(states:Array<flight.esm.types.animation.Types.AnimationStateMachineState>, ?initialState:Dynamic):flight.esm.types.animation.Types.AnimationStateMachine;
  public static function createAnimationStateMachineLayer(stateMachine:flight.esm.types.animation.Types.AnimationStateMachine, ?options:Null<flight.esm.types.animation.Types.AnimationLayerOptions>):flight.esm.types.animation.Types.AnimationLayer;
  public static function createAnimationStateMachineState(name:String, blendTree:flight.esm.types.animation.Types.AnimationBlendTree):flight.esm.types.animation.Types.AnimationStateMachineState;
  public static function createAnimationTrack(opts:Dynamic):flight.esm.types.animation.Types.AnimationTrack;
  public static function enableAnimationPlayerSignals(player:flight.esm.types.animation.Types.AnimationPlayer):Void;
  public static function extractAnimationRootMotion(out:js.lib.Float32Array, extractor:flight.esm.types.animation.Types.AnimationRootMotionExtractor, startTime:Float, endTime:Float):Bool;
  public static function finishAnimationSample(out:js.lib.Float32Array, accumulator:flight.esm.types.animation.Types.AnimationSampleAccumulator):Bool;
  public static function getAnimationClipDuration(clip:flight.esm.types.animation.Types.AnimationClip):Float;
  public static function getAnimationPlayerNormalizedTime(player:flight.esm.types.animation.Types.AnimationPlayer):Float;
  public static function getAnimationStateMachineCurrentState(machine:flight.esm.types.animation.Types.AnimationStateMachine):flight.esm.types.animation.Types.AnimationStateMachineState;
  public static function initializeAnimationBlendTree(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.animation.Types.AnimationBlendTree>, inputs:Array<flight.esm.types.animation.Types.AnimationBlendTreeInput>):Void;
  public static function initializeAnimationBlendTreeInput(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.animation.Types.AnimationBlendTreeInput>, player:flight.esm.types.animation.Types.AnimationPlayer, ?weight:Float, ?additive:Bool):Void;
  public static function initializeAnimationChannel(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.animation.Types.AnimationChannel>, track:flight.esm.types.animation.Types.AnimationTrack, targetRef:Dynamic):Void;
  public static function initializeAnimationClip(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.animation.Types.AnimationClip>, channels:Array<flight.esm.types.animation.Types.AnimationChannel>, ?duration:Null<Float>, ?events:Array<flight.esm.types.animation.Types.AnimationClipEvent>):Void;
  public static function initializeAnimationClipEvent(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.animation.Types.AnimationClipEvent>, time:Float, name:String, ?payload:Dynamic):Void;
  public static function initializeAnimationCrossfade(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.animation.Types.AnimationCrossfade>, from:flight.esm.types.animation.Types.AnimationPlayer, to:flight.esm.types.animation.Types.AnimationPlayer, duration:Float, ?opts:Null<flight.esm.types.animation.Types.AnimationCrossfadeOptions>):Void;
  public static function initializeAnimationLayerStack(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.animation.Types.AnimationLayerStack>, layers:Array<flight.esm.types.animation.Types.AnimationLayer>):Void;
  public static function initializeAnimationPlayer(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.animation.Types.AnimationPlayer>, clip:flight.esm.types.animation.Types.AnimationClip, ?opts:Dynamic):Void;
  public static function initializeAnimationRootMotionExtractor(extractor:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.animation.Types.AnimationRootMotionExtractor>, clip:flight.esm.types.animation.Types.AnimationClip, channelIndex:Float):Void;
  public static function initializeAnimationSampleAccumulator(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.animation.Types.AnimationSampleAccumulator>, width:Float, quaternion:Bool):Void;
  public static function initializeAnimationStateMachine(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.animation.Types.AnimationStateMachine>, states:Array<flight.esm.types.animation.Types.AnimationStateMachineState>, ?initialState:Dynamic):Void;
  public static function initializeAnimationStateMachineState(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.animation.Types.AnimationStateMachineState>, name:String, blendTree:flight.esm.types.animation.Types.AnimationBlendTree):Void;
  public static function initializeAnimationTrack(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.animation.Types.AnimationTrack>, opts:Dynamic):Void;
  public static function isAnimationCrossfadeComplete(state:flight.esm.types.animation.Types.AnimationCrossfade):Bool;
  public static function isAnimationStateMachineTransitioning(machine:flight.esm.types.animation.Types.AnimationStateMachine):Bool;
  public static function playAnimationPlayer(player:flight.esm.types.animation.Types.AnimationPlayer):Void;
  public static function resetAnimationSampleAccumulator(accumulator:flight.esm.types.animation.Types.AnimationSampleAccumulator):Void;
  public static function sampleAnimationBlendTree(out:js.lib.Float32Array, tree:flight.esm.types.animation.Types.AnimationBlendTree, visit:((sampled:js.lib.Float32Array, channel:flight.esm.types.animation.Types.AnimationChannel, index:Float) -> Void)):Void;
  public static function sampleAnimationBlendTreeChannel(out:js.lib.Float32Array, tree:flight.esm.types.animation.Types.AnimationBlendTree, channelIndex:Float):Bool;
  public static function sampleAnimationClip(out:js.lib.Float32Array, clip:flight.esm.types.animation.Types.AnimationClip, time:Float, visit:((sampled:js.lib.Float32Array, channel:flight.esm.types.animation.Types.AnimationChannel, index:Float) -> Void)):Void;
  public static function sampleAnimationCrossfade(out:js.lib.Float32Array, state:flight.esm.types.animation.Types.AnimationCrossfade, visit:((sampled:js.lib.Float32Array, channel:flight.esm.types.animation.Types.AnimationChannel, index:Float) -> Void)):Void;
  public static function sampleAnimationLayerStack(out:js.lib.Float32Array, stack:flight.esm.types.animation.Types.AnimationLayerStack, visit:((sampled:js.lib.Float32Array, channel:flight.esm.types.animation.Types.AnimationChannel, index:Float) -> Void)):Void;
  public static function sampleAnimationLayerStackChannel(out:js.lib.Float32Array, stack:flight.esm.types.animation.Types.AnimationLayerStack, channelIndex:Float):Bool;
  public static function sampleAnimationStateMachine(out:js.lib.Float32Array, machine:flight.esm.types.animation.Types.AnimationStateMachine, visit:((sampled:js.lib.Float32Array, channel:flight.esm.types.animation.Types.AnimationChannel, index:Float) -> Void)):Void;
  public static function sampleAnimationStateMachineChannel(out:js.lib.Float32Array, machine:flight.esm.types.animation.Types.AnimationStateMachine, channelIndex:Float):Bool;
  public static function sampleAnimationTrack(out:js.lib.Float32Array, track:flight.esm.types.animation.Types.AnimationTrack, t:Float):Void;
  public static function seekAnimationPlayer(player:flight.esm.types.animation.Types.AnimationPlayer, time:Float):Void;
  public static function setAnimationBlendTreeInputWeight(tree:flight.esm.types.animation.Types.AnimationBlendTree, inputIndex:Float, weight:Float):Bool;
  public static function setAnimationLayerWeight(stack:flight.esm.types.animation.Types.AnimationLayerStack, layerIndex:Float, weight:Float):Bool;
  public static function stopAnimationPlayer(player:flight.esm.types.animation.Types.AnimationPlayer):Void;
  public static function transitionAnimationStateMachine(machine:flight.esm.types.animation.Types.AnimationStateMachine, toState:Dynamic, duration:Float, ?curve:((t:Float) -> Float)):Bool;
  public static function trimAnimationTrack(track:flight.esm.types.animation.Types.AnimationTrack, startTime:Float, endTime:Float):flight.esm.types.animation.Types.AnimationTrack;
  public static function validateAnimationTrack(track:flight.esm.types.animation.Types.AnimationTrack):Null<Array<flight.esm.types.animation.Types.AnimationTrackValidationDiagnostic>>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
