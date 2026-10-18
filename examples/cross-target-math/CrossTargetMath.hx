import flight.Audio;
import flight.Bitmapfont;
import flight.Color;
import flight.Collision;
import flight.Entity;
import flight.Effects;
import flight.FontFormats;
import flight.Geometry;
import flight.Image;
import flight.Input;
import flight.Lighting;
import flight.Materials;
import flight.Math;
import flight.Path;
import flight.Power;
import flight.Protocol;
import flight.Scene2dFormats;
import flight.Scene3dFormats;
import flight.Shape;
import flight.Skeleton2dFormats;
import flight.Swf;
import flight.Textbidi;
import flight.Textsegment;
import flight.Textshaper;

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
    assertTrue('approxEqual default', approxEqual(1.0, 1.0 + 1e-7) && !approxEqual(1.0, 1.0 + 1e-5));
    assertTrue('approxEqual custom', approxEqual(1.0, 1.1, 0.2) && !approxEqual(1.0, 1.3, 0.2));
    assertTrue(
      'approxEqualRelative default',
      approxEqualRelative(1e8, 1e8 + 1.0) && !approxEqualRelative(1e8, 2e8)
    );
    assertTrue('approxEqualRelative custom', approxEqualRelative(100.0, 101.0, 0.02));
    assertTrue('approxZero default', approxZero(1e-7) && !approxZero(1e-4));
    assertTrue('approxZero custom', approxZero(0.01, 0.1) && !approxZero(0.2, 0.1));
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

    assertClose('packBitmapFontKerningKey', packBitmapFontKerningKey(65.0, 86.0), 72417366.0);
    assertTrue(
      'packContactFeatureId',
      packContactFeatureId(true, 3.0, 7.0, false) != packContactFeatureId(true, 3.0, 7.0, true)
    );
    assertClose('getWoff2BboxBitmapByteLength', getWoff2BboxBitmapByteLength(33.0), 8.0);
    assertTrue('isWoff2PointOnCurve true', isWoff2PointOnCurve(0.0));
    assertTrue('isWoff2PointOnCurve false', !isWoff2PointOnCurve(128.0));
    assertClose('rankOpenTypeUnicodeEncoding full', rankOpenTypeUnicodeEncoding(3.0, 10.0), 2.0);
    assertClose('rankOpenTypeUnicodeEncoding invalid', rankOpenTypeUnicodeEncoding(1.0, 0.0), -1.0);
    assertClose('applyLightExposure', applyLightExposure(2.0, 2.0), 8.0);

    assertClose('getPbrMetallicFromPhongSpecular', getPbrMetallicFromPhongSpecular(4294967295.0, 255.0), 1.0);
    assertClose('getPbrRoughnessFromPhongShininess', getPbrRoughnessFromPhongShininess(32.0), 0.24253562503633297);
    assertClose('getPhongToPbrLightExposure', getPhongToPbrLightExposure(), Math.log(Math.PI) / Math.log(2.0));
    assertTrue('isValidMaterialClearcoat', isValidMaterialClearcoat(0.5) && !isValidMaterialClearcoat(-1.0));
    assertTrue('isValidMaterialIor', isValidMaterialIor(1.5) && !isValidMaterialIor(0.0));
    assertTrue(
      'isValidMaterialIridescenceThickness',
      isValidMaterialIridescenceThickness(100.0) && !isValidMaterialIridescenceThickness(-1.0)
    );
    assertTrue('isValidMaterialWeight', isValidMaterialWeight(0.5) && !isValidMaterialWeight(2.0));
    assertTrue('isValidPbrUvSet', isValidPbrUvSet(1.0) && !isValidPbrUvSet(2.0));

    assertTrue('isRiveCoreBytesProperty', isRiveCoreBytesProperty(212.0) && !isRiveCoreBytesProperty(4.0));
    assertTrue('isRiveCoreTypeDerivedFrom', isRiveCoreTypeDerivedFrom(4.0, 2.0) && !isRiveCoreTypeDerivedFrom(2.0, 4.0));

    clearMatrix3Pool();
    clearMatrix4Pool();
    clearMatrixPool();
    clearQuaternionPool();
    clearRectanglePool();
    clearVector2Pool();
    clearVector3Pool();
    clearVector4Pool();

    unregisterHostImageDimensionResolver();
    assertTrue('hasHostImageDimensionResolver', !hasHostImageDimensionResolver());
    unregisterGltfDracoDecoder();
    assertTrue('hasGltfDracoDecoder', !hasGltfDracoDecoder());

    final shapeBoundsRevision = getShapeBoundsCommandRegistryRevision();
    clearShapeBoundsCommands();
    assertClose('getShapeBoundsCommandRegistryRevision', getShapeBoundsCommandRegistryRevision(), shapeBoundsRevision + 1.0);
    assertClose('getPathCommandOperandCount', getPathCommandOperandCount(6.0), 6.0);
    assertClose('clampSpineBinaryUnit low', clampSpineBinaryUnit(-1.0), 0.0);
    assertClose('clampSpineBinaryUnit high', clampSpineBinaryUnit(2.0), 1.0);
    assertTrue('isKnownSwfTag', isKnownSwfTag(1.0) && !isKnownSwfTag(3.0));

    reportTextBidiCompactTableMiss(0x4e2d);
    reportTextSegmenterUnavailable();
    disposeTextShaperSignals();

    assertFinite('computeAcesToneMap', computeAcesToneMap(1.0));
    assertFinite('computeBoxBlurPassRadius', computeBoxBlurPassRadius(4.0, 3.0, 0.0));
    assertFinite('computeBoxBlurRadius', computeBoxBlurRadius(4.0, 3.0));
    assertClose('computeDepthOfFieldCoc', computeDepthOfFieldCoc(5.0, 5.0, 1.8, 50.0), 0.0);
    assertClose('computeExposureScale', computeExposureScale(1.0), 2.0);
    assertClose('computeGaussianRadiusFromSigma', computeGaussianRadiusFromSigma(2.0), 6.0);
    assertFinite('computeGaussianSigmaForBlurRadius', computeGaussianSigmaForBlurRadius(4.0, 3.0));
    assertFinite('computeGaussianSigmaFromRadius', computeGaussianSigmaFromRadius(6.0));
    assertFinite('computeLinearDepthFromNonlinear', computeLinearDepthFromNonlinear(0.5, 0.1, 100.0));
    assertFinite('computeReinhardExtendedToneMap', computeReinhardExtendedToneMap(1.0, 4.0));
    assertClose('computeReinhardToneMap', computeReinhardToneMap(1.0), 0.5);
    assertFinite('computeUncharted2ToneMap', computeUncharted2ToneMap(1.0));
    assertClose('getBlurDownsampleLevel', getBlurDownsampleLevel(8.0), 1.0);
    assertClose('getBlurResidualSigma', getBlurResidualSigma(8.0, 1.0), 4.0);
    assertClose('getGaussianKernelSize', getGaussianKernelSize(2.0), 13.0);
    assertClose('getLinearSampledGaussianTapCount', getLinearSampledGaussianTapCount(2.0), 7.0);

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
