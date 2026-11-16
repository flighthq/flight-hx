package flight;

extern inline function createParticleEmitterData():ParticleEmitterData {
#if hl
	return flight._hl._fn.Particleemitter.createParticleEmitterData();
#elseif cpp
	return flight._cpp._fn.Particleemitter.createParticleEmitterData();
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.createParticleEmitterData();
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function computeParticleEmitter2dLocalBoundsRectangle(out:Rectangle, source:ParticleEmitter2D):Void {
#if hl
	flight._hl._fn.Particleemitter.computeParticleEmitter2dLocalBoundsRectangle(out, source);
#elseif cpp
	flight._cpp._fn.Particleemitter.computeParticleEmitter2dLocalBoundsRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.computeParticleEmitter2dLocalBoundsRectangle(out, source);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function createParticleEmitter2d():Dynamic {
#if hl
	return flight._hl._fn.Particleemitter.createParticleEmitter2d();
#elseif cpp
	return flight._cpp._fn.Particleemitter.createParticleEmitter2d();
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.createParticleEmitter2d();
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function createParticleEmitter2dRuntime():Node2DRuntime {
#if hl
	return flight._hl._fn.Particleemitter.createParticleEmitter2dRuntime();
#elseif cpp
	return flight._cpp._fn.Particleemitter.createParticleEmitter2dRuntime();
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.createParticleEmitter2dRuntime();
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function createParticleEmitter3d():Dynamic {
#if hl
	return flight._hl._fn.Particleemitter.createParticleEmitter3d();
#elseif cpp
	return flight._cpp._fn.Particleemitter.createParticleEmitter3d();
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.createParticleEmitter3d();
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function appendParticleEmitter2dParticle(target:Dynamic, id:Int, x:Float, y:Float, rotation:Float, scale:Float):Int {
#if hl
	return flight._hl._fn.Particleemitter.appendParticleEmitter2dParticle(target, id, x, y, rotation, scale);
#elseif cpp
	return flight._cpp._fn.Particleemitter.appendParticleEmitter2dParticle(target, id, x, y, rotation, scale);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.appendParticleEmitter2dParticle(target, id, x, y, rotation, scale);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function clearParticleEmitter2d(target:Dynamic):Void {
#if hl
	flight._hl._fn.Particleemitter.clearParticleEmitter2d(target);
#elseif cpp
	flight._cpp._fn.Particleemitter.clearParticleEmitter2d(target);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.clearParticleEmitter2d(target);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function cloneParticleEmitter2d(source:ParticleEmitter2D):Dynamic {
#if hl
	return flight._hl._fn.Particleemitter.cloneParticleEmitter2d(source);
#elseif cpp
	return flight._cpp._fn.Particleemitter.cloneParticleEmitter2d(source);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.cloneParticleEmitter2d(source);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function cloneParticleEmitter3d(source:ParticleEmitter3D):Dynamic {
#if hl
	return flight._hl._fn.Particleemitter.cloneParticleEmitter3d(source);
#elseif cpp
	return flight._cpp._fn.Particleemitter.cloneParticleEmitter3d(source);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.cloneParticleEmitter3d(source);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function compactParticleEmitter2d(target:Dynamic):Void {
#if hl
	flight._hl._fn.Particleemitter.compactParticleEmitter2d(target);
#elseif cpp
	flight._cpp._fn.Particleemitter.compactParticleEmitter2d(target);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.compactParticleEmitter2d(target);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function emitParticleBurst2d(emitter:Dynamic, state:ParticleEmitterState, config:ParticleEmitterConfig, count:Float, x:Float, y:Float, tint:haxe.Int64):Int {
#if hl
	return flight._hl._fn.Particleemitter.emitParticleBurst2d(emitter, state, config, count, x, y, tint);
#elseif cpp
	return flight._cpp._fn.Particleemitter.emitParticleBurst2d(emitter, state, config, count, x, y, tint);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.emitParticleBurst2d(emitter, state, config, count, x, y, tint);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function getParticleEmitter2dCapacity(source:Dynamic):Int {
#if hl
	return flight._hl._fn.Particleemitter.getParticleEmitter2dCapacity(source);
#elseif cpp
	return flight._cpp._fn.Particleemitter.getParticleEmitter2dCapacity(source);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.getParticleEmitter2dCapacity(source);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function getParticleEmitter2dParticleAlpha(source:Dynamic, index:Int):Float {
#if hl
	return flight._hl._fn.Particleemitter.getParticleEmitter2dParticleAlpha(source, index);
#elseif cpp
	return flight._cpp._fn.Particleemitter.getParticleEmitter2dParticleAlpha(source, index);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.getParticleEmitter2dParticleAlpha(source, index);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function getParticleEmitter2dParticleId(source:Dynamic, index:Int):Int {
#if hl
	return flight._hl._fn.Particleemitter.getParticleEmitter2dParticleId(source, index);
#elseif cpp
	return flight._cpp._fn.Particleemitter.getParticleEmitter2dParticleId(source, index);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.getParticleEmitter2dParticleId(source, index);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function getParticleEmitter2dParticleVelocity(out:Vector2, source:Dynamic, index:Int):Bool {
#if hl
	return flight._hl._fn.Particleemitter.getParticleEmitter2dParticleVelocity(out, source, index);
#elseif cpp
	return flight._cpp._fn.Particleemitter.getParticleEmitter2dParticleVelocity(out, source, index);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.getParticleEmitter2dParticleVelocity(out, source, index);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function getParticleEmitter2dRuntime(source:ParticleEmitter2D):ParticleEmitter2DRuntime {
#if hl
	return flight._hl._fn.Particleemitter.getParticleEmitter2dRuntime(source);
#elseif cpp
	return flight._cpp._fn.Particleemitter.getParticleEmitter2dRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.getParticleEmitter2dRuntime(source);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function getParticleEmitter3dRuntime(source:Dynamic):Node3DRuntime {
#if hl
	return flight._hl._fn.Particleemitter.getParticleEmitter3dRuntime(source);
#elseif cpp
	return flight._cpp._fn.Particleemitter.getParticleEmitter3dRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.getParticleEmitter3dRuntime(source);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function isParticleEmitter3d(node:Dynamic):Bool {
#if hl
	return flight._hl._fn.Particleemitter.isParticleEmitter3d(node);
#elseif cpp
	return flight._cpp._fn.Particleemitter.isParticleEmitter3d(node);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.isParticleEmitter3d(node);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function removeParticleEmitter2dParticle(target:Dynamic, index:Int):Void {
#if hl
	flight._hl._fn.Particleemitter.removeParticleEmitter2dParticle(target, index);
#elseif cpp
	flight._cpp._fn.Particleemitter.removeParticleEmitter2dParticle(target, index);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.removeParticleEmitter2dParticle(target, index);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function reserveParticleEmitter2d(target:Dynamic, capacity:Int):Void {
#if hl
	flight._hl._fn.Particleemitter.reserveParticleEmitter2d(target, capacity);
#elseif cpp
	flight._cpp._fn.Particleemitter.reserveParticleEmitter2d(target, capacity);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.reserveParticleEmitter2d(target, capacity);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function setParticleEmitter2dLocalBoundsRectangle(target:Dynamic, rect:Rectangle):Void {
#if hl
	flight._hl._fn.Particleemitter.setParticleEmitter2dLocalBoundsRectangle(target, rect);
#elseif cpp
	flight._cpp._fn.Particleemitter.setParticleEmitter2dLocalBoundsRectangle(target, rect);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.setParticleEmitter2dLocalBoundsRectangle(target, rect);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function setParticleEmitter2dParticle(target:Dynamic, index:Int, id:Int, x:Float, y:Float, rotation:Float, scale:Float):Void {
#if hl
	flight._hl._fn.Particleemitter.setParticleEmitter2dParticle(target, index, id, x, y, rotation, scale);
#elseif cpp
	flight._cpp._fn.Particleemitter.setParticleEmitter2dParticle(target, index, id, x, y, rotation, scale);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.setParticleEmitter2dParticle(target, index, id, x, y, rotation, scale);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function setParticleEmitter2dParticleAlpha(target:Dynamic, index:Int, alpha:Float):Void {
#if hl
	flight._hl._fn.Particleemitter.setParticleEmitter2dParticleAlpha(target, index, alpha);
#elseif cpp
	flight._cpp._fn.Particleemitter.setParticleEmitter2dParticleAlpha(target, index, alpha);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.setParticleEmitter2dParticleAlpha(target, index, alpha);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function setParticleEmitter2dParticleColor(target:Dynamic, index:Int, r:Float, g:Float, b:Float):Void {
#if hl
	flight._hl._fn.Particleemitter.setParticleEmitter2dParticleColor(target, index, r, g, b);
#elseif cpp
	flight._cpp._fn.Particleemitter.setParticleEmitter2dParticleColor(target, index, r, g, b);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.setParticleEmitter2dParticleColor(target, index, r, g, b);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function setParticleEmitter2dParticleVelocity(target:Dynamic, index:Int, vx:Float, vy:Float):Void {
#if hl
	flight._hl._fn.Particleemitter.setParticleEmitter2dParticleVelocity(target, index, vx, vy);
#elseif cpp
	flight._cpp._fn.Particleemitter.setParticleEmitter2dParticleVelocity(target, index, vx, vy);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.setParticleEmitter2dParticleVelocity(target, index, vx, vy);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function appendParticleEmitter3dParticle(target:Dynamic, id:Int, x:Float, y:Float, z:Float, rotation:Float, scale:Float):Int {
#if hl
	return flight._hl._fn.Particleemitter.appendParticleEmitter3dParticle(target, id, x, y, z, rotation, scale);
#elseif cpp
	return flight._cpp._fn.Particleemitter.appendParticleEmitter3dParticle(target, id, x, y, z, rotation, scale);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.appendParticleEmitter3dParticle(target, id, x, y, z, rotation, scale);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function clearParticleEmitter3d(target:Dynamic):Void {
#if hl
	flight._hl._fn.Particleemitter.clearParticleEmitter3d(target);
#elseif cpp
	flight._cpp._fn.Particleemitter.clearParticleEmitter3d(target);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.clearParticleEmitter3d(target);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function compactParticleEmitter3d(target:Dynamic):Void {
#if hl
	flight._hl._fn.Particleemitter.compactParticleEmitter3d(target);
#elseif cpp
	flight._cpp._fn.Particleemitter.compactParticleEmitter3d(target);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.compactParticleEmitter3d(target);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function computeParticleEmitter3dLocalBoundsAabb(out:Aabb, source:Dynamic):Void {
#if hl
	flight._hl._fn.Particleemitter.computeParticleEmitter3dLocalBoundsAabb(out, source);
#elseif cpp
	flight._cpp._fn.Particleemitter.computeParticleEmitter3dLocalBoundsAabb(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.computeParticleEmitter3dLocalBoundsAabb(out, source);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function emitParticleBurst3d(emitter:Dynamic, state:ParticleEmitterState, config:ParticleEmitterConfig, count:Float, x:Float, y:Float, z:Float, tint:haxe.Int64):Int {
#if hl
	return flight._hl._fn.Particleemitter.emitParticleBurst3d(emitter, state, config, count, x, y, z, tint);
#elseif cpp
	return flight._cpp._fn.Particleemitter.emitParticleBurst3d(emitter, state, config, count, x, y, z, tint);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.emitParticleBurst3d(emitter, state, config, count, x, y, z, tint);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function getParticleEmitter3dCapacity(source:Dynamic):Int {
#if hl
	return flight._hl._fn.Particleemitter.getParticleEmitter3dCapacity(source);
#elseif cpp
	return flight._cpp._fn.Particleemitter.getParticleEmitter3dCapacity(source);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.getParticleEmitter3dCapacity(source);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function getParticleEmitter3dParticleAlpha(source:Dynamic, index:Int):Float {
#if hl
	return flight._hl._fn.Particleemitter.getParticleEmitter3dParticleAlpha(source, index);
#elseif cpp
	return flight._cpp._fn.Particleemitter.getParticleEmitter3dParticleAlpha(source, index);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.getParticleEmitter3dParticleAlpha(source, index);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function getParticleEmitter3dParticleId(source:Dynamic, index:Int):Int {
#if hl
	return flight._hl._fn.Particleemitter.getParticleEmitter3dParticleId(source, index);
#elseif cpp
	return flight._cpp._fn.Particleemitter.getParticleEmitter3dParticleId(source, index);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.getParticleEmitter3dParticleId(source, index);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function getParticleEmitter3dParticleVelocity(out:Dynamic, source:Dynamic, index:Int):Bool {
#if hl
	return flight._hl._fn.Particleemitter.getParticleEmitter3dParticleVelocity(out, source, index);
#elseif cpp
	return flight._cpp._fn.Particleemitter.getParticleEmitter3dParticleVelocity(out, source, index);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.getParticleEmitter3dParticleVelocity(out, source, index);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function removeParticleEmitter3dParticle(target:Dynamic, index:Int):Void {
#if hl
	flight._hl._fn.Particleemitter.removeParticleEmitter3dParticle(target, index);
#elseif cpp
	flight._cpp._fn.Particleemitter.removeParticleEmitter3dParticle(target, index);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.removeParticleEmitter3dParticle(target, index);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function reserveParticleEmitter3d(target:Dynamic, capacity:Int):Void {
#if hl
	flight._hl._fn.Particleemitter.reserveParticleEmitter3d(target, capacity);
#elseif cpp
	flight._cpp._fn.Particleemitter.reserveParticleEmitter3d(target, capacity);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.reserveParticleEmitter3d(target, capacity);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function setParticleEmitter3dParticle(target:Dynamic, index:Int, id:Int, x:Float, y:Float, z:Float, rotation:Float, scale:Float):Void {
#if hl
	flight._hl._fn.Particleemitter.setParticleEmitter3dParticle(target, index, id, x, y, z, rotation, scale);
#elseif cpp
	flight._cpp._fn.Particleemitter.setParticleEmitter3dParticle(target, index, id, x, y, z, rotation, scale);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.setParticleEmitter3dParticle(target, index, id, x, y, z, rotation, scale);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function setParticleEmitter3dParticleAlpha(target:Dynamic, index:Int, alpha:Float):Void {
#if hl
	flight._hl._fn.Particleemitter.setParticleEmitter3dParticleAlpha(target, index, alpha);
#elseif cpp
	flight._cpp._fn.Particleemitter.setParticleEmitter3dParticleAlpha(target, index, alpha);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.setParticleEmitter3dParticleAlpha(target, index, alpha);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function setParticleEmitter3dParticleColor(target:Dynamic, index:Int, r:Float, g:Float, b:Float):Void {
#if hl
	flight._hl._fn.Particleemitter.setParticleEmitter3dParticleColor(target, index, r, g, b);
#elseif cpp
	flight._cpp._fn.Particleemitter.setParticleEmitter3dParticleColor(target, index, r, g, b);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.setParticleEmitter3dParticleColor(target, index, r, g, b);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function setParticleEmitter3dParticleVelocity(target:Dynamic, index:Int, vx:Float, vy:Float, vz:Float):Void {
#if hl
	flight._hl._fn.Particleemitter.setParticleEmitter3dParticleVelocity(target, index, vx, vy, vz);
#elseif cpp
	flight._cpp._fn.Particleemitter.setParticleEmitter3dParticleVelocity(target, index, vx, vy, vz);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.setParticleEmitter3dParticleVelocity(target, index, vx, vy, vz);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function sortParticleEmitter3dByViewDepth(emitter:Dynamic, viewMatrix:Dynamic):Void {
#if hl
	flight._hl._fn.Particleemitter.sortParticleEmitter3dByViewDepth(emitter, viewMatrix);
#elseif cpp
	flight._cpp._fn.Particleemitter.sortParticleEmitter3dByViewDepth(emitter, viewMatrix);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.sortParticleEmitter3dByViewDepth(emitter, viewMatrix);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function sortParticleEmitter3dIndicesByViewDepth(outIndices:Dynamic, outIndicesLen:Int, outViewDepths:Dynamic, outViewDepthsLen:Int, source:Dynamic, positionToView:Dynamic):Bool {
#if hl
	return flight._hl._fn.Particleemitter.sortParticleEmitter3dIndicesByViewDepth(outIndices, outIndicesLen, outViewDepths, outViewDepthsLen, source, positionToView);
#elseif cpp
	return flight._cpp._fn.Particleemitter.sortParticleEmitter3dIndicesByViewDepth(outIndices, outIndicesLen, outViewDepths, outViewDepthsLen, source, positionToView);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.sortParticleEmitter3dIndicesByViewDepth(outIndices, outIndicesLen, outViewDepths, outViewDepthsLen, source, positionToView);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function prewarmParticleEmitter2d(emitter:Dynamic, state:ParticleEmitterState, config:ParticleEmitterConfig, duration:Float, stepDeltaTime:Float, callbacks:ParticleEmitterCallbacks):Void {
#if hl
	flight._hl._fn.Particleemitter.prewarmParticleEmitter2d(emitter, state, config, duration, stepDeltaTime, callbacks);
#elseif cpp
	flight._cpp._fn.Particleemitter.prewarmParticleEmitter2d(emitter, state, config, duration, stepDeltaTime, callbacks);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.prewarmParticleEmitter2d(emitter, state, config, duration, stepDeltaTime, callbacks);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function prewarmParticleEmitter3d(emitter:Dynamic, state:ParticleEmitterState, config:ParticleEmitterConfig, duration:Float, stepDeltaTime:Float, callbacks:ParticleEmitterCallbacks):Void {
#if hl
	flight._hl._fn.Particleemitter.prewarmParticleEmitter3d(emitter, state, config, duration, stepDeltaTime, callbacks);
#elseif cpp
	flight._cpp._fn.Particleemitter.prewarmParticleEmitter3d(emitter, state, config, duration, stepDeltaTime, callbacks);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.prewarmParticleEmitter3d(emitter, state, config, duration, stepDeltaTime, callbacks);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function stepParticleEmitter2d(emitter:Dynamic, state:ParticleEmitterState, config:ParticleEmitterConfig, deltaTime:Float, forces:Dynamic, forcesLen:Int, colliders:Dynamic, collidersLen:Int, callbacks:ParticleEmitterCallbacks):Void {
#if hl
	flight._hl._fn.Particleemitter.stepParticleEmitter2d(emitter, state, config, deltaTime, forces, forcesLen, colliders, collidersLen, callbacks);
#elseif cpp
	flight._cpp._fn.Particleemitter.stepParticleEmitter2d(emitter, state, config, deltaTime, forces, forcesLen, colliders, collidersLen, callbacks);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.stepParticleEmitter2d(emitter, state, config, deltaTime, forces, forcesLen, colliders, collidersLen, callbacks);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function stepParticleEmitter3d(emitter:Dynamic, state:ParticleEmitterState, config:ParticleEmitterConfig, deltaTime:Float, forces:Dynamic, forcesLen:Int, colliders:Dynamic, collidersLen:Int, callbacks:ParticleEmitterCallbacks):Void {
#if hl
	flight._hl._fn.Particleemitter.stepParticleEmitter3d(emitter, state, config, deltaTime, forces, forcesLen, colliders, collidersLen, callbacks);
#elseif cpp
	flight._cpp._fn.Particleemitter.stepParticleEmitter3d(emitter, state, config, deltaTime, forces, forcesLen, colliders, collidersLen, callbacks);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.stepParticleEmitter3d(emitter, state, config, deltaTime, forces, forcesLen, colliders, collidersLen, callbacks);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function isParticleEmitter2dComplete(emitter:ParticleEmitter2D, state:ParticleEmitterState, config:ParticleEmitterConfig):Bool {
#if hl
	return flight._hl._fn.Particleemitter.isParticleEmitter2dComplete(emitter, state, config);
#elseif cpp
	return flight._cpp._fn.Particleemitter.isParticleEmitter2dComplete(emitter, state, config);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.isParticleEmitter2dComplete(emitter, state, config);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function updateParticleEmitter2d(emitter:Dynamic, state:ParticleEmitterState, config:ParticleEmitterConfig, deltaTime:Float, callbacks:ParticleEmitterCallbacks):Void {
#if hl
	flight._hl._fn.Particleemitter.updateParticleEmitter2d(emitter, state, config, deltaTime, callbacks);
#elseif cpp
	flight._cpp._fn.Particleemitter.updateParticleEmitter2d(emitter, state, config, deltaTime, callbacks);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.updateParticleEmitter2d(emitter, state, config, deltaTime, callbacks);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function isParticleEmitter3dComplete(emitter:ParticleEmitter3D, state:ParticleEmitterState, config:ParticleEmitterConfig):Bool {
#if hl
	return flight._hl._fn.Particleemitter.isParticleEmitter3dComplete(emitter, state, config);
#elseif cpp
	return flight._cpp._fn.Particleemitter.isParticleEmitter3dComplete(emitter, state, config);
#elseif (js && flight_esm)
	return flight._js._fn.Particleemitter.isParticleEmitter3dComplete(emitter, state, config);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function updateParticleEmitter3d(emitter:Dynamic, state:ParticleEmitterState, config:ParticleEmitterConfig, deltaTime:Float, callbacks:ParticleEmitterCallbacks):Void {
#if hl
	flight._hl._fn.Particleemitter.updateParticleEmitter3d(emitter, state, config, deltaTime, callbacks);
#elseif cpp
	flight._cpp._fn.Particleemitter.updateParticleEmitter3d(emitter, state, config, deltaTime, callbacks);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.updateParticleEmitter3d(emitter, state, config, deltaTime, callbacks);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function freeParticleEmitterData(ptr:ParticleEmitterData):Void {
#if hl
	flight._hl._fn.Particleemitter.freeParticleEmitterData(ptr);
#elseif cpp
	flight._cpp._fn.Particleemitter.freeParticleEmitterData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.freeParticleEmitterData(ptr);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
extern inline function freeNode2Druntime(ptr:Node2DRuntime):Void {
#if hl
	flight._hl._fn.Particleemitter.freeNode2Druntime(ptr);
#elseif cpp
	flight._cpp._fn.Particleemitter.freeNode2Druntime(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Particleemitter.freeNode2Druntime(ptr);
#else
	#error "flight.Particleemitter: no backend for this target."
#end
}
