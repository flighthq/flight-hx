import flight.Vector2;
import flight.Geom; // bare module import -> all its free functions, unqualified

// A host-free example: it exercises the flight.* surface the way a consumer writes
// it — structural value types, unqualified free-function calls — and nothing else.
// No window, no render, no platform. It runs identically on every backend, so it is
// the layer's cheapest faithfulness check and the template other examples build on.
class Headless {
  static function main():Void {
    // Structural construction — no `new`, no nominal ctor.
    final path:Array<Vector2> = [
      {x: 0.0, y: 0.0},
      {x: 3.0, y: 4.0},
      {x: 6.0, y: 8.0},
    ];

    // Fold the polyline with the unqualified facade calls.
    var total = 0.0;
    for (i in 1...path.length) {
      final step = subFrom(path[i], path[i - 1]);
      total += lengthVector2(step);
    }

    report('path length = $total'); // expect 10
    if (Math.abs(total - 10.0) > 1e-9) throw 'unexpected length: $total';
    report('HEADLESS_OK');
  }

  // Small local helper built from the facade — b - a, via addVector2 + negation.
  static inline function subFrom(a:Vector2, b:Vector2):Vector2 {
    return addVector2(a, {x: -b.x, y: -b.y});
  }

  static inline function report(msg:String):Void {
    #if sys
    Sys.println(msg);
    #else
    trace(msg);
    #end
  }
}
