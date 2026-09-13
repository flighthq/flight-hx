import flight.Math.clamp;
import flight.Math.degToRad;
import flight.Math.randomGaussianPair;
import flight.Effects.createGaussianKernelWeights;
import flight._hx.easing.CreateEasingSamples.createEasingSamples;
import flight._hx.scene2dFormats.RiveCoreTypes.getRiveCoreTypeName;
import flight._hx.scene2dFormats.RiveCoreTypes.isRiveCoreTypeDerivedFrom;
import flight._internal._Promise;
import flight._internal._Set;
import flight._internal._Symbol;
import flight._internal._Float32Array;

/** Exercises a host-free compiler-emitted slice on Haxe's eval target. */
class GeneratedTranspilePortableSmoke {
  static function main():Void {
    if (clamp(-3, -1, 2) != -1) throw 'portable clamp wrong';
    final pi = 3.141592653589793;
    final radiansDelta = degToRad(180) - pi;
    if ((radiansDelta < 0 ? -radiansDelta : radiansDelta) > 1e-12) throw 'portable degToRad wrong';

    final values = [0.25, 0.75];
    var index = 0;
    final pair = randomGaussianPair(() -> values[index++], 0, 1);
    if (pair.length != 2) throw 'portable randomGaussianPair wrong';

    final samples = createEasingSamples((value) -> value * value, 3);
    if (samples.length != 3 || samples[0] != 0 || samples[1] != 0.25 || samples[2] != 1) {
      throw 'portable Float32Array runtime wrong';
    }
    final weights = new _Float32Array(2);
    if (createGaussianKernelWeights(1, 1, weights) != 2 || weights[0] <= weights[1]) {
      throw 'portable public Effects facade wrong';
    }

    if (getRiveCoreTypeName(4) != 'Ellipse' || !isRiveCoreTypeDerivedFrom(4, 12)) {
      throw 'portable Map runtime wrong';
    }
    final set = new _Set<String>(['alpha', 'alpha', 'beta']);
    if (set.size != 2 || !set.has('beta') || !set.delete('alpha') || set.has('alpha')) {
      throw 'portable Set runtime wrong';
    }

    if (_Symbol.for_('shared') != _Symbol.for_('shared') || _Symbol.create('fresh') == _Symbol.create('fresh')) {
      throw 'portable Symbol runtime wrong';
    }

    var promiseValue = 0;
    var cleanupCount = 0;
    final tasks:Array<Dynamic> = [_Promise.resolve(7), _Promise.resolve(2)];
    _Promise.all(tasks).finally(() -> cleanupCount += 1).then((resolved) -> {
      promiseValue = resolved[0] * resolved[1];
      return promiseValue;
    });
    var rejection:Dynamic = null;
    final rejected:_Promise<Dynamic> = _Promise.reject('expected');
    rejected.finally(() -> cleanupCount += 1).then(null, (reason) -> {
      rejection = reason;
      return null;
    });
    if (promiseValue != 14 || cleanupCount != 2 || rejection != 'expected') {
      throw 'portable Promise runtime wrong';
    }
    Sys.println('GENERATED_TRANSPILE_PORTABLE_OK');
  }
}
