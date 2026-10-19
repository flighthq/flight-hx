import flight.Audio;
import flight.Adjustments;
import flight.Bitmap;
import flight.Bitmapfont;
import flight.CameraControls;
import flight.Clipboard;
import flight.Color;
import flight.Collision;
import flight.Device;
import flight.Entity;
import flight.Effects;
import flight.FontFormats;
import flight.Geolocation;
import flight.Geometry;
import flight.Image;
import flight.Input;
import flight.Lighting;
import flight.Materials;
import flight.Math;
import flight.Path;
import flight.Platform;
import flight.Power;
import flight.Protocol;
import flight.Screen;
import flight.Scene2dFormats;
import flight.Scene3dFormats;
import flight.Shape;
import flight.Skeleton2dFormats;
import flight.Sensors;
import flight.Spring;
import flight.Swf;
import flight.Textbidi;
import flight.Textsegment;
import flight.Textshaper;
import flight.Velocity;

// One source file exercises the generated Flight ESM externs on web and every compile-proven
// flight-cpp function binding on hxcpp. Keeping this host-free isolates binding from host setup.
class CrossTargetMath {
  static function main():Void {
    assertString('audio MIME essence', getAudioMimeTypeEssence('  AUDIO/MPEG  '), 'audio/mpeg');
    assertString(
      'audio MIME parameter',
      getAudioMimeTypeParameter('audio/wav; rate=22050; channels=2', 'rate'),
      '22050'
    );
    assertTrue('audio MIME parameter absent', getAudioMimeTypeParameter('audio/mpeg', 'rate') == null);
    assertString('inferred audio MIME', inferAudioMimeType('track.mp3?cache=1'), 'audio/mpeg');
    assertTrue('inferred audio MIME absent', inferAudioMimeType('track.mid') == null);

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

    final identity = createIdentityColorMatrix();
    assertTrue('identity color matrix length', identity.length == 20);
    assertTrue('identity color matrix affine', isAffineColorMatrix(identity));
    final brightness = createBrightnessColorMatrix(0.25);
    assertClose('brightness color matrix', brightness[4], 0.25);
    assertFinite('apply identity color matrix', applyColorMatrixToColor(identity, 4286595327.0));
    assertTrue(
      'channel mixer color matrix',
      createChannelMixerColorMatrix([1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]).length == 20
    );
    assertTrue(
      'color balance color matrix',
      createColorBalanceColorMatrix([1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]).length == 20
    );
    assertTrue('tint color matrix', createColorMatrixFromTint(4286595327.0, 0.5).length == 20);
    assertTrue('contrast color matrix', createContrastColorMatrix(1.25).length == 20);
    assertTrue('desaturate color matrix', createDesaturateColorMatrix(0.5).length == 20);
    assertTrue('grayscale color matrix', createGrayscaleColorMatrix().length == 20);
    assertTrue('hue color matrix', createHueRotateColorMatrix(90.0).length == 20);
    assertTrue('invert color matrix', createInvertColorMatrix().length == 20);
    assertTrue('levels color matrix default', createLevelsColorMatrix(0.0, 1.0, 0.0, 1.0).length == 20);
    assertTrue('levels color matrix gamma', createLevelsColorMatrix(0.0, 1.0, 0.0, 1.0, 2.2).length == 20);
    assertTrue('opacity color matrix', createOpacityColorMatrix(0.5).length == 20);
    assertTrue('polaroid color matrix', createPolaroidColorMatrix().length == 20);
    assertTrue('saturation color matrix', createSaturationColorMatrix(0.5).length == 20);
    assertTrue('sepia color matrix', createSepiaColorMatrix().length == 20);
    assertTrue('technicolor color matrix', createTechnicolorColorMatrix().length == 20);
    assertTrue('vintage color matrix', createVintageColorMatrix().length == 20);
    assertTrue('white balance color matrix', createWhiteBalanceColorMatrix(20.0, -10.0).length == 20);
    createColorLutCache();
    createTintAdjustment(4286595327.0);
    final concatenated = identity.copy();
    concatColorMatrix(concatenated, brightness);
    assertTrue('concatenated color matrix', concatenated.length == 20);
    final multipliedDefault = multiplyColorMatrix(identity, brightness);
    assertTrue('multiplied color matrix default', multipliedDefault.length == 20);
    final multipliedOut = zeroes(20);
    final multiplied = multiplyColorMatrix(identity, brightness, multipliedOut);
    assertTrue('multiplied color matrix preserves out identity', multiplied == multipliedOut);
    assertTrue('fused color matrices', fuseColorMatrices([identity, brightness]).length == 20);

    final bitmapMatrix = zeroes(20);
    buildBitmapBrightnessColorMatrix(bitmapMatrix, 0.25);
    buildBitmapContrastColorMatrix(bitmapMatrix, 1.25);
    buildBitmapGrayscaleColorMatrix(bitmapMatrix);
    buildBitmapHueRotationColorMatrix(bitmapMatrix, 90.0);
    buildBitmapInvertColorMatrix(bitmapMatrix);
    buildBitmapSaturationColorMatrix(bitmapMatrix, 0.5);
    buildBitmapSepiaColorMatrix(bitmapMatrix);
    setBitmapColorMatrixIdentity(bitmapMatrix);
    concatBitmapColorMatrix(bitmapMatrix, identity, brightness);
    assertTrue('bitmap color matrix mutation', bitmapMatrix.length == 20);

    final firstBitmap = createBitmap(4.0, 4.0, 4278190335.0);
    final secondBitmap = createBitmap(4.0, 4.0, 4294901760.0);
    final outBitmap = createBitmap(4.0, 4.0);
    final firstRegion = createBitmapRegion(firstBitmap);
    final secondRegion = createBitmapRegion(secondBitmap, 0.0, 0.0, 4.0, 4.0);
    final outRegion = createBitmapRegion(outBitmap, 0.0, 0.0, 4.0, 4.0);
    final firstFingerprint = createBitmapFingerprint(firstBitmap, 4.0);
    final secondFingerprint = createBitmapFingerprint(secondBitmap, 4.0);
    assertFinite('bitmap fingerprint comparison', compareBitmapFingerprints(firstFingerprint, secondFingerprint));
    getBitmapHistogram(firstRegion);
    applyBitmapLevels(outRegion, firstRegion);
    final clonedBitmap = cloneBitmap(firstBitmap);
    copyBitmapAlpha(outRegion, firstRegion);
    copyBitmapPixels(outRegion, firstRegion);
    assertFinite('dissolved bitmap seed', dissolveBitmapPixels(outRegion, firstRegion, 1.0, 4.0));
    equalizeBitmapHistogram(outRegion, firstRegion);
    fillBitmapNoise(outRegion, 1.0);
    fillBitmapPerlinNoise(outRegion, 2.0, 2.0, 1.0, 1.0);
    fillBitmapRectangle(outRegion, 4294967295.0);
    fillBitmapTurbulence(outRegion, 2.0, 2.0, 1.0, 1.0);
    flipBitmapHorizontal(outRegion, firstRegion);
    flipBitmapVertical(outRegion, firstRegion);
    floodFillBitmap(outBitmap, 1.0, 1.0, 4294967295.0);
    assertFinite('bitmap coverage', getBitmapCoverage(firstBitmap, 0.0));
    assertFinite('bitmap pixel', getBitmapPixel(firstBitmap, 0.0, 0.0));
    assertFinite('bitmap pixel luminance', getBitmapPixelLuminance(firstBitmap, 0.0, 0.0));
    assertFinite('bitmap pixel RGB', getBitmapPixelRgb(firstBitmap, 0.0, 0.0));
    invalidateBitmap(firstBitmap);
    mergeBitmap(outRegion, firstRegion, 1.0, 1.0, 1.0, 1.0);
    mergeBitmapChannels(outRegion, firstRegion, secondRegion, firstRegion, secondRegion);
    multiplyBitmapAlpha(outRegion, 0.5);
    rotateBitmap180(outRegion, firstRegion);
    rotateBitmapClockwise(outRegion, firstRegion);
    rotateBitmapCounterClockwise(outRegion, firstRegion);
    scrollBitmap(outBitmap, 1.0, 1.0);
    setBitmapAlpha(outRegion, 0.5);
    setBitmapPixel(outBitmap, 0.0, 0.0, 4294967295.0);
    setBitmapPixelRgb(outBitmap, 0.0, 0.0, 16777215.0);
    final resetRegion = setBitmapRegion(outRegion, secondBitmap);
    fillBitmapRectangle(resetRegion, 0.0);
    invalidateBitmap(clonedBitmap);
    invalidateBitmap(trimBitmap(firstBitmap));

    final spring = createSpring();
    final spring2D = createSpring2D();
    final spring3D = createSpring3D();
    final springConfig = createSpringConfig(2.0, 0.75);
    final physicalSpringConfig = createSpringConfigFromPhysical(100.0, 10.0, 1.0);
    addSpringImpulse(spring, 1.0);
    addSpringImpulse2D(spring2D, 1.0, -1.0);
    addSpringImpulse3D(spring3D, 1.0, -1.0, 0.5);
    updateSpring(spring, 1.0, springConfig, 1.0 / 60.0);
    updateSpring2D(spring2D, 1.0, -1.0, springConfig, 1.0 / 60.0);
    updateSpring3D(spring3D, 1.0, -1.0, 0.5, physicalSpringConfig, 1.0 / 60.0);
    updateSpringAngle(spring, 180.0, 360.0, springConfig, 1.0 / 60.0);
    isSpringSettled(spring, 1.0);
    isSpring2DSettled(spring2D, 1.0, -1.0);
    isSpring3DSettled(spring3D, 1.0, -1.0, 0.5);
    resetSpring(spring, 0.0);
    resetSpring2D(spring2D, 0.0, 0.0);
    resetSpring3D(spring3D, 0.0, 0.0, 0.0);

    createInputManager();
    createInputSignals();
    final inputState = createInputState();
    assertFinite('empty gamepad axis', getInputGamepadAxis(inputState, 0.0, 0.0));
    assertTrue('empty gamepad button', !isInputGamepadButtonDown(inputState, 0.0, 0.0));
    assertTrue('empty input key', !isInputKeyDown(inputState, 0.0));
    assertTrue('empty pointer button', !isInputPointerButtonDown(inputState, 0.0, 0.0));
    assertTrue('empty gamepad press', !wasInputGamepadButtonPressed(inputState, 0.0, 0.0));
    assertTrue('empty gamepad release', !wasInputGamepadButtonReleased(inputState, 0.0, 0.0));
    assertTrue('empty key press', !wasInputKeyPressed(inputState, 0.0));
    assertTrue('empty key release', !wasInputKeyReleased(inputState, 0.0));
    endInputStateFrame(inputState);

    createCameraShakeOffset();
    createGeolocationPosition();
    createPlatformInfo();
    final velocityField = createVelocityField();
    beginVelocityFrame(velocityField);

    final clipboardWatch = createClipboardWatch();
    detachClipboardWatch(clipboardWatch);
    disposeClipboardWatch(clipboardWatch);

    createDeviceCapabilities();
    createDeviceDisplayMetrics();
    createDeviceInfo();
    createSafeAreaInsets();

    final entityRuntime = createEntityRuntime();
    createGuardedEntityRuntime(entityRuntime);

    final power = createPower();
    enablePowerSignals(power);
    makePowerBatteryHealth();
    makePowerStatus();
    detachPower(power);
    disposePower(power);

    final protocolHandler = createProtocolHandler();
    detachProtocolHandler(protocolHandler);
    disposeProtocolHandler(protocolHandler);

    createScreenInfo();
    createScreenMode();
    final screenPermissionChange = createScreenPermissionChange();
    final screenSignals = createScreenSignals();
    detachScreenPermissionChange(screenPermissionChange);
    detachScreenSignals(screenSignals);
    disposeScreenPermissionChange(screenPermissionChange);
    disposeScreenSignals(screenSignals);

    createAmbientLightReading();
    createPressureReading();
    createProximityReading();
    createRotationRateReading();
    final motionOut = createMotionReading();
    final motionInput = createMotionReading();
    final orientationOut = createOrientationReading();
    final orientationInput = createOrientationReading();
    final quaternion = createQuaternionReading();
    computeQuaternionFromOrientationReading(quaternion, orientationInput);
    computeEulerFromQuaternion(orientationOut, quaternion);
    computeGravityFromOrientation(motionOut, orientationInput);
    computeScreenRelativeOrientation(orientationOut, orientationInput, 0.0);
    computeWorldAccelerationFromDeviceAcceleration(motionOut, motionInput, quaternion);
    final sensors = createSensors();
    detachSensors(sensors);
    disposeSensors(sensors);

    final colorOut = zeroes(4);
    clampLinearRgb(colorOut, -1.0, 0.5, 2.0);
    assertClose('clamped linear RGB low', colorOut[0], 0.0);
    assertClose('clamped linear RGB middle', colorOut[1], 0.5);
    assertClose('clamped linear RGB high', colorOut[2], 1.0);
    getRec2020LuminanceWeights(colorOut);
    getRec709LuminanceWeights(colorOut);
    hslToRgb(colorOut, 0.5, 0.75, 0.25);
    hsvToRgb(colorOut, 0.5, 0.75, 0.25);
    linearRgbToOklab(colorOut, 0.25, 0.5, 0.75);
    oklabToLinearRgb(colorOut, colorOut[0], colorOut[1], colorOut[2]);
    unpackColorRgba(colorOut, 4286595327.0);
    assertTrue('color output mutation', colorOut.length == 4);

    final samples = [1.0, 2.0, 3.0];
    assertClose('mean', mean(samples), 2.0);
    assertClose('median', median(samples), 2.0);
    assertFinite('standard deviation', standardDeviation(samples));
    assertFinite('variance', variance(samples));
    assertClose('weighted average', weightedAverage(samples, [1.0, 1.0, 2.0]), 2.25);

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
    assertClose('clampUnit low', clampUnit(-1.0), 0.0);
    assertClose('clampUnit high', clampUnit(2.0), 1.0);
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

  static function zeroes(length:Int):Array<Float> {
    return [for (_ in 0...length) 0.0];
  }

  static inline function report(message:String):Void {
    #if sys
    Sys.println(message);
    #else
    trace(message);
    #end
  }
}
