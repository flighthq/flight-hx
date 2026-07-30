package;

import flighthq.math.Math.*;
import flighthq.types.Vector2.Vector2Like;
import flighthq._internal._Async;

class CoreSmoke {
  static function main():Void {
    if (clamp(12, 0, 10) != 10) throw 'clamp failed';
    if (quarterForSmoke(8) != 2) throw 'loop lowering failed';

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

    #if !js
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
