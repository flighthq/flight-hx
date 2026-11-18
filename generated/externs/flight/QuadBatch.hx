package flight;

#if hl

typedef QuadBatch = flight._hl.QuadBatch;

#elseif cpp

typedef QuadBatch = flight._cpp.QuadBatch;

#elseif (js && flight_esm)

typedef QuadBatch = flight._js.QuadBatch;

#elseif js

#error "flight.QuadBatch on js requires flight_esm."

#else

#error "flight.QuadBatch: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createQuadBatch():Dynamic {
	return flight._js._fn.QuadBatch.createQuadBatch();
}
#else
extern inline function createQuadBatch():Dynamic {
#if hl
	return flight._hl._fn.QuadBatch.createQuadBatch();
#elseif cpp
	return flight._cpp._fn.QuadBatch.createQuadBatch();
#elseif (js && flight_esm)
	return flight._js._fn.QuadBatch.createQuadBatch();
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendQuadBatchInstance(target:QuadBatch, id:Int, x:Float, y:Float):Int {
	return flight._js._fn.QuadBatch.appendQuadBatchInstance(target, id, x, y);
}
#else
extern inline function appendQuadBatchInstance(target:QuadBatch, id:Int, x:Float, y:Float):Int {
#if hl
	return flight._hl._fn.QuadBatch.appendQuadBatchInstance(target, id, x, y);
#elseif cpp
	return flight._cpp._fn.QuadBatch.appendQuadBatchInstance(target, id, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.QuadBatch.appendQuadBatchInstance(target, id, x, y);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearQuadBatch(target:QuadBatch):Void {
	flight._js._fn.QuadBatch.clearQuadBatch(target);
}
#else
extern inline function clearQuadBatch(target:QuadBatch):Void {
#if hl
	flight._hl._fn.QuadBatch.clearQuadBatch(target);
#elseif cpp
	flight._cpp._fn.QuadBatch.clearQuadBatch(target);
#elseif (js && flight_esm)
	flight._js._fn.QuadBatch.clearQuadBatch(target);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneQuadBatch(source:QuadBatch):Dynamic {
	return flight._js._fn.QuadBatch.cloneQuadBatch(source);
}
#else
extern inline function cloneQuadBatch(source:QuadBatch):Dynamic {
#if hl
	return flight._hl._fn.QuadBatch.cloneQuadBatch(source);
#elseif cpp
	return flight._cpp._fn.QuadBatch.cloneQuadBatch(source);
#elseif (js && flight_esm)
	return flight._js._fn.QuadBatch.cloneQuadBatch(source);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function compactQuadBatch(target:QuadBatch):Void {
	flight._js._fn.QuadBatch.compactQuadBatch(target);
}
#else
extern inline function compactQuadBatch(target:QuadBatch):Void {
#if hl
	flight._hl._fn.QuadBatch.compactQuadBatch(target);
#elseif cpp
	flight._cpp._fn.QuadBatch.compactQuadBatch(target);
#elseif (js && flight_esm)
	flight._js._fn.QuadBatch.compactQuadBatch(target);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeQuadBatchLocalBoundsRectangle(out:Rectangle, source:QuadBatch):Void {
	flight._js._fn.QuadBatch.computeQuadBatchLocalBoundsRectangle(out, source);
}
#else
extern inline function computeQuadBatchLocalBoundsRectangle(out:Rectangle, source:QuadBatch):Void {
#if hl
	flight._hl._fn.QuadBatch.computeQuadBatchLocalBoundsRectangle(out, source);
#elseif cpp
	flight._cpp._fn.QuadBatch.computeQuadBatchLocalBoundsRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.QuadBatch.computeQuadBatchLocalBoundsRectangle(out, source);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableQuadBatchSignals(target:QuadBatch):Dynamic {
	return flight._js._fn.QuadBatch.enableQuadBatchSignals(target);
}
#else
extern inline function enableQuadBatchSignals(target:QuadBatch):Dynamic {
#if hl
	return flight._hl._fn.QuadBatch.enableQuadBatchSignals(target);
#elseif cpp
	return flight._cpp._fn.QuadBatch.enableQuadBatchSignals(target);
#elseif (js && flight_esm)
	return flight._js._fn.QuadBatch.enableQuadBatchSignals(target);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getQuadBatchCapacity(source:QuadBatch):Int {
	return flight._js._fn.QuadBatch.getQuadBatchCapacity(source);
}
#else
extern inline function getQuadBatchCapacity(source:QuadBatch):Int {
#if hl
	return flight._hl._fn.QuadBatch.getQuadBatchCapacity(source);
#elseif cpp
	return flight._cpp._fn.QuadBatch.getQuadBatchCapacity(source);
#elseif (js && flight_esm)
	return flight._js._fn.QuadBatch.getQuadBatchCapacity(source);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getQuadBatchInstanceId(source:QuadBatch, index:Int):Int {
	return flight._js._fn.QuadBatch.getQuadBatchInstanceId(source, index);
}
#else
extern inline function getQuadBatchInstanceId(source:QuadBatch, index:Int):Int {
#if hl
	return flight._hl._fn.QuadBatch.getQuadBatchInstanceId(source, index);
#elseif cpp
	return flight._cpp._fn.QuadBatch.getQuadBatchInstanceId(source, index);
#elseif (js && flight_esm)
	return flight._js._fn.QuadBatch.getQuadBatchInstanceId(source, index);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getQuadBatchInstanceTransform(out:Vector2, source:QuadBatch, index:Int):Bool {
	return flight._js._fn.QuadBatch.getQuadBatchInstanceTransform(out, source, index);
}
#else
extern inline function getQuadBatchInstanceTransform(out:Vector2, source:QuadBatch, index:Int):Bool {
#if hl
	return flight._hl._fn.QuadBatch.getQuadBatchInstanceTransform(out, source, index);
#elseif cpp
	return flight._cpp._fn.QuadBatch.getQuadBatchInstanceTransform(out, source, index);
#elseif (js && flight_esm)
	return flight._js._fn.QuadBatch.getQuadBatchInstanceTransform(out, source, index);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getQuadBatchSignals(source:QuadBatch):Null<Dynamic> {
	return flight._js._fn.QuadBatch.getQuadBatchSignals(source);
}
#else
extern inline function getQuadBatchSignals(source:QuadBatch):Dynamic {
#if hl
	return flight._hl._fn.QuadBatch.getQuadBatchSignals(source);
#elseif cpp
	return flight._cpp._fn.QuadBatch.getQuadBatchSignals(source);
#elseif (js && flight_esm)
	return flight._js._fn.QuadBatch.getQuadBatchSignals(source);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getQuadBatchTransformStride(transformType:Dynamic):Int {
	return flight._js._fn.QuadBatch.getQuadBatchTransformStride(transformType);
}
#else
extern inline function getQuadBatchTransformStride(transformType:flight.QuadTransformType):Int {
#if hl
	return flight._hl._fn.QuadBatch.getQuadBatchTransformStride(transformType);
#elseif cpp
	return flight._cpp._fn.QuadBatch.getQuadBatchTransformStride(transformType);
#elseif (js && flight_esm)
	return flight._js._fn.QuadBatch.getQuadBatchTransformStride(transformType);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hitTestQuadBatchPoint(source:QuadBatch, point:Vector2):Int {
	return flight._js._fn.QuadBatch.hitTestQuadBatchPoint(source, point);
}
#else
extern inline function hitTestQuadBatchPoint(source:QuadBatch, point:Vector2):Int {
#if hl
	return flight._hl._fn.QuadBatch.hitTestQuadBatchPoint(source, point);
#elseif cpp
	return flight._cpp._fn.QuadBatch.hitTestQuadBatchPoint(source, point);
#elseif (js && flight_esm)
	return flight._js._fn.QuadBatch.hitTestQuadBatchPoint(source, point);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hitTestQuadBatchPointExact(source:QuadBatch, point:Vector2):Int {
	return flight._js._fn.QuadBatch.hitTestQuadBatchPointExact(source, point);
}
#else
extern inline function hitTestQuadBatchPointExact(source:QuadBatch, point:Vector2):Int {
#if hl
	return flight._hl._fn.QuadBatch.hitTestQuadBatchPointExact(source, point);
#elseif cpp
	return flight._cpp._fn.QuadBatch.hitTestQuadBatchPointExact(source, point);
#elseif (js && flight_esm)
	return flight._js._fn.QuadBatch.hitTestQuadBatchPointExact(source, point);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hitTestQuadBatchPointExactXy(source:QuadBatch, x:Float, y:Float):Int {
	return flight._js._fn.QuadBatch.hitTestQuadBatchPointExactXy(source, x, y);
}
#else
extern inline function hitTestQuadBatchPointExactXy(source:QuadBatch, x:Float, y:Float):Int {
#if hl
	return flight._hl._fn.QuadBatch.hitTestQuadBatchPointExactXy(source, x, y);
#elseif cpp
	return flight._cpp._fn.QuadBatch.hitTestQuadBatchPointExactXy(source, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.QuadBatch.hitTestQuadBatchPointExactXy(source, x, y);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hitTestQuadBatchPointXy(source:QuadBatch, x:Float, y:Float):Int {
	return flight._js._fn.QuadBatch.hitTestQuadBatchPointXy(source, x, y);
}
#else
extern inline function hitTestQuadBatchPointXy(source:QuadBatch, x:Float, y:Float):Int {
#if hl
	return flight._hl._fn.QuadBatch.hitTestQuadBatchPointXy(source, x, y);
#elseif cpp
	return flight._cpp._fn.QuadBatch.hitTestQuadBatchPointXy(source, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.QuadBatch.hitTestQuadBatchPointXy(source, x, y);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function iterateQuadBatchInstances(source:QuadBatch, visitor:Dynamic):Void {
	flight._js._fn.QuadBatch.iterateQuadBatchInstances(source, visitor);
}
#else
extern inline function iterateQuadBatchInstances(source:QuadBatch, visitorFn:Dynamic, visitorCtx:Dynamic):Void {
#if hl
	flight._hl._fn.QuadBatch.iterateQuadBatchInstances(source, visitorFn, visitorCtx);
#elseif cpp
	flight._cpp._fn.QuadBatch.iterateQuadBatchInstances(source, visitorFn, visitorCtx);
#elseif (js && flight_esm)
	flight._js._fn.QuadBatch.iterateQuadBatchInstances(source, visitorFn, visitorCtx);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function removeQuadBatchInstance(target:QuadBatch, index:Int):Void {
	flight._js._fn.QuadBatch.removeQuadBatchInstance(target, index);
}
#else
extern inline function removeQuadBatchInstance(target:QuadBatch, index:Int):Void {
#if hl
	flight._hl._fn.QuadBatch.removeQuadBatchInstance(target, index);
#elseif cpp
	flight._cpp._fn.QuadBatch.removeQuadBatchInstance(target, index);
#elseif (js && flight_esm)
	flight._js._fn.QuadBatch.removeQuadBatchInstance(target, index);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function reserveQuadBatch(target:QuadBatch, capacity:Int):Void {
	flight._js._fn.QuadBatch.reserveQuadBatch(target, capacity);
}
#else
extern inline function reserveQuadBatch(target:QuadBatch, capacity:Int):Void {
#if hl
	flight._hl._fn.QuadBatch.reserveQuadBatch(target, capacity);
#elseif cpp
	flight._cpp._fn.QuadBatch.reserveQuadBatch(target, capacity);
#elseif (js && flight_esm)
	flight._js._fn.QuadBatch.reserveQuadBatch(target, capacity);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resizeQuadBatch(target:QuadBatch, instanceCount:Int):Void {
	flight._js._fn.QuadBatch.resizeQuadBatch(target, instanceCount);
}
#else
extern inline function resizeQuadBatch(target:QuadBatch, instanceCount:Int):Void {
#if hl
	flight._hl._fn.QuadBatch.resizeQuadBatch(target, instanceCount);
#elseif cpp
	flight._cpp._fn.QuadBatch.resizeQuadBatch(target, instanceCount);
#elseif (js && flight_esm)
	flight._js._fn.QuadBatch.resizeQuadBatch(target, instanceCount);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setQuadBatchInstance(target:QuadBatch, index:Int, id:Int, x:Float, y:Float):Void {
	flight._js._fn.QuadBatch.setQuadBatchInstance(target, index, id, x, y);
}
#else
extern inline function setQuadBatchInstance(target:QuadBatch, index:Int, id:Int, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.QuadBatch.setQuadBatchInstance(target, index, id, x, y);
#elseif cpp
	flight._cpp._fn.QuadBatch.setQuadBatchInstance(target, index, id, x, y);
#elseif (js && flight_esm)
	flight._js._fn.QuadBatch.setQuadBatchInstance(target, index, id, x, y);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setQuadBatchInstanceMatrix(target:QuadBatch, index:Int, id:Int, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void {
	flight._js._fn.QuadBatch.setQuadBatchInstanceMatrix(target, index, id, a, b, c, d, tx, ty);
}
#else
extern inline function setQuadBatchInstanceMatrix(target:QuadBatch, index:Int, id:Int, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void {
#if hl
	flight._hl._fn.QuadBatch.setQuadBatchInstanceMatrix(target, index, id, a, b, c, d, tx, ty);
#elseif cpp
	flight._cpp._fn.QuadBatch.setQuadBatchInstanceMatrix(target, index, id, a, b, c, d, tx, ty);
#elseif (js && flight_esm)
	flight._js._fn.QuadBatch.setQuadBatchInstanceMatrix(target, index, id, a, b, c, d, tx, ty);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setQuadBatchInstanceRange(target:QuadBatch, startIndex:Int, count:Int, source:Dynamic):Void {
	flight._js._fn.QuadBatch.setQuadBatchInstanceRange(target, startIndex, count, source);
}
#else
extern inline function setQuadBatchInstanceRange(target:QuadBatch, startIndex:Int, count:Int, source:Dynamic, sourceLen:Int):Void {
#if hl
	flight._hl._fn.QuadBatch.setQuadBatchInstanceRange(target, startIndex, count, source, sourceLen);
#elseif cpp
	flight._cpp._fn.QuadBatch.setQuadBatchInstanceRange(target, startIndex, count, source, sourceLen);
#elseif (js && flight_esm)
	flight._js._fn.QuadBatch.setQuadBatchInstanceRange(target, startIndex, count, source, sourceLen);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setQuadBatchInstanceTint(target:QuadBatch, index:Int, rgba:Int):Void {
	flight._js._fn.QuadBatch.setQuadBatchInstanceTint(target, index, rgba);
}
#else
extern inline function setQuadBatchInstanceTint(target:QuadBatch, index:Int, rgba:Int):Void {
#if hl
	flight._hl._fn.QuadBatch.setQuadBatchInstanceTint(target, index, rgba);
#elseif cpp
	flight._cpp._fn.QuadBatch.setQuadBatchInstanceTint(target, index, rgba);
#elseif (js && flight_esm)
	flight._js._fn.QuadBatch.setQuadBatchInstanceTint(target, index, rgba);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setQuadBatchLocalBoundsRectangle(target:Dynamic, rect:Rectangle):Void {
	flight._js._fn.QuadBatch.setQuadBatchLocalBoundsRectangle(target, rect);
}
#else
extern inline function setQuadBatchLocalBoundsRectangle(target:Dynamic, rect:Rectangle):Void {
#if hl
	flight._hl._fn.QuadBatch.setQuadBatchLocalBoundsRectangle(target, rect);
#elseif cpp
	flight._cpp._fn.QuadBatch.setQuadBatchLocalBoundsRectangle(target, rect);
#elseif (js && flight_esm)
	flight._js._fn.QuadBatch.setQuadBatchLocalBoundsRectangle(target, rect);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setQuadBatchTransformType(target:QuadBatch, newType:Dynamic):Void {
	flight._js._fn.QuadBatch.setQuadBatchTransformType(target, newType);
}
#else
extern inline function setQuadBatchTransformType(target:QuadBatch, newType:flight.QuadTransformType):Void {
#if hl
	flight._hl._fn.QuadBatch.setQuadBatchTransformType(target, newType);
#elseif cpp
	flight._cpp._fn.QuadBatch.setQuadBatchTransformType(target, newType);
#elseif (js && flight_esm)
	flight._js._fn.QuadBatch.setQuadBatchTransformType(target, newType);
#else
	#error "flight.QuadBatch: no backend for this target."
#end
}
#end
