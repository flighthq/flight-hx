package flight;

extern inline function createAnimationSampleAccumulator(components:Int, quaternion:Bool):AnimationSampleAccumulator {
#if hl
	return flight._hl._fn.Animation.createAnimationSampleAccumulator(components, quaternion);
#elseif cpp
	return flight._cpp._fn.Animation.createAnimationSampleAccumulator(components, quaternion);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createAnimationSampleAccumulator(components, quaternion);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function accumulateAnimationSample(accumulator:AnimationSampleAccumulator, sample:Dynamic, sampleLen:Int, weight:Float):Void {
#if hl
	flight._hl._fn.Animation.accumulateAnimationSample(accumulator, sample, sampleLen, weight);
#elseif cpp
	flight._cpp._fn.Animation.accumulateAnimationSample(accumulator, sample, sampleLen, weight);
#elseif (js && flight_esm)
	flight._js._fn.Animation.accumulateAnimationSample(accumulator, sample, sampleLen, weight);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function addAnimationSample(out:Dynamic, outLen:Int, base:Dynamic, baseLen:Int, delta:Dynamic, deltaLen:Int, weight:Float, quaternion:Bool):Void {
#if hl
	flight._hl._fn.Animation.addAnimationSample(out, outLen, base, baseLen, delta, deltaLen, weight, quaternion);
#elseif cpp
	flight._cpp._fn.Animation.addAnimationSample(out, outLen, base, baseLen, delta, deltaLen, weight, quaternion);
#elseif (js && flight_esm)
	flight._js._fn.Animation.addAnimationSample(out, outLen, base, baseLen, delta, deltaLen, weight, quaternion);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function blendAnimationSamples(out:Dynamic, outLen:Int, a:Dynamic, aLen:Int, b:Dynamic, bLen:Int, alpha:Float, quaternion:Bool):Void {
#if hl
	flight._hl._fn.Animation.blendAnimationSamples(out, outLen, a, aLen, b, bLen, alpha, quaternion);
#elseif cpp
	flight._cpp._fn.Animation.blendAnimationSamples(out, outLen, a, aLen, b, bLen, alpha, quaternion);
#elseif (js && flight_esm)
	flight._js._fn.Animation.blendAnimationSamples(out, outLen, a, aLen, b, bLen, alpha, quaternion);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function finishAnimationSample(out:Dynamic, outLen:Int, accumulator:AnimationSampleAccumulator):Bool {
#if hl
	return flight._hl._fn.Animation.finishAnimationSample(out, outLen, accumulator);
#elseif cpp
	return flight._cpp._fn.Animation.finishAnimationSample(out, outLen, accumulator);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.finishAnimationSample(out, outLen, accumulator);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function resetAnimationSampleAccumulator(accumulator:AnimationSampleAccumulator):Void {
#if hl
	flight._hl._fn.Animation.resetAnimationSampleAccumulator(accumulator);
#elseif cpp
	flight._cpp._fn.Animation.resetAnimationSampleAccumulator(accumulator);
#elseif (js && flight_esm)
	flight._js._fn.Animation.resetAnimationSampleAccumulator(accumulator);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function createAnimationBlendTree(inputs:Dynamic, inputsLen:Int):AnimationBlendTree {
#if hl
	return flight._hl._fn.Animation.createAnimationBlendTree(inputs, inputsLen);
#elseif cpp
	return flight._cpp._fn.Animation.createAnimationBlendTree(inputs, inputsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createAnimationBlendTree(inputs, inputsLen);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function createAnimationBlendTreeInput(player:Dynamic):AnimationBlendTreeInput {
#if hl
	return flight._hl._fn.Animation.createAnimationBlendTreeInput(player);
#elseif cpp
	return flight._cpp._fn.Animation.createAnimationBlendTreeInput(player);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createAnimationBlendTreeInput(player);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function advanceAnimationBlendTree(tree:AnimationBlendTree, dt:Float):Void {
#if hl
	flight._hl._fn.Animation.advanceAnimationBlendTree(tree, dt);
#elseif cpp
	flight._cpp._fn.Animation.advanceAnimationBlendTree(tree, dt);
#elseif (js && flight_esm)
	flight._js._fn.Animation.advanceAnimationBlendTree(tree, dt);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function sampleAnimationBlendTree(out:Dynamic, outLen:Int, tree:AnimationBlendTree, visitFn:Dynamic, visitCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Animation.sampleAnimationBlendTree(out, outLen, tree, visitFn, visitCtx);
#elseif cpp
	flight._cpp._fn.Animation.sampleAnimationBlendTree(out, outLen, tree, visitFn, visitCtx);
#elseif (js && flight_esm)
	flight._js._fn.Animation.sampleAnimationBlendTree(out, outLen, tree, visitFn, visitCtx);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function sampleAnimationBlendTreeChannel(out:Dynamic, outLen:Int, tree:AnimationBlendTree, channelIndex:Int):Bool {
#if hl
	return flight._hl._fn.Animation.sampleAnimationBlendTreeChannel(out, outLen, tree, channelIndex);
#elseif cpp
	return flight._cpp._fn.Animation.sampleAnimationBlendTreeChannel(out, outLen, tree, channelIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.sampleAnimationBlendTreeChannel(out, outLen, tree, channelIndex);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function setAnimationBlendTreeInputWeight(tree:AnimationBlendTree, inputIndex:Int, weight:Float):Bool {
#if hl
	return flight._hl._fn.Animation.setAnimationBlendTreeInputWeight(tree, inputIndex, weight);
#elseif cpp
	return flight._cpp._fn.Animation.setAnimationBlendTreeInputWeight(tree, inputIndex, weight);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.setAnimationBlendTreeInputWeight(tree, inputIndex, weight);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function createAnimationChannel(track:Dynamic, targetRef:TargetRef):AnimationChannel {
#if hl
	return flight._hl._fn.Animation.createAnimationChannel(track, targetRef);
#elseif cpp
	return flight._cpp._fn.Animation.createAnimationChannel(track, targetRef);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createAnimationChannel(track, targetRef);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function createAnimationClip(channels:Dynamic, duration:Float, events:Dynamic, eventsLen:Int):AnimationClip {
#if hl
	return flight._hl._fn.Animation.createAnimationClip(channels, duration, events, eventsLen);
#elseif cpp
	return flight._cpp._fn.Animation.createAnimationClip(channels, duration, events, eventsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createAnimationClip(channels, duration, events, eventsLen);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function createAnimationClipEvent():AnimationClipEvent {
#if hl
	return flight._hl._fn.Animation.createAnimationClipEvent();
#elseif cpp
	return flight._cpp._fn.Animation.createAnimationClipEvent();
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createAnimationClipEvent();
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function cloneAnimationClip(clip:AnimationClip):AnimationClip {
#if hl
	return flight._hl._fn.Animation.cloneAnimationClip(clip);
#elseif cpp
	return flight._cpp._fn.Animation.cloneAnimationClip(clip);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.cloneAnimationClip(clip);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function getAnimationClipDuration(clip:AnimationClip):Float {
#if hl
	return flight._hl._fn.Animation.getAnimationClipDuration(clip);
#elseif cpp
	return flight._cpp._fn.Animation.getAnimationClipDuration(clip);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.getAnimationClipDuration(clip);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function sampleAnimationClip(out:Dynamic, outLen:Int, clip:AnimationClip, time:Float, visitFn:Dynamic, visitCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Animation.sampleAnimationClip(out, outLen, clip, time, visitFn, visitCtx);
#elseif cpp
	flight._cpp._fn.Animation.sampleAnimationClip(out, outLen, clip, time, visitFn, visitCtx);
#elseif (js && flight_esm)
	flight._js._fn.Animation.sampleAnimationClip(out, outLen, clip, time, visitFn, visitCtx);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function createAnimationCrossfade(from:Dynamic, to:Dynamic, duration:Float, opts:AnimationCrossfadeOptions):AnimationCrossfade {
#if hl
	return flight._hl._fn.Animation.createAnimationCrossfade(from, to, duration, opts);
#elseif cpp
	return flight._cpp._fn.Animation.createAnimationCrossfade(from, to, duration, opts);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createAnimationCrossfade(from, to, duration, opts);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function advanceAnimationCrossfade(state:AnimationCrossfade, dt:Float):Void {
#if hl
	flight._hl._fn.Animation.advanceAnimationCrossfade(state, dt);
#elseif cpp
	flight._cpp._fn.Animation.advanceAnimationCrossfade(state, dt);
#elseif (js && flight_esm)
	flight._js._fn.Animation.advanceAnimationCrossfade(state, dt);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function isAnimationCrossfadeComplete(state:AnimationCrossfade):Bool {
#if hl
	return flight._hl._fn.Animation.isAnimationCrossfadeComplete(state);
#elseif cpp
	return flight._cpp._fn.Animation.isAnimationCrossfadeComplete(state);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.isAnimationCrossfadeComplete(state);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function sampleAnimationCrossfade(out:Dynamic, outLen:Int, state:AnimationCrossfade, visitFn:Dynamic, visitCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Animation.sampleAnimationCrossfade(out, outLen, state, visitFn, visitCtx);
#elseif cpp
	flight._cpp._fn.Animation.sampleAnimationCrossfade(out, outLen, state, visitFn, visitCtx);
#elseif (js && flight_esm)
	flight._js._fn.Animation.sampleAnimationCrossfade(out, outLen, state, visitFn, visitCtx);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function createAnimationBlendTreeLayer(blendTree:Dynamic, options:AnimationLayerOptions):AnimationLayer {
#if hl
	return flight._hl._fn.Animation.createAnimationBlendTreeLayer(blendTree, options);
#elseif cpp
	return flight._cpp._fn.Animation.createAnimationBlendTreeLayer(blendTree, options);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createAnimationBlendTreeLayer(blendTree, options);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function createAnimationLayerStack(layers:Dynamic, layersLen:Int):AnimationLayerStack {
#if hl
	return flight._hl._fn.Animation.createAnimationLayerStack(layers, layersLen);
#elseif cpp
	return flight._cpp._fn.Animation.createAnimationLayerStack(layers, layersLen);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createAnimationLayerStack(layers, layersLen);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function createAnimationStateMachineLayer(stateMachine:Dynamic, options:AnimationLayerOptions):AnimationLayer {
#if hl
	return flight._hl._fn.Animation.createAnimationStateMachineLayer(stateMachine, options);
#elseif cpp
	return flight._cpp._fn.Animation.createAnimationStateMachineLayer(stateMachine, options);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createAnimationStateMachineLayer(stateMachine, options);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function advanceAnimationLayerStack(stack:AnimationLayerStack, dt:Float):Void {
#if hl
	flight._hl._fn.Animation.advanceAnimationLayerStack(stack, dt);
#elseif cpp
	flight._cpp._fn.Animation.advanceAnimationLayerStack(stack, dt);
#elseif (js && flight_esm)
	flight._js._fn.Animation.advanceAnimationLayerStack(stack, dt);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function sampleAnimationLayerStack(out:Dynamic, outLen:Int, stack:AnimationLayerStack, visitFn:Dynamic, visitCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Animation.sampleAnimationLayerStack(out, outLen, stack, visitFn, visitCtx);
#elseif cpp
	flight._cpp._fn.Animation.sampleAnimationLayerStack(out, outLen, stack, visitFn, visitCtx);
#elseif (js && flight_esm)
	flight._js._fn.Animation.sampleAnimationLayerStack(out, outLen, stack, visitFn, visitCtx);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function sampleAnimationLayerStackChannel(out:Dynamic, outLen:Int, stack:AnimationLayerStack, channelIndex:Int):Bool {
#if hl
	return flight._hl._fn.Animation.sampleAnimationLayerStackChannel(out, outLen, stack, channelIndex);
#elseif cpp
	return flight._cpp._fn.Animation.sampleAnimationLayerStackChannel(out, outLen, stack, channelIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.sampleAnimationLayerStackChannel(out, outLen, stack, channelIndex);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function setAnimationLayerWeight(stack:AnimationLayerStack, layerIndex:Int, weight:Float):Bool {
#if hl
	return flight._hl._fn.Animation.setAnimationLayerWeight(stack, layerIndex, weight);
#elseif cpp
	return flight._cpp._fn.Animation.setAnimationLayerWeight(stack, layerIndex, weight);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.setAnimationLayerWeight(stack, layerIndex, weight);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function createAnimationPlayer(clip:AnimationClip):AnimationPlayer {
#if hl
	return flight._hl._fn.Animation.createAnimationPlayer(clip);
#elseif cpp
	return flight._cpp._fn.Animation.createAnimationPlayer(clip);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createAnimationPlayer(clip);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function advanceAnimationPlayer(player:AnimationPlayer, dt:Float):Void {
#if hl
	flight._hl._fn.Animation.advanceAnimationPlayer(player, dt);
#elseif cpp
	flight._cpp._fn.Animation.advanceAnimationPlayer(player, dt);
#elseif (js && flight_esm)
	flight._js._fn.Animation.advanceAnimationPlayer(player, dt);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function cloneAnimationPlayer(player:AnimationPlayer):AnimationPlayer {
#if hl
	return flight._hl._fn.Animation.cloneAnimationPlayer(player);
#elseif cpp
	return flight._cpp._fn.Animation.cloneAnimationPlayer(player);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.cloneAnimationPlayer(player);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function enableAnimationPlayerSignals(player:AnimationPlayer):Void {
#if hl
	flight._hl._fn.Animation.enableAnimationPlayerSignals(player);
#elseif cpp
	flight._cpp._fn.Animation.enableAnimationPlayerSignals(player);
#elseif (js && flight_esm)
	flight._js._fn.Animation.enableAnimationPlayerSignals(player);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function getAnimationPlayerNormalizedTime(player:AnimationPlayer):Float {
#if hl
	return flight._hl._fn.Animation.getAnimationPlayerNormalizedTime(player);
#elseif cpp
	return flight._cpp._fn.Animation.getAnimationPlayerNormalizedTime(player);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.getAnimationPlayerNormalizedTime(player);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function playAnimationPlayer(player:AnimationPlayer):Void {
#if hl
	flight._hl._fn.Animation.playAnimationPlayer(player);
#elseif cpp
	flight._cpp._fn.Animation.playAnimationPlayer(player);
#elseif (js && flight_esm)
	flight._js._fn.Animation.playAnimationPlayer(player);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function seekAnimationPlayer(player:AnimationPlayer, time:Float):Void {
#if hl
	flight._hl._fn.Animation.seekAnimationPlayer(player, time);
#elseif cpp
	flight._cpp._fn.Animation.seekAnimationPlayer(player, time);
#elseif (js && flight_esm)
	flight._js._fn.Animation.seekAnimationPlayer(player, time);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function stopAnimationPlayer(player:AnimationPlayer):Void {
#if hl
	flight._hl._fn.Animation.stopAnimationPlayer(player);
#elseif cpp
	flight._cpp._fn.Animation.stopAnimationPlayer(player);
#elseif (js && flight_esm)
	flight._js._fn.Animation.stopAnimationPlayer(player);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function createAnimationRootMotionExtractor(clip:Dynamic, channelIndex:Int):AnimationRootMotionExtractor {
#if hl
	return flight._hl._fn.Animation.createAnimationRootMotionExtractor(clip, channelIndex);
#elseif cpp
	return flight._cpp._fn.Animation.createAnimationRootMotionExtractor(clip, channelIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createAnimationRootMotionExtractor(clip, channelIndex);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function extractAnimationRootMotion(out:Dynamic, outLen:Int, extractor:AnimationRootMotionExtractor, startTime:Float, endTime:Float):Bool {
#if hl
	return flight._hl._fn.Animation.extractAnimationRootMotion(out, outLen, extractor, startTime, endTime);
#elseif cpp
	return flight._cpp._fn.Animation.extractAnimationRootMotion(out, outLen, extractor, startTime, endTime);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.extractAnimationRootMotion(out, outLen, extractor, startTime, endTime);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function createAnimationStateMachineState(blendTree:Dynamic):AnimationStateMachineState {
#if hl
	return flight._hl._fn.Animation.createAnimationStateMachineState(blendTree);
#elseif cpp
	return flight._cpp._fn.Animation.createAnimationStateMachineState(blendTree);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createAnimationStateMachineState(blendTree);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function advanceAnimationStateMachine(machine:AnimationStateMachine, dt:Float):Void {
#if hl
	flight._hl._fn.Animation.advanceAnimationStateMachine(machine, dt);
#elseif cpp
	flight._cpp._fn.Animation.advanceAnimationStateMachine(machine, dt);
#elseif (js && flight_esm)
	flight._js._fn.Animation.advanceAnimationStateMachine(machine, dt);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function getAnimationStateMachineCurrentState(machine:AnimationStateMachine):AnimationStateMachineState {
#if hl
	return flight._hl._fn.Animation.getAnimationStateMachineCurrentState(machine);
#elseif cpp
	return flight._cpp._fn.Animation.getAnimationStateMachineCurrentState(machine);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.getAnimationStateMachineCurrentState(machine);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function isAnimationStateMachineTransitioning(machine:AnimationStateMachine):Bool {
#if hl
	return flight._hl._fn.Animation.isAnimationStateMachineTransitioning(machine);
#elseif cpp
	return flight._cpp._fn.Animation.isAnimationStateMachineTransitioning(machine);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.isAnimationStateMachineTransitioning(machine);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function sampleAnimationStateMachine(out:Dynamic, outLen:Int, machine:AnimationStateMachine, visitFn:Dynamic, visitCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Animation.sampleAnimationStateMachine(out, outLen, machine, visitFn, visitCtx);
#elseif cpp
	flight._cpp._fn.Animation.sampleAnimationStateMachine(out, outLen, machine, visitFn, visitCtx);
#elseif (js && flight_esm)
	flight._js._fn.Animation.sampleAnimationStateMachine(out, outLen, machine, visitFn, visitCtx);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function sampleAnimationStateMachineChannel(out:Dynamic, outLen:Int, machine:AnimationStateMachine, channelIndex:Int):Bool {
#if hl
	return flight._hl._fn.Animation.sampleAnimationStateMachineChannel(out, outLen, machine, channelIndex);
#elseif cpp
	return flight._cpp._fn.Animation.sampleAnimationStateMachineChannel(out, outLen, machine, channelIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.sampleAnimationStateMachineChannel(out, outLen, machine, channelIndex);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function transitionAnimationStateMachine(machine:AnimationStateMachine, toState:StateRef, duration:Float, curveFn:Dynamic, curveCtx:Dynamic):Bool {
#if hl
	return flight._hl._fn.Animation.transitionAnimationStateMachine(machine, toState, duration, curveFn, curveCtx);
#elseif cpp
	return flight._cpp._fn.Animation.transitionAnimationStateMachine(machine, toState, duration, curveFn, curveCtx);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.transitionAnimationStateMachine(machine, toState, duration, curveFn, curveCtx);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function createAnimationTrack():AnimationTrack {
#if hl
	return flight._hl._fn.Animation.createAnimationTrack();
#elseif cpp
	return flight._cpp._fn.Animation.createAnimationTrack();
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createAnimationTrack();
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function cloneAnimationTrack(track:AnimationTrack):AnimationTrack {
#if hl
	return flight._hl._fn.Animation.cloneAnimationTrack(track);
#elseif cpp
	return flight._cpp._fn.Animation.cloneAnimationTrack(track);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.cloneAnimationTrack(track);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function sampleAnimationTrack(out:Dynamic, outLen:Int, track:AnimationTrack, t:Float):Void {
#if hl
	flight._hl._fn.Animation.sampleAnimationTrack(out, outLen, track, t);
#elseif cpp
	flight._cpp._fn.Animation.sampleAnimationTrack(out, outLen, track, t);
#elseif (js && flight_esm)
	flight._js._fn.Animation.sampleAnimationTrack(out, outLen, track, t);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function trimAnimationTrack(track:AnimationTrack, startTime:Float, endTime:Float):AnimationTrack {
#if hl
	return flight._hl._fn.Animation.trimAnimationTrack(track, startTime, endTime);
#elseif cpp
	return flight._cpp._fn.Animation.trimAnimationTrack(track, startTime, endTime);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.trimAnimationTrack(track, startTime, endTime);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function validateAnimationTrack(out:Dynamic, track:AnimationTrack):Bool {
#if hl
	return flight._hl._fn.Animation.validateAnimationTrack(out, track);
#elseif cpp
	return flight._cpp._fn.Animation.validateAnimationTrack(out, track);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.validateAnimationTrack(out, track);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function createStateRefFromIndex(index:Int):StateRef {
#if hl
	return flight._hl._fn.Animation.createStateRefFromIndex(index);
#elseif cpp
	return flight._cpp._fn.Animation.createStateRefFromIndex(index);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createStateRefFromIndex(index);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function createStateRefFromName(name:String):StateRef {
#if hl
	return flight._hl._fn.Animation.createStateRefFromName(cast name);
#elseif cpp
	return flight._cpp._fn.Animation.createStateRefFromName(cast name);
#elseif (js && flight_esm)
	return flight._js._fn.Animation.createStateRefFromName(name);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function freeAnimationSampleAccumulator(ptr:AnimationSampleAccumulator):Void {
#if hl
	flight._hl._fn.Animation.freeAnimationSampleAccumulator(ptr);
#elseif cpp
	flight._cpp._fn.Animation.freeAnimationSampleAccumulator(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Animation.freeAnimationSampleAccumulator(ptr);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function freeAnimationBlendTree(ptr:AnimationBlendTree):Void {
#if hl
	flight._hl._fn.Animation.freeAnimationBlendTree(ptr);
#elseif cpp
	flight._cpp._fn.Animation.freeAnimationBlendTree(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Animation.freeAnimationBlendTree(ptr);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function freeAnimationBlendTreeInput(ptr:AnimationBlendTreeInput):Void {
#if hl
	flight._hl._fn.Animation.freeAnimationBlendTreeInput(ptr);
#elseif cpp
	flight._cpp._fn.Animation.freeAnimationBlendTreeInput(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Animation.freeAnimationBlendTreeInput(ptr);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function freeAnimationChannel(ptr:AnimationChannel):Void {
#if hl
	flight._hl._fn.Animation.freeAnimationChannel(ptr);
#elseif cpp
	flight._cpp._fn.Animation.freeAnimationChannel(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Animation.freeAnimationChannel(ptr);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function freeAnimationClip(ptr:AnimationClip):Void {
#if hl
	flight._hl._fn.Animation.freeAnimationClip(ptr);
#elseif cpp
	flight._cpp._fn.Animation.freeAnimationClip(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Animation.freeAnimationClip(ptr);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function freeAnimationClipEvent(ptr:AnimationClipEvent):Void {
#if hl
	flight._hl._fn.Animation.freeAnimationClipEvent(ptr);
#elseif cpp
	flight._cpp._fn.Animation.freeAnimationClipEvent(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Animation.freeAnimationClipEvent(ptr);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function freeAnimationCrossfade(ptr:AnimationCrossfade):Void {
#if hl
	flight._hl._fn.Animation.freeAnimationCrossfade(ptr);
#elseif cpp
	flight._cpp._fn.Animation.freeAnimationCrossfade(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Animation.freeAnimationCrossfade(ptr);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function freeAnimationLayer(ptr:AnimationLayer):Void {
#if hl
	flight._hl._fn.Animation.freeAnimationLayer(ptr);
#elseif cpp
	flight._cpp._fn.Animation.freeAnimationLayer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Animation.freeAnimationLayer(ptr);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function freeAnimationLayerStack(ptr:AnimationLayerStack):Void {
#if hl
	flight._hl._fn.Animation.freeAnimationLayerStack(ptr);
#elseif cpp
	flight._cpp._fn.Animation.freeAnimationLayerStack(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Animation.freeAnimationLayerStack(ptr);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function freeAnimationPlayer(ptr:AnimationPlayer):Void {
#if hl
	flight._hl._fn.Animation.freeAnimationPlayer(ptr);
#elseif cpp
	flight._cpp._fn.Animation.freeAnimationPlayer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Animation.freeAnimationPlayer(ptr);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function freeAnimationRootMotionExtractor(ptr:AnimationRootMotionExtractor):Void {
#if hl
	flight._hl._fn.Animation.freeAnimationRootMotionExtractor(ptr);
#elseif cpp
	flight._cpp._fn.Animation.freeAnimationRootMotionExtractor(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Animation.freeAnimationRootMotionExtractor(ptr);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function freeAnimationStateMachineState(ptr:AnimationStateMachineState):Void {
#if hl
	flight._hl._fn.Animation.freeAnimationStateMachineState(ptr);
#elseif cpp
	flight._cpp._fn.Animation.freeAnimationStateMachineState(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Animation.freeAnimationStateMachineState(ptr);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function freeAnimationTrack(ptr:AnimationTrack):Void {
#if hl
	flight._hl._fn.Animation.freeAnimationTrack(ptr);
#elseif cpp
	flight._cpp._fn.Animation.freeAnimationTrack(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Animation.freeAnimationTrack(ptr);
#else
	#error "flight.Animation: no backend for this target."
#end
}
extern inline function freeStateRef(ptr:StateRef):Void {
#if hl
	flight._hl._fn.Animation.freeStateRef(ptr);
#elseif cpp
	flight._cpp._fn.Animation.freeStateRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Animation.freeStateRef(ptr);
#else
	#error "flight.Animation: no backend for this target."
#end
}
