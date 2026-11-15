import flight.Math;
import flight.Geometry;

class Smoke {
  static function main() {
    if (lerp(0, 10, 0.25) != 2.5) throw 'lerp failed';
    final v = createVector2(3, 4);
    if (getVector2Length(v) != 5) throw 'vector length failed';
    v.x = 6;
    if (v.x != 6) throw 'vector field access failed';
    trace('FLIGHT_FFI_SMOKE_OK');
  }
}
