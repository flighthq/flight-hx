package flight;

inline function createQuadBatch():Dynamic {
#if hl
	return flight._hl._fn.Quadbatch.createQuadBatch();
#elseif cpp
	return flight._cpp._fn.Quadbatch.createQuadBatch();
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.createQuadBatch();
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function createQuadBatchData():QuadBatchData {
#if hl
	return flight._hl._fn.Quadbatch.createQuadBatchData();
#elseif cpp
	return flight._cpp._fn.Quadbatch.createQuadBatchData();
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.createQuadBatchData();
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function createQuadBatchRuntime():Node2DRuntime {
#if hl
	return flight._hl._fn.Quadbatch.createQuadBatchRuntime();
#elseif cpp
	return flight._cpp._fn.Quadbatch.createQuadBatchRuntime();
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.createQuadBatchRuntime();
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function createQuadBatchSignals():Dynamic {
#if hl
	return flight._hl._fn.Quadbatch.createQuadBatchSignals();
#elseif cpp
	return flight._cpp._fn.Quadbatch.createQuadBatchSignals();
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.createQuadBatchSignals();
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function appendQuadBatchInstance(target:QuadBatch, id:Int, x:Float, y:Float):Int {
#if hl
	return flight._hl._fn.Quadbatch.appendQuadBatchInstance(target, id, x, y);
#elseif cpp
	return flight._cpp._fn.Quadbatch.appendQuadBatchInstance(target, id, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.appendQuadBatchInstance(target, id, x, y);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function clearQuadBatch(target:QuadBatch):Void {
#if hl
	flight._hl._fn.Quadbatch.clearQuadBatch(target);
#elseif cpp
	flight._cpp._fn.Quadbatch.clearQuadBatch(target);
#elseif (js && flight_esm)
	flight._js._fn.Quadbatch.clearQuadBatch(target);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function cloneQuadBatch(source:QuadBatch):Dynamic {
#if hl
	return flight._hl._fn.Quadbatch.cloneQuadBatch(source);
#elseif cpp
	return flight._cpp._fn.Quadbatch.cloneQuadBatch(source);
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.cloneQuadBatch(source);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function compactQuadBatch(target:QuadBatch):Void {
#if hl
	flight._hl._fn.Quadbatch.compactQuadBatch(target);
#elseif cpp
	flight._cpp._fn.Quadbatch.compactQuadBatch(target);
#elseif (js && flight_esm)
	flight._js._fn.Quadbatch.compactQuadBatch(target);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function computeQuadBatchLocalBoundsRectangle(out:Rectangle, source:QuadBatch):Void {
#if hl
	flight._hl._fn.Quadbatch.computeQuadBatchLocalBoundsRectangle(out, source);
#elseif cpp
	flight._cpp._fn.Quadbatch.computeQuadBatchLocalBoundsRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Quadbatch.computeQuadBatchLocalBoundsRectangle(out, source);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function enableQuadBatchSignals(target:QuadBatch):Dynamic {
#if hl
	return flight._hl._fn.Quadbatch.enableQuadBatchSignals(target);
#elseif cpp
	return flight._cpp._fn.Quadbatch.enableQuadBatchSignals(target);
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.enableQuadBatchSignals(target);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function getQuadBatchCapacity(source:QuadBatch):Int {
#if hl
	return flight._hl._fn.Quadbatch.getQuadBatchCapacity(source);
#elseif cpp
	return flight._cpp._fn.Quadbatch.getQuadBatchCapacity(source);
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.getQuadBatchCapacity(source);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function getQuadBatchInstanceId(source:QuadBatch, index:Int):Int {
#if hl
	return flight._hl._fn.Quadbatch.getQuadBatchInstanceId(source, index);
#elseif cpp
	return flight._cpp._fn.Quadbatch.getQuadBatchInstanceId(source, index);
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.getQuadBatchInstanceId(source, index);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function getQuadBatchInstanceTransform(out:Vector2, source:QuadBatch, index:Int):Bool {
#if hl
	return flight._hl._fn.Quadbatch.getQuadBatchInstanceTransform(out, source, index);
#elseif cpp
	return flight._cpp._fn.Quadbatch.getQuadBatchInstanceTransform(out, source, index);
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.getQuadBatchInstanceTransform(out, source, index);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function getQuadBatchRuntime(source:QuadBatch):Dynamic {
#if hl
	return flight._hl._fn.Quadbatch.getQuadBatchRuntime(source);
#elseif cpp
	return flight._cpp._fn.Quadbatch.getQuadBatchRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.getQuadBatchRuntime(source);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function getQuadBatchSignals(source:QuadBatch):Dynamic {
#if hl
	return flight._hl._fn.Quadbatch.getQuadBatchSignals(source);
#elseif cpp
	return flight._cpp._fn.Quadbatch.getQuadBatchSignals(source);
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.getQuadBatchSignals(source);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function getQuadBatchTransformStride(transformType:flight.QuadTransformType):Int {
#if hl
	return flight._hl._fn.Quadbatch.getQuadBatchTransformStride(transformType);
#elseif cpp
	return flight._cpp._fn.Quadbatch.getQuadBatchTransformStride(transformType);
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.getQuadBatchTransformStride(transformType);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function hitTestQuadBatchPoint(source:QuadBatch, point:Vector2):Int {
#if hl
	return flight._hl._fn.Quadbatch.hitTestQuadBatchPoint(source, point);
#elseif cpp
	return flight._cpp._fn.Quadbatch.hitTestQuadBatchPoint(source, point);
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.hitTestQuadBatchPoint(source, point);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function hitTestQuadBatchPointExact(source:QuadBatch, point:Vector2):Int {
#if hl
	return flight._hl._fn.Quadbatch.hitTestQuadBatchPointExact(source, point);
#elseif cpp
	return flight._cpp._fn.Quadbatch.hitTestQuadBatchPointExact(source, point);
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.hitTestQuadBatchPointExact(source, point);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function hitTestQuadBatchPointExactXy(source:QuadBatch, x:Float, y:Float):Int {
#if hl
	return flight._hl._fn.Quadbatch.hitTestQuadBatchPointExactXy(source, x, y);
#elseif cpp
	return flight._cpp._fn.Quadbatch.hitTestQuadBatchPointExactXy(source, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.hitTestQuadBatchPointExactXy(source, x, y);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function hitTestQuadBatchPointXy(source:QuadBatch, x:Float, y:Float):Int {
#if hl
	return flight._hl._fn.Quadbatch.hitTestQuadBatchPointXy(source, x, y);
#elseif cpp
	return flight._cpp._fn.Quadbatch.hitTestQuadBatchPointXy(source, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Quadbatch.hitTestQuadBatchPointXy(source, x, y);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function iterateQuadBatchInstances(source:QuadBatch, visitorFn:Dynamic, visitorCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Quadbatch.iterateQuadBatchInstances(source, visitorFn, visitorCtx);
#elseif cpp
	flight._cpp._fn.Quadbatch.iterateQuadBatchInstances(source, visitorFn, visitorCtx);
#elseif (js && flight_esm)
	flight._js._fn.Quadbatch.iterateQuadBatchInstances(source, visitorFn, visitorCtx);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function removeQuadBatchInstance(target:QuadBatch, index:Int):Void {
#if hl
	flight._hl._fn.Quadbatch.removeQuadBatchInstance(target, index);
#elseif cpp
	flight._cpp._fn.Quadbatch.removeQuadBatchInstance(target, index);
#elseif (js && flight_esm)
	flight._js._fn.Quadbatch.removeQuadBatchInstance(target, index);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function reserveQuadBatch(target:QuadBatch, capacity:Int):Void {
#if hl
	flight._hl._fn.Quadbatch.reserveQuadBatch(target, capacity);
#elseif cpp
	flight._cpp._fn.Quadbatch.reserveQuadBatch(target, capacity);
#elseif (js && flight_esm)
	flight._js._fn.Quadbatch.reserveQuadBatch(target, capacity);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function resizeQuadBatch(target:QuadBatch, instanceCount:Int):Void {
#if hl
	flight._hl._fn.Quadbatch.resizeQuadBatch(target, instanceCount);
#elseif cpp
	flight._cpp._fn.Quadbatch.resizeQuadBatch(target, instanceCount);
#elseif (js && flight_esm)
	flight._js._fn.Quadbatch.resizeQuadBatch(target, instanceCount);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function setQuadBatchInstance(target:QuadBatch, index:Int, id:Int, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Quadbatch.setQuadBatchInstance(target, index, id, x, y);
#elseif cpp
	flight._cpp._fn.Quadbatch.setQuadBatchInstance(target, index, id, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Quadbatch.setQuadBatchInstance(target, index, id, x, y);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function setQuadBatchInstanceMatrix(target:QuadBatch, index:Int, id:Int, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void {
#if hl
	flight._hl._fn.Quadbatch.setQuadBatchInstanceMatrix(target, index, id, a, b, c, d, tx, ty);
#elseif cpp
	flight._cpp._fn.Quadbatch.setQuadBatchInstanceMatrix(target, index, id, a, b, c, d, tx, ty);
#elseif (js && flight_esm)
	flight._js._fn.Quadbatch.setQuadBatchInstanceMatrix(target, index, id, a, b, c, d, tx, ty);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function setQuadBatchInstanceRange(target:QuadBatch, startIndex:Int, count:Int, source:Dynamic, sourceLen:Int):Void {
#if hl
	flight._hl._fn.Quadbatch.setQuadBatchInstanceRange(target, startIndex, count, source, sourceLen);
#elseif cpp
	flight._cpp._fn.Quadbatch.setQuadBatchInstanceRange(target, startIndex, count, source, sourceLen);
#elseif (js && flight_esm)
	flight._js._fn.Quadbatch.setQuadBatchInstanceRange(target, startIndex, count, source, sourceLen);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function setQuadBatchInstanceTint(target:QuadBatch, index:Int, rgba:Int):Void {
#if hl
	flight._hl._fn.Quadbatch.setQuadBatchInstanceTint(target, index, rgba);
#elseif cpp
	flight._cpp._fn.Quadbatch.setQuadBatchInstanceTint(target, index, rgba);
#elseif (js && flight_esm)
	flight._js._fn.Quadbatch.setQuadBatchInstanceTint(target, index, rgba);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function setQuadBatchLocalBoundsRectangle(target:Dynamic, rect:Rectangle):Void {
#if hl
	flight._hl._fn.Quadbatch.setQuadBatchLocalBoundsRectangle(target, rect);
#elseif cpp
	flight._cpp._fn.Quadbatch.setQuadBatchLocalBoundsRectangle(target, rect);
#elseif (js && flight_esm)
	flight._js._fn.Quadbatch.setQuadBatchLocalBoundsRectangle(target, rect);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function setQuadBatchTransformType(target:QuadBatch, newType:flight.QuadTransformType):Void {
#if hl
	flight._hl._fn.Quadbatch.setQuadBatchTransformType(target, newType);
#elseif cpp
	flight._cpp._fn.Quadbatch.setQuadBatchTransformType(target, newType);
#elseif (js && flight_esm)
	flight._js._fn.Quadbatch.setQuadBatchTransformType(target, newType);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
inline function freeQuadBatchData(ptr:QuadBatchData):Void {
#if hl
	flight._hl._fn.Quadbatch.freeQuadBatchData(ptr);
#elseif cpp
	flight._cpp._fn.Quadbatch.freeQuadBatchData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Quadbatch.freeQuadBatchData(ptr);
#else
	#error "flight.Quadbatch: no backend for this target."
#end
}
