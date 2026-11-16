package flight._js._fn;

@:jsRequire("@flighthq/quadbatch")
extern class QuadBatch {
	@:native("createQuadBatch")
	public static function createQuadBatch():Dynamic;
	@:native("createQuadBatchData")
	public static function createQuadBatchData():flight._js.QuadBatchData;
	@:native("createQuadBatchRuntime")
	public static function createQuadBatchRuntime():flight._js.Node2DRuntime;
	@:native("createQuadBatchSignals")
	public static function createQuadBatchSignals():Dynamic;
	@:native("appendQuadBatchInstance")
	public static function appendQuadBatchInstance(target:flight._js.QuadBatch, id:Int, x:Float, y:Float):Int;
	@:native("clearQuadBatch")
	public static function clearQuadBatch(target:flight._js.QuadBatch):Void;
	@:native("cloneQuadBatch")
	public static function cloneQuadBatch(source:flight._js.QuadBatch):Dynamic;
	@:native("compactQuadBatch")
	public static function compactQuadBatch(target:flight._js.QuadBatch):Void;
	@:native("computeQuadBatchLocalBoundsRectangle")
	public static function computeQuadBatchLocalBoundsRectangle(out:flight._js.Rectangle, source:flight._js.QuadBatch):Void;
	@:native("enableQuadBatchSignals")
	public static function enableQuadBatchSignals(target:flight._js.QuadBatch):Dynamic;
	@:native("getQuadBatchCapacity")
	public static function getQuadBatchCapacity(source:flight._js.QuadBatch):Int;
	@:native("getQuadBatchInstanceId")
	public static function getQuadBatchInstanceId(source:flight._js.QuadBatch, index:Int):Int;
	@:native("getQuadBatchInstanceTransform")
	public static function getQuadBatchInstanceTransform(out:flight._js.Vector2, source:flight._js.QuadBatch, index:Int):Bool;
	@:native("getQuadBatchRuntime")
	public static function getQuadBatchRuntime(source:flight._js.QuadBatch):Dynamic;
	@:native("getQuadBatchSignals")
	public static function getQuadBatchSignals(source:flight._js.QuadBatch):Null<Dynamic>;
	@:native("getQuadBatchTransformStride")
	public static function getQuadBatchTransformStride(transformType:Dynamic):Int;
	@:native("hitTestQuadBatchPoint")
	public static function hitTestQuadBatchPoint(source:flight._js.QuadBatch, point:flight._js.Vector2):Int;
	@:native("hitTestQuadBatchPointExact")
	public static function hitTestQuadBatchPointExact(source:flight._js.QuadBatch, point:flight._js.Vector2):Int;
	@:native("hitTestQuadBatchPointExactXY")
	public static function hitTestQuadBatchPointExactXy(source:flight._js.QuadBatch, x:Float, y:Float):Int;
	@:native("hitTestQuadBatchPointXY")
	public static function hitTestQuadBatchPointXy(source:flight._js.QuadBatch, x:Float, y:Float):Int;
	@:native("iterateQuadBatchInstances")
	public static function iterateQuadBatchInstances(source:flight._js.QuadBatch, visitor:Dynamic):Void;
	@:native("removeQuadBatchInstance")
	public static function removeQuadBatchInstance(target:flight._js.QuadBatch, index:Int):Void;
	@:native("reserveQuadBatch")
	public static function reserveQuadBatch(target:flight._js.QuadBatch, capacity:Int):Void;
	@:native("resizeQuadBatch")
	public static function resizeQuadBatch(target:flight._js.QuadBatch, instanceCount:Int):Void;
	@:native("setQuadBatchInstance")
	public static function setQuadBatchInstance(target:flight._js.QuadBatch, index:Int, id:Int, x:Float, y:Float):Void;
	@:native("setQuadBatchInstanceMatrix")
	public static function setQuadBatchInstanceMatrix(target:flight._js.QuadBatch, index:Int, id:Int, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void;
	@:native("setQuadBatchInstanceRange")
	public static function setQuadBatchInstanceRange(target:flight._js.QuadBatch, startIndex:Int, count:Int, source:Dynamic):Void;
	@:native("setQuadBatchInstanceTint")
	public static function setQuadBatchInstanceTint(target:flight._js.QuadBatch, index:Int, rgba:Int):Void;
	@:native("setQuadBatchLocalBoundsRectangle")
	public static function setQuadBatchLocalBoundsRectangle(target:Dynamic, rect:flight._js.Rectangle):Void;
	@:native("setQuadBatchTransformType")
	public static function setQuadBatchTransformType(target:flight._js.QuadBatch, newType:Dynamic):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeQuadBatchData(ptr:flight._js.QuadBatchData):Void {}
}
