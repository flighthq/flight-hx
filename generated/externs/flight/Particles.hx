package flight;

#if (js && flight_esm)
extern inline function applyParticleCollisions(transforms:Dynamic, positionsZ:Dynamic, particleCount:Int, state:ParticleEmitterState, colliders:Dynamic):Void {
	flight._js._fn.Particles.applyParticleCollisions(transforms, positionsZ, particleCount, state, colliders);
}
#else
extern inline function applyParticleCollisions(transforms:Dynamic, transformsLen:Int, positionsZ:Dynamic, positionsZLen:Int, particleCount:Int, state:ParticleEmitterState, colliders:Dynamic, collidersLen:Int):Void {
#if hl
	flight._hl._fn.Particles.applyParticleCollisions(transforms, transformsLen, positionsZ, positionsZLen, particleCount, state, colliders, collidersLen);
#elseif cpp
	flight._cpp._fn.Particles.applyParticleCollisions(transforms, transformsLen, positionsZ, positionsZLen, particleCount, state, colliders, collidersLen);
#elseif (js && flight_esm)
	flight._js._fn.Particles.applyParticleCollisions(transforms, transformsLen, positionsZ, positionsZLen, particleCount, state, colliders, collidersLen);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyParticleObjectCollisions(objects:Dynamic, state:ParticleObjectsState, colliders:Dynamic):Void {
	flight._js._fn.Particles.applyParticleObjectCollisions(objects, state, colliders);
}
#else
extern inline function applyParticleObjectCollisions(objects:Dynamic, objectsLen:Int, state:ParticleObjectsState, colliders:Dynamic, collidersLen:Int):Void {
#if hl
	flight._hl._fn.Particles.applyParticleObjectCollisions(objects, objectsLen, state, colliders, collidersLen);
#elseif cpp
	flight._cpp._fn.Particles.applyParticleObjectCollisions(objects, objectsLen, state, colliders, collidersLen);
#elseif (js && flight_esm)
	flight._js._fn.Particles.applyParticleObjectCollisions(objects, objectsLen, state, colliders, collidersLen);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyParticleForces(transforms:Dynamic, positionsZ:Dynamic, particleCount:Int, state:ParticleEmitterState, forces:Dynamic, deltaTime:Float):Void {
	flight._js._fn.Particles.applyParticleForces(transforms, positionsZ, particleCount, state, forces, deltaTime);
}
#else
extern inline function applyParticleForces(transforms:Dynamic, transformsLen:Int, positionsZ:Dynamic, positionsZLen:Int, particleCount:Int, state:ParticleEmitterState, forces:Dynamic, forcesLen:Int, deltaTime:Float):Void {
#if hl
	flight._hl._fn.Particles.applyParticleForces(transforms, transformsLen, positionsZ, positionsZLen, particleCount, state, forces, forcesLen, deltaTime);
#elseif cpp
	flight._cpp._fn.Particles.applyParticleForces(transforms, transformsLen, positionsZ, positionsZLen, particleCount, state, forces, forcesLen, deltaTime);
#elseif (js && flight_esm)
	flight._js._fn.Particles.applyParticleForces(transforms, transformsLen, positionsZ, positionsZLen, particleCount, state, forces, forcesLen, deltaTime);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyParticleObjectForces(objects:Dynamic, state:ParticleObjectsState, forces:Dynamic, deltaTime:Float):Void {
	flight._js._fn.Particles.applyParticleObjectForces(objects, state, forces, deltaTime);
}
#else
extern inline function applyParticleObjectForces(objects:Dynamic, objectsLen:Int, state:ParticleObjectsState, forces:Dynamic, forcesLen:Int, deltaTime:Float):Void {
#if hl
	flight._hl._fn.Particles.applyParticleObjectForces(objects, objectsLen, state, forces, forcesLen, deltaTime);
#elseif cpp
	flight._cpp._fn.Particles.applyParticleObjectForces(objects, objectsLen, state, forces, forcesLen, deltaTime);
#elseif (js && flight_esm)
	flight._js._fn.Particles.applyParticleObjectForces(objects, objectsLen, state, forces, forcesLen, deltaTime);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function buildParticleCurve(out:Dynamic, f:Dynamic, samples:Int):Void {
	flight._js._fn.Particles.buildParticleCurve(out, f, samples);
}
#else
extern inline function buildParticleCurve(out:Dynamic, fFn:Dynamic, fCtx:Dynamic, samples:Int):Void {
#if hl
	flight._hl._fn.Particles.buildParticleCurve(out, fFn, fCtx, samples);
#elseif cpp
	flight._cpp._fn.Particles.buildParticleCurve(out, fFn, fCtx, samples);
#elseif (js && flight_esm)
	flight._js._fn.Particles.buildParticleCurve(out, fFn, fCtx, samples);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function lerpHsvDirect(out:Dynamic, offset:Int, r0:Float, g0:Float, b0:Float, r1:Float, g1:Float, b1:Float, t:Float):Void {
	flight._js._fn.Particles.lerpHsvDirect(out, offset, r0, g0, b0, r1, g1, b1, t);
}
#else
extern inline function lerpHsvDirect(out:Dynamic, outLen:Int, offset:Int, r0:Float, g0:Float, b0:Float, r1:Float, g1:Float, b1:Float, t:Float):Void {
#if hl
	flight._hl._fn.Particles.lerpHsvDirect(out, outLen, offset, r0, g0, b0, r1, g1, b1, t);
#elseif cpp
	flight._cpp._fn.Particles.lerpHsvDirect(out, outLen, offset, r0, g0, b0, r1, g1, b1, t);
#elseif (js && flight_esm)
	flight._js._fn.Particles.lerpHsvDirect(out, outLen, offset, r0, g0, b0, r1, g1, b1, t);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function lerpHsvInPlace(colorsOut:Dynamic, offset:Int, birth:Dynamic, death:Dynamic, t:Float):Void {
	flight._js._fn.Particles.lerpHsvInPlace(colorsOut, offset, birth, death, t);
}
#else
extern inline function lerpHsvInPlace(colorsOut:Dynamic, colorsOutLen:Int, offset:Int, birth:Dynamic, birthLen:Int, death:Dynamic, deathLen:Int, t:Float):Void {
#if hl
	flight._hl._fn.Particles.lerpHsvInPlace(colorsOut, colorsOutLen, offset, birth, birthLen, death, deathLen, t);
#elseif cpp
	flight._cpp._fn.Particles.lerpHsvInPlace(colorsOut, colorsOutLen, offset, birth, birthLen, death, deathLen, t);
#elseif (js && flight_esm)
	flight._js._fn.Particles.lerpHsvInPlace(colorsOut, colorsOutLen, offset, birth, birthLen, death, deathLen, t);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function particleColorCurveFromKeyframes(out:Dynamic, keys:Dynamic, samples:Int):Void {
	flight._js._fn.Particles.particleColorCurveFromKeyframes(out, keys, samples);
}
#else
extern inline function particleColorCurveFromKeyframes(out:Dynamic, keys:Dynamic, keysLen:Int, samples:Int):Void {
#if hl
	flight._hl._fn.Particles.particleColorCurveFromKeyframes(out, keys, keysLen, samples);
#elseif cpp
	flight._cpp._fn.Particles.particleColorCurveFromKeyframes(out, keys, keysLen, samples);
#elseif (js && flight_esm)
	flight._js._fn.Particles.particleColorCurveFromKeyframes(out, keys, keysLen, samples);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function particleColorCurveToKeyframes(out:Dynamic, lut:Dynamic):Void {
	flight._js._fn.Particles.particleColorCurveToKeyframes(out, lut);
}
#else
extern inline function particleColorCurveToKeyframes(out:Dynamic, lut:Dynamic, lutLen:Int):Void {
#if hl
	flight._hl._fn.Particles.particleColorCurveToKeyframes(out, lut, lutLen);
#elseif cpp
	flight._cpp._fn.Particles.particleColorCurveToKeyframes(out, lut, lutLen);
#elseif (js && flight_esm)
	flight._js._fn.Particles.particleColorCurveToKeyframes(out, lut, lutLen);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function particleCurveFromKeyframes(out:Dynamic, keys:Dynamic, samples:Int):Void {
	flight._js._fn.Particles.particleCurveFromKeyframes(out, keys, samples);
}
#else
extern inline function particleCurveFromKeyframes(out:Dynamic, keys:Dynamic, keysLen:Int, samples:Int):Void {
#if hl
	flight._hl._fn.Particles.particleCurveFromKeyframes(out, keys, keysLen, samples);
#elseif cpp
	flight._cpp._fn.Particles.particleCurveFromKeyframes(out, keys, keysLen, samples);
#elseif (js && flight_esm)
	flight._js._fn.Particles.particleCurveFromKeyframes(out, keys, keysLen, samples);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function particleCurveToKeyframes(out:Dynamic, lut:Dynamic):Void {
	flight._js._fn.Particles.particleCurveToKeyframes(out, lut);
}
#else
extern inline function particleCurveToKeyframes(out:Dynamic, lut:Dynamic, lutLen:Int):Void {
#if hl
	flight._hl._fn.Particles.particleCurveToKeyframes(out, lut, lutLen);
#elseif cpp
	flight._cpp._fn.Particles.particleCurveToKeyframes(out, lut, lutLen);
#elseif (js && flight_esm)
	flight._js._fn.Particles.particleCurveToKeyframes(out, lut, lutLen);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function sampleParticleColorCurve(out:Dynamic, offset:Int, lut:Dynamic, t:Float):Void {
	flight._js._fn.Particles.sampleParticleColorCurve(out, offset, lut, t);
}
#else
extern inline function sampleParticleColorCurve(out:Dynamic, outLen:Int, offset:Int, lut:Dynamic, lutLen:Int, t:Float):Void {
#if hl
	flight._hl._fn.Particles.sampleParticleColorCurve(out, outLen, offset, lut, lutLen, t);
#elseif cpp
	flight._cpp._fn.Particles.sampleParticleColorCurve(out, outLen, offset, lut, lutLen, t);
#elseif (js && flight_esm)
	flight._js._fn.Particles.sampleParticleColorCurve(out, outLen, offset, lut, lutLen, t);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function sampleParticleCurve(lut:Dynamic, t:Float):Float {
	return flight._js._fn.Particles.sampleParticleCurve(lut, t);
}
#else
extern inline function sampleParticleCurve(lut:Dynamic, lutLen:Int, t:Float):Float {
#if hl
	return flight._hl._fn.Particles.sampleParticleCurve(lut, lutLen, t);
#elseif cpp
	return flight._cpp._fn.Particles.sampleParticleCurve(lut, lutLen, t);
#elseif (js && flight_esm)
	return flight._js._fn.Particles.sampleParticleCurve(lut, lutLen, t);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createParticleEmitterConfig(config:Null<ParticleEmitterConfigOptions>):ParticleEmitterConfig {
	return flight._js._fn.Particles.createParticleEmitterConfig(config);
}
#else
extern inline function createParticleEmitterConfig(config:ParticleEmitterConfigOptions):ParticleEmitterConfig {
#if hl
	return flight._hl._fn.Particles.createParticleEmitterConfig(config);
#elseif cpp
	return flight._cpp._fn.Particles.createParticleEmitterConfig(config);
#elseif (js && flight_esm)
	return flight._js._fn.Particles.createParticleEmitterConfig(config);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableParticleEmitterSignals(state:ParticleEmitterState):ParticleEmitterSignals {
	return flight._js._fn.Particles.enableParticleEmitterSignals(state);
}
#else
extern inline function enableParticleEmitterSignals(state:ParticleEmitterState):ParticleEmitterSignals {
#if hl
	return flight._hl._fn.Particles.enableParticleEmitterSignals(state);
#elseif cpp
	return flight._cpp._fn.Particles.enableParticleEmitterSignals(state);
#elseif (js && flight_esm)
	return flight._js._fn.Particles.enableParticleEmitterSignals(state);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getParticleEmitterSignals(state:ParticleEmitterState):Null<ParticleEmitterSignals> {
	return flight._js._fn.Particles.getParticleEmitterSignals(state);
}
#else
extern inline function getParticleEmitterSignals(state:ParticleEmitterState):ParticleEmitterSignals {
#if hl
	return flight._hl._fn.Particles.getParticleEmitterSignals(state);
#elseif cpp
	return flight._cpp._fn.Particles.getParticleEmitterSignals(state);
#elseif (js && flight_esm)
	return flight._js._fn.Particles.getParticleEmitterSignals(state);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createParticleEmitterState():ParticleEmitterState {
	return flight._js._fn.Particles.createParticleEmitterState();
}
#else
extern inline function createParticleEmitterState():ParticleEmitterState {
#if hl
	return flight._hl._fn.Particles.createParticleEmitterState();
#elseif cpp
	return flight._cpp._fn.Particles.createParticleEmitterState();
#elseif (js && flight_esm)
	return flight._js._fn.Particles.createParticleEmitterState();
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createParticleObjectsState():ParticleObjectsState {
	return flight._js._fn.Particles.createParticleObjectsState();
}
#else
extern inline function createParticleObjectsState():ParticleObjectsState {
#if hl
	return flight._hl._fn.Particles.createParticleObjectsState();
#elseif cpp
	return flight._cpp._fn.Particles.createParticleObjectsState();
#elseif (js && flight_esm)
	return flight._js._fn.Particles.createParticleObjectsState();
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function stepParticleObjects(objects:Dynamic, state:ParticleObjectsState, config:ParticleEmitterConfig, deltaTime:Float, forces:Null<Dynamic>, colliders:Null<Dynamic>, updateOptions:Null<ParticleObjectsUpdateOptions>):Void {
	flight._js._fn.Particles.stepParticleObjects(objects, state, config, deltaTime, forces, colliders, updateOptions);
}
#else
extern inline function stepParticleObjects(objects:Dynamic, objectsLen:Int, state:ParticleObjectsState, config:ParticleEmitterConfig, deltaTime:Float, forces:Dynamic, forcesLen:Int, colliders:Dynamic, collidersLen:Int, updateOptions:ParticleObjectsUpdateOptions):Void {
#if hl
	flight._hl._fn.Particles.stepParticleObjects(objects, objectsLen, state, config, deltaTime, forces, forcesLen, colliders, collidersLen, updateOptions);
#elseif cpp
	flight._cpp._fn.Particles.stepParticleObjects(objects, objectsLen, state, config, deltaTime, forces, forcesLen, colliders, collidersLen, updateOptions);
#elseif (js && flight_esm)
	flight._js._fn.Particles.stepParticleObjects(objects, objectsLen, state, config, deltaTime, forces, forcesLen, colliders, collidersLen, updateOptions);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isParticleObjectsComplete(objects:Dynamic, state:ParticleObjectsState, config:ParticleEmitterConfig):Bool {
	return flight._js._fn.Particles.isParticleObjectsComplete(objects, state, config);
}
#else
extern inline function isParticleObjectsComplete(objects:Dynamic, objectsLen:Int, state:ParticleObjectsState, config:ParticleEmitterConfig):Bool {
#if hl
	return flight._hl._fn.Particles.isParticleObjectsComplete(objects, objectsLen, state, config);
#elseif cpp
	return flight._cpp._fn.Particles.isParticleObjectsComplete(objects, objectsLen, state, config);
#elseif (js && flight_esm)
	return flight._js._fn.Particles.isParticleObjectsComplete(objects, objectsLen, state, config);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updateParticleObjects(objects:Dynamic, state:ParticleObjectsState, config:ParticleEmitterConfig, deltaTime:Float, options:Null<ParticleObjectsUpdateOptions>):Void {
	flight._js._fn.Particles.updateParticleObjects(objects, state, config, deltaTime, options);
}
#else
extern inline function updateParticleObjects(objects:Dynamic, objectsLen:Int, state:ParticleObjectsState, config:ParticleEmitterConfig, deltaTime:Float, options:ParticleObjectsUpdateOptions):Void {
#if hl
	flight._hl._fn.Particles.updateParticleObjects(objects, objectsLen, state, config, deltaTime, options);
#elseif cpp
	flight._cpp._fn.Particles.updateParticleObjects(objects, objectsLen, state, config, deltaTime, options);
#elseif (js && flight_esm)
	flight._js._fn.Particles.updateParticleObjects(objects, objectsLen, state, config, deltaTime, options);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function normalizeParticleEmitterConfig(config:Null<ParticleEmitterConfig>):ParticleEmitterConfig {
	return flight._js._fn.Particles.normalizeParticleEmitterConfig(config);
}
#else
extern inline function normalizeParticleEmitterConfig(config:ParticleEmitterConfig):ParticleEmitterConfig {
#if hl
	return flight._hl._fn.Particles.normalizeParticleEmitterConfig(config);
#elseif cpp
	return flight._cpp._fn.Particles.normalizeParticleEmitterConfig(config);
#elseif (js && flight_esm)
	return flight._js._fn.Particles.normalizeParticleEmitterConfig(config);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function validateParticleEmitterConfig(out:Dynamic, config:ParticleEmitterConfig):Void {
	flight._js._fn.Particles.validateParticleEmitterConfig(out, config);
}
#else
extern inline function validateParticleEmitterConfig(out:Dynamic, config:ParticleEmitterConfig):Void {
#if hl
	flight._hl._fn.Particles.validateParticleEmitterConfig(out, config);
#elseif cpp
	flight._cpp._fn.Particles.validateParticleEmitterConfig(out, config);
#elseif (js && flight_esm)
	flight._js._fn.Particles.validateParticleEmitterConfig(out, config);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeParticleEmitterConfig(ptr:ParticleEmitterConfig):Void {
	flight._js._fn.Particles.freeParticleEmitterConfig(ptr);
}
#else
extern inline function freeParticleEmitterConfig(ptr:ParticleEmitterConfig):Void {
#if hl
	flight._hl._fn.Particles.freeParticleEmitterConfig(ptr);
#elseif cpp
	flight._cpp._fn.Particles.freeParticleEmitterConfig(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Particles.freeParticleEmitterConfig(ptr);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeParticleEmitterSignals(ptr:ParticleEmitterSignals):Void {
	flight._js._fn.Particles.freeParticleEmitterSignals(ptr);
}
#else
extern inline function freeParticleEmitterSignals(ptr:ParticleEmitterSignals):Void {
#if hl
	flight._hl._fn.Particles.freeParticleEmitterSignals(ptr);
#elseif cpp
	flight._cpp._fn.Particles.freeParticleEmitterSignals(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Particles.freeParticleEmitterSignals(ptr);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeParticleEmitterState(ptr:ParticleEmitterState):Void {
	flight._js._fn.Particles.freeParticleEmitterState(ptr);
}
#else
extern inline function freeParticleEmitterState(ptr:ParticleEmitterState):Void {
#if hl
	flight._hl._fn.Particles.freeParticleEmitterState(ptr);
#elseif cpp
	flight._cpp._fn.Particles.freeParticleEmitterState(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Particles.freeParticleEmitterState(ptr);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeParticleObjectsState(ptr:ParticleObjectsState):Void {
	flight._js._fn.Particles.freeParticleObjectsState(ptr);
}
#else
extern inline function freeParticleObjectsState(ptr:ParticleObjectsState):Void {
#if hl
	flight._hl._fn.Particles.freeParticleObjectsState(ptr);
#elseif cpp
	flight._cpp._fn.Particles.freeParticleObjectsState(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Particles.freeParticleObjectsState(ptr);
#else
	#error "flight.Particles: no backend for this target."
#end
}
#end
