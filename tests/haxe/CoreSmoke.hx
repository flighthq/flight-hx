package;

import flighthq.Math.*;
import flighthq.Types.Vector2Like;

class CoreSmoke {
  static function main():Void {
    if (clamp(12, 0, 10) != 10) throw 'clamp failed';
    if (quarterForSmoke(8) != 2) throw 'loop lowering failed';

    final point:Vector2Like = {x: 0.0, y: 0.0};
    final random = createRandomSource(0x1234);
    randomInsideUnitDisc(random, point);
    if (point.x * point.x + point.y * point.y > 1) throw 'random point escaped unit disc';

    final vector = flighthq.Geometry.createVector2(3, 4);
    if (flighthq.Geometry.getVector2Length(vector) != 5) throw 'geometry failed';
    final sdkVector = flighthq.Sdk.createVector2(6, 8);
    if (flighthq.Sdk.getVector2Length(sdkVector) != 10) throw 'sdk facade failed';
    final entity = flighthq.EntityApi.createEntity({value: 1});
    if (entity.value != 1) throw 'entity failed';
    final signal:flighthq.Types.Signal<Void->Void> = flighthq.Signals.createSignal();
    var emitted = false;
    flighthq.Signals.connectSignal(signal, function() emitted = true);
    flighthq.Signals.emitSignal(signal);
    if (!emitted) throw 'signals failed';
  }

  static function quarterForSmoke(value:Float):Float {
    var result = value;
    for (_ in 0...2) result /= 2;
    return result;
  }
}
