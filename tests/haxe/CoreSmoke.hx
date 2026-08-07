package;

import flighthq.math.Math.*;
import flighthq.types.Vector2.Vector2Like;
import flighthq._internal._Async;
import flighthq._internal._Runtime;

class CoreSmoke {
  static function main():Void {
    // Cairo alias surface: the derived Cairo-named entry points and typedefs
    // must forward to the canvas originals with reference identity.
    final cairoResolvers:flighthq.types.CairoTextureResolvers = flighthq.scene2dCairo.Scene2dCairo.createCairoTextureResolvers();
    final canvasResolvers:Dynamic = cairoResolvers;
    if (canvasResolvers == null) throw 'cairo alias returned null resolvers';
    if (flighthq.scene2dCairo.Scene2dCairo.defaultCairoShapeCommands != flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasShapeCommands) {
      throw 'cairo alias lost reference identity';
    }
    if (clamp(12, 0, 10) != 10) throw 'clamp failed';
    StaticLoweringSmoke.run();
    StaticIndexSmoke.run();
    if (quarterForSmoke(8) != 2) throw 'loop lowering failed';
    if (_Runtime.isError('not an error')) throw 'non-Error identity failed';
    if (!_Runtime.isError(_Runtime.error('expected'))) throw 'Error identity failed';
    if (_Runtime.fround(5.6789) != 5.678899765014648) throw 'Math.fround binary32 rounding failed';

    final dynamicProductLeft:Dynamic = {value: 0.8};
    final dynamicProductRight:Dynamic = {value: 1.0};
    final dynamicProductSink:Dynamic = {value: 0.0};
    _Runtime.setField(
      dynamicProductSink,
      'value',
      _Runtime.multiplyNumbers(
        _Runtime.field(dynamicProductLeft, 'value'),
        _Runtime.field(dynamicProductRight, 'value')
      )
    );
    if (_Runtime.field(dynamicProductSink, 'value') != 0.8) throw 'dynamic fractional product was truncated';

    var synchronousFlowPrefix = 0;
    final synchronousFlow = _Async.continueFlow(_Async.flowNormal(), function() {
      synchronousFlowPrefix = 1;
      return _Async.flowNormal();
    });
    if (synchronousFlowPrefix != 1 || synchronousFlow != null) throw 'async synchronous prefix was deferred';
    var synchronousIterations = 0;
    final synchronousLoop = _Async.repeatFlow(function() {
      synchronousIterations++;
      return synchronousIterations < 3 ? _Async.flowContinue() : _Async.flowBreak();
    });
    if (synchronousIterations != 3) throw 'synchronous async flow loop was deferred';

    #if js
    if (synchronousLoop != null) throw 'JavaScript synchronous flow returned a pending outcome';
    var awaitedContinuationRan = false;
    _Async.flatMap(_Async.resolve(null), function(_) {
      awaitedContinuationRan = true;
      return null;
    });
    if (awaitedContinuationRan) throw 'real await continuation ran synchronously';

    final thrownMarkers:Array<Dynamic> = [{}, 'primitive', _Runtime.error('identity')];
    for (thrownMarker in thrownMarkers) {
      final caughtMarker:Dynamic = js.Syntax.code(
        '(function(throwValue, marker) { try { throwValue(marker); } catch (error) { return error; } })({0}, {1})',
        _Runtime.throwValue,
        thrownMarker,
      );
      if (caughtMarker != thrownMarker) throw 'raw thrown value lost identity';
    }
    #end

    final point:Vector2Like = {x: 0.0, y: 0.0};
    final random = createRandomSource(0x1234);
    randomInsideUnitDisc(random, point);
    if (point.x * point.x + point.y * point.y > 1) throw 'random point escaped unit disc';
    FmodSmoke.run();

    final vector = flighthq.geometry.Geometry.createVector2(3, 4);
    if (flighthq.geometry.Geometry.getVector2Length(vector) != 5) throw 'geometry failed';
    final sdkVector = flighthq.sdk.Sdk.createVector2(6, 8);
    if (flighthq.sdk.Sdk.getVector2Length(sdkVector) != 10) throw 'sdk facade failed';
    final mutableVector = flighthq.geometry.Geometry.createVector3(1, 2, 3);
    final vectorAlias = mutableVector;
    flighthq.geometry.Geometry.setVector3(mutableVector, 4, 5, 6);
    if (vectorAlias.x != 4 || vectorAlias.y != 5 || vectorAlias.z != 6) {
      throw 'typed struct out parameter lost alias identity';
    }

    TypedStructTranche4Smoke.run();
    TypedStructClassSmoke.run();
    TypedStructParticleClassSmoke.run();

    final box = flighthq.mesh.Mesh.createBoxMeshGeometry(2, 4, 6);
    if (box.bounds == null || box.bounds.min.x != -1 || box.bounds.max.y != 2 || box.bounds.max.z != 3) {
      throw 'mesh bounds failed';
    }
    final entity = flighthq.entity.Entity.createEntity({value: 1});
    if (entity.value != 1) throw 'entity failed';
    final signal:flighthq.types.Signal<Void->Void> = flighthq.signals.Signals.createSignal();
    var emitted = false;
    flighthq.signals.Signals.connectSignal(signal, function() emitted = true);
    flighthq.signals.Signals.emitSignal(signal);
    if (!emitted) throw 'signals failed';
    final valueSignal:flighthq.types.Signal<Float->Void> = flighthq.signals.Signals.createSignal();
    var emittedValue = 0.0;
    flighthq.signals.Signals.connectSignal(valueSignal, function(value:Float) emittedValue = value);
    flighthq.signals.Signals.emitSignal(valueSignal, 4.5);
    if (emittedValue != 4.5) throw 'signal arguments failed';
    final tupleSignal:flighthq.types.Signal<Float->Float->Float->Void> = flighthq.signals.Signals.createSignal();
    var emittedTuple = '';
    flighthq.signals.Signals.connectSignal(tupleSignal, function(a:Float, b:Float, c:Float) {
      emittedTuple = '$a,$b,$c';
    });
    flighthq.signals.Signals.emitSignal(tupleSignal, 1, 2, 4);
    if (emittedTuple != '1,2,4') throw 'signal rest arguments failed';

    #if !js
    final decoder = _Runtime.construct(_Runtime.globalValue('TextDecoder'), []);
    final decoded = _Runtime.callProperty(decoder, 'decode', [new flighthq._internal._UInt8Array([104, 105])]);
    if (decoded != 'hi') throw 'portable TextDecoder failed';

    final buffer = _Runtime.construct(_Runtime.globalValue('ArrayBuffer'), [4]);
    final view = _Runtime.construct(_Runtime.globalValue('DataView'), [buffer]);
    final bytes = new flighthq._internal._UInt8Array(_Runtime.field(view, 'buffer'));
    _Runtime.callProperty(view, 'setUint32', [0, 0x01020304, true]);
    if (flighthq._internal._StaticIndex.readUint8Array(bytes, 0) != 4) {
      throw 'portable ArrayBuffer DataView-to-typed-array sharing failed';
    }
    flighthq._internal._StaticIndex.writeUint8Array(bytes, 3, 8);
    if (_Runtime.callProperty(view, 'getUint32', [0, true]) != 0x08020304) {
      throw 'portable ArrayBuffer typed-array-to-DataView sharing failed';
    }

    var asyncValue = 0;
    _Async.flatMap(_Async.resolve(4), function(value:Int) {
      asyncValue = value + 1;
      return value;
    });
    if (asyncValue != 5) throw 'portable promise flatMap failed';

    var recovered = false;
    _Async.recover(_Async.reject('expected'), function(_) {
      recovered = true;
      return null;
    });
    if (!recovered) throw 'portable promise recovery failed';
    #end
  }

  static function quarterForSmoke(value:Float):Float {
    var result = value;
    for (_ in 0...2) result /= 2;
    return result;
  }
}
