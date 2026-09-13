import flight.Color.colorFromKelvin;
import flight.Math.clamp;
import flight.Math.degToRad;

/** Executes compiler-emitted functions through the public flight.* facade. */
class GeneratedTranspileSmoke {
  static function main():Void {
    final color = colorFromKelvin(6500);
    if (color != 4294900479) throw 'colorFromKelvin wrong: $color';

    if (clamp(5, 0, 3) != 3) throw 'clamp wrong';
    final pi = 3.141592653589793;
    final radiansDelta = degToRad(180) - pi;
    if ((radiansDelta < 0 ? -radiansDelta : radiansDelta) > 1e-12) throw 'degToRad wrong';
    final tauDelta = flight.Math.TAU - pi * 2;
    if ((tauDelta < 0 ? -tauDelta : tauDelta) > 1e-12) throw 'TAU wrong';

    final vector:flight.Vector4 = {EntityRuntimeKey: null, x: 1, y: 2, z: 3, w: 4};
    if (vector.w != 4) throw 'Vector4 facade wrong';
    trace('GENERATED_TRANSPILE_OK');
  }
}
