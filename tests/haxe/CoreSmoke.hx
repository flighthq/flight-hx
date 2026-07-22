package;

import flight.Math.*;
import flight.Types.Vector2Like;

class CoreSmoke {
  static function main():Void {
    if (clamp(12, 0, 10) != 10) throw 'clamp failed';
    if (quarterForSmoke(8) != 2) throw 'loop lowering failed';

    final point:Vector2Like = {x: 0.0, y: 0.0};
    final random = createRandomSource(0x1234);
    randomInsideUnitDisc(random, point);
    if (point.x * point.x + point.y * point.y > 1) throw 'random point escaped unit disc';

    final vector = flight.Geometry.createVector2(3, 4);
    if (flight.Geometry.getVector2Length(vector) != 5) throw 'geometry failed';
    final sdkVector = flight.Sdk.createVector2(6, 8);
    if (flight.Sdk.getVector2Length(sdkVector) != 10) throw 'sdk facade failed';
    final entity = flight.EntityApi.createEntity({value: 1});
    if (entity.value != 1) throw 'entity failed';
    final signal:flight.Types.Signal<Void->Void> = flight.Signals.createSignal();
    var emitted = false;
    flight.Signals.connectSignal(signal, function() emitted = true);
    flight.Signals.emitSignal(signal);
    if (!emitted) throw 'signals failed';
  }

  static function quarterForSmoke(value:Float):Float {
    var result = value;
    for (_ in 0...2) result /= 2;
    return result;
  }
}
