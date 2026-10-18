import flight.Audio;
import flight.Color;
import flight.Entity;
import flight.Input;
import flight.Math;
import flight.Path;
import flight.Power;
import flight.Protocol;

// One source file exercises the generated Flight ESM externs on web and every compile-proven
// flight-cpp function binding on hxcpp. Keeping this host-free isolates binding from host setup.
class CrossTargetMath {
  static function main():Void {
    assertString('audio MIME essence', getAudioMimeTypeEssence('  AUDIO/MPEG  '), 'audio/mpeg');

    assertClose('clamp', clamp(4.0, -1.0, 2.0), 2.0);
    assertTrue('inRange', inRange(0.5, 0.0, 1.0));
    assertClose('inverseLerp', inverseLerp(10.0, 20.0, 12.5), 0.25);
    assertClose('lerp', lerp(10.0, 20.0, 0.25), 12.5);
    assertClose('remap', remap(5.0, 0.0, 10.0, 10.0, 20.0), 15.0);
    assertClose('saturate', saturate(-0.5), 0.0);
    assertClose('smoothStep', smoothStep(0.0, 1.0, 0.5), 0.5);
    assertClose('step', step(0.5, 0.49), 0.0);
    assertClose('sRGB round trip', srgbChannelToLinear(linearChannelToSrgb(0.25)), 0.25);

    assertClose('ceilPowerOfTwo', ceilPowerOfTwo(9.0), 16.0);
    assertClose('ceilTo', ceilTo(4.2, 0.5), 4.5);
    assertFinite('damp', damp(0.0, 10.0, 2.0, 0.25));
    assertClose('degToRad', degToRad(180.0), Math.PI);
    assertClose('deltaAngle', deltaAngle(0.0, Math.PI * 1.5), -Math.PI * 0.5);
    assertClose('euclideanMod', euclideanMod(-1.0, 5.0), 4.0);
    assertClose('factorial', factorial(6.0), 720.0);
    assertClose('floorPowerOfTwo', floorPowerOfTwo(9.0), 8.0);
    assertClose('floorTo', floorTo(4.7, 0.5), 4.5);
    assertClose('fract', fract(4.25), 0.25);
    assertClose('gcd', gcd(54.0, 24.0), 6.0);
    assertFinite('hash2D', hash2D(12.0, 34.0));
    assertFinite('hash3D', hash3D(12.0, 34.0, 56.0));
    assertFinite('hashCombine', hashCombine(12.0, 34.0));
    assertFinite('hashUint32', hashUint32(123456.0));
    assertClose('hypot2', hypot2(3.0, 4.0), 25.0);
    assertTrue('isEven', isEven(12.0));
    assertTrue('isOdd', isOdd(13.0));
    assertTrue('isPowerOfTwo', isPowerOfTwo(16.0));
    assertClose('lcm', lcm(6.0, 8.0), 24.0);
    assertClose('lerpAngle', lerpAngle(0.0, Math.PI, 0.5), Math.PI * 0.5);
    assertClose('moveTowards', moveTowards(1.0, 5.0, 2.0), 3.0);
    assertClose('nextMultipleOf', nextMultipleOf(13.0, 5.0), 15.0);
    assertClose('nextPowerOfTwo', nextPowerOfTwo(9.0), 16.0);
    assertClose('normalizeAngle', normalizeAngle(Math.PI * 3.0), -Math.PI);
    assertClose('pingPong', pingPong(7.0, 5.0), 3.0);
    assertClose('previousPowerOfTwo', previousPowerOfTwo(9.0), 8.0);
    assertFinite('quantize', quantize(0.37, 8.0, 0.0, 1.0));
    assertClose('radToDeg', radToDeg(Math.PI), 180.0);
    assertClose('repeat', repeat(7.0, 5.0), 2.0);
    assertClose('roundTo', roundTo(4.24, 0.5), 4.0);
    assertClose('sign', sign(-3.0), -1.0);
    assertClose('smootherStep', smootherStep(0.0, 1.0, 0.5), 0.5);

    final packed = packColor(1.0, 0.5, 0.25, 0.75);
    assertFinite('packColor', packed);
    assertFinite('packOpaqueColor', packOpaqueColor(getColorRgb(packed)));
    assertClose('getColorAlpha', getColorAlpha(packed), 0.75, 1.0 / 255.0);
    assertFinite('getColorRgb', getColorRgb(packed));
    assertFinite('getColorLuminance', getColorLuminance(packed));
    final black = packColor(0.0, 0.0, 0.0, 1.0);
    final white = packColor(1.0, 1.0, 1.0, 1.0);
    assertTrue('getColorContrastRatio', getColorContrastRatio(black, white) > 1.0);
    assertFinite('lerpColor', lerpColor(black, white, 0.5));
    assertFinite('premultiplyColorAlpha', premultiplyColorAlpha(packed));
    assertFinite('setColorAlpha', setColorAlpha(packed, 0.5));
    assertFinite('unpremultiplyColorAlpha', unpremultiplyColorAlpha(premultiplyColorAlpha(packed)));
    assertFinite('colorFromKelvin', colorFromKelvin(6500.0));
    assertString('computeRgbHexString', computeRgbHexString(16711680.0), '#ff0000');
    assertString('computeRgbaCssString', computeRgbaCssString(4278190335.0), 'rgba(255,0,0,1)');

    assertClose('applyGamepadAxisDeadZone low', applyGamepadAxisDeadZone(0.05, 0.1), 0.0);
    assertFinite('quadratic curvature', getQuadraticBezierCurvature(0, 0, 1, 1, 2, 0, 0.5));
    assertFinite('cubic curvature', getCubicBezierCurvature(0, 0, 1, 1, 2, 1, 3, 0, 0.5));

    setEntityRuntimeGuardMode(true);
    assertTrue('entity guards enabled', areEntityRuntimeGuardsEnabled());
    disableEntityRuntimeGuards();
    assertTrue('entity guards disabled', !areEntityRuntimeGuardsEnabled());

    final previousPowerInterval = getPowerIdlePollingIntervalMs();
    setPowerIdlePollingIntervalMs(250.0);
    assertClose('power polling interval', getPowerIdlePollingIntervalMs(), 250.0);
    setPowerIdlePollingIntervalMs(previousPowerInterval);

    assertTrue('custom protocol scheme', isValidProtocolScheme('flight+desktop'));
    assertTrue('reserved protocol scheme', !isValidProtocolScheme('https'));
    report('CROSS_TARGET_MATH_OK');
  }

  static function assertClose(name:String, actual:Float, expected:Float, tolerance:Float = 1e-9):Void {
    if (Math.abs(actual - expected) > tolerance) throw '$name: expected $expected, received $actual';
  }

  static function assertTrue(name:String, actual:Bool):Void {
    if (!actual) throw '$name: expected true';
  }

  static function assertFinite(name:String, actual:Float):Void {
    if (!Math.isFinite(actual)) throw '$name: expected a finite value, received $actual';
  }

  static function assertString(name:String, actual:String, expected:String):Void {
    if (actual != expected) throw '$name: expected $expected, received $actual';
  }

  static inline function report(message:String):Void {
    #if sys
    Sys.println(message);
    #else
    trace(message);
    #end
  }
}
