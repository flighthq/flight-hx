import flight.Vector2;
import flight.Geometry; // bare module import -> unqualified free functions, bound to real Flight ESM

// Runs the GENERATED flight.* bindings against the real @flighthq/geometry ESM package — real
// Flight functions (out-param first, createVector2 allocation, radians), not a hand-written toy.
class WebGeometry {
  static function main():Void {
    final out:Vector2 = createVector2(0, 0);
    addVector2(out, {x: 1.0, y: 2.0}, {x: 3.0, y: 4.0});
    if (out.x != 4.0 || out.y != 6.0) throw 'addVector2 wrong: ${out.x},${out.y}';

    final len = getVector2Length({x: 3.0, y: 4.0});
    if (Math.abs(len - 5.0) > 1e-9) throw 'getVector2Length wrong: $len';

    report('sum=${out.x},${out.y} len=$len');
    report('WEB_GEOMETRY_OK: generated flight.* bound to real @flighthq/geometry');
  }

  static inline function report(msg:String):Void {
    #if sys Sys.println(msg); #else trace(msg); #end
  }
}
