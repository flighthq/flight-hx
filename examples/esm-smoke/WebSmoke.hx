import flight.Math;
import flight.Geometry;

class WebSmoke {
  static function main() {
    if (lerp(0, 10, 0.25) != 2.5) throw 'lerp failed';
    if (mean([1.0, 3.0, 5.0]) != 3) throw 'array argument failed';
    if (Math.abs(randomExponential(function() return 0.5, null) - Math.log(2)) > 1e-10)
      throw 'callback or optional argument failed';
    if (hash2d(1, 2) == 0) throw 'compiler acronym naming failed';
    final v = createVector2(3, 4);
    if (v.getLength() != 5 || getVector2Length(v) != 5) throw 'vector length failed';
    v.x = 6;
    if (v.x != 6) throw 'object field mutation failed';
    final data = new js.lib.Float32Array(4);
    writeVector2ToFloat32Array(data, 1, v);
    if (data[1] != 6 || data[2] != 4) throw 'typed array mutation failed';
    releaseVector2(v);
    final freeOnly = createVector2(1, 2);
    freeVector2(freeOnly); // Native frees have no allocation to release on the GC target.
    trace('FLIGHT_ESM_SMOKE_OK');
  }
}
