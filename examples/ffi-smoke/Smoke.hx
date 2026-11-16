import flight.Math;
import flight.Geometry;

class Smoke {
  public static function main() {
    if (lerp(0, 10, 0.25) != 2.5) throw 'lerp failed';
    final v = createVector2(3, 4);
    if (getVector2Length(v) != 5) throw 'vector length failed';
    v.x = 6;
    if (v.x != 6) throw 'vector field access failed';
    freeVector2(v);
    final m = createMatrix4FromValues(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);
    for (row in 0...4) for (column in 0...4) {
      if (getMatrix4Element(m, row, column) != column * 4 + row + 1)
        throw 'matrix constructor arguments corrupted';
    }
    setMatrix4(m, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32);
    for (row in 0...4) for (column in 0...4) {
      if (getMatrix4Element(m, row, column) != column * 4 + row + 17)
        throw 'matrix setter arguments corrupted';
    }
    freeMatrix4(m);
    trace('FLIGHT_FFI_SMOKE_OK');
  }
}
