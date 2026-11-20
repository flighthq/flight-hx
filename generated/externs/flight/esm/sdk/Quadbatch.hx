package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/quadbatch")
extern class Quadbatch {
  public static final QuadBatchKind:String;
  public static function appendQuadBatchInstance(target:flight.esm.types.quadbatch.Types.QuadBatch, id:Float, x:Float, y:Float):Float;
  public static function clearQuadBatch(target:flight.esm.types.quadbatch.Types.QuadBatch):Void;
  public static function cloneQuadBatch(source:flight.esm.types.quadbatch.Types.QuadBatch):flight.esm.types.quadbatch.Types.QuadBatch;
  public static function compactQuadBatch(target:flight.esm.types.quadbatch.Types.QuadBatch):Void;
  public static function computeQuadBatchLocalBoundsRectangle(out:flight.esm.types.geometry.Types.Rectangle, source:flight.esm.types.quadbatch.Types.QuadBatch):Void;
  public static function createQuadBatch():flight.esm.types.quadbatch.Types.QuadBatch;
  public static function enableQuadBatchSignals(target:flight.esm.types.quadbatch.Types.QuadBatch):flight.esm.types.quadbatch.Types.QuadBatchSignals;
  public static function getQuadBatchCapacity(source:flight.esm.types.quadbatch.Types.QuadBatch):Float;
  public static function getQuadBatchInstanceId(source:flight.esm.types.quadbatch.Types.QuadBatch, index:Float):Float;
  public static function getQuadBatchInstanceTransform(out:flight.esm.types.geometry.Types.Vector2Like, source:flight.esm.types.quadbatch.Types.QuadBatch, index:Float):Bool;
  public static function getQuadBatchSignals(source:flight.esm.types.quadbatch.Types.QuadBatch):Null<flight.esm.types.quadbatch.Types.QuadBatchSignals>;
  public static function getQuadBatchTransformStride(transformType:flight.esm.types.quadbatch.Types.QuadTransformType):Float;
  public static function hitTestQuadBatchPoint(source:flight.esm.types.quadbatch.Types.QuadBatch, point:flight.esm.types.geometry.Types.Vector2Like):Float;
  public static function hitTestQuadBatchPointExact(source:flight.esm.types.quadbatch.Types.QuadBatch, point:flight.esm.types.geometry.Types.Vector2Like):Float;
  public static function hitTestQuadBatchPointExactXY(source:flight.esm.types.quadbatch.Types.QuadBatch, x:Float, y:Float):Float;
  public static function hitTestQuadBatchPointXY(source:flight.esm.types.quadbatch.Types.QuadBatch, x:Float, y:Float):Float;
  public static function iterateQuadBatchInstances(source:flight.esm.types.quadbatch.Types.QuadBatch, visitor:((index:Float, id:Float, transforms:js.lib.Float32Array) -> Void)):Void;
  public static function removeQuadBatchInstance(target:flight.esm.types.quadbatch.Types.QuadBatch, index:Float):Void;
  public static function reserveQuadBatch(target:flight.esm.types.quadbatch.Types.QuadBatch, capacity:Float):Void;
  public static function resizeQuadBatch(target:flight.esm.types.quadbatch.Types.QuadBatch, instanceCount:Float):Void;
  public static function setQuadBatchInstance(target:flight.esm.types.quadbatch.Types.QuadBatch, index:Float, id:Float, x:Float, y:Float):Void;
  public static function setQuadBatchInstanceMatrix(target:flight.esm.types.quadbatch.Types.QuadBatch, index:Float, id:Float, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void;
  public static function setQuadBatchInstanceRange(target:flight.esm.types.quadbatch.Types.QuadBatch, startIndex:Float, count:Float, source:js.lib.Float32Array):Void;
  public static function setQuadBatchInstanceTint(target:flight.esm.types.quadbatch.Types.QuadBatch, index:Float, rgba:Float):Void;
  public static function setQuadBatchLocalBoundsRectangle(target:flight.esm.types.quadbatch.Types.QuadBatch, rect:flight.esm.types.geometry.Types.Rectangle):Void;
  public static function setQuadBatchTransformType(target:flight.esm.types.quadbatch.Types.QuadBatch, newType:flight.esm.types.quadbatch.Types.QuadTransformType):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
