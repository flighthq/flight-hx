// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

inline function computeAcesToneMap(x:Float):Float {
  return flight._cpp._fn.Effects.computeAcesToneMap(x);
}

inline function computeBoxBlurPassRadius(sigma:Float, passes:Float, pass:Float):Float {
  return flight._cpp._fn.Effects.computeBoxBlurPassRadius(sigma, passes, pass);
}

inline function computeBoxBlurRadius(sigma:Float, passes:Float):Float {
  return flight._cpp._fn.Effects.computeBoxBlurRadius(sigma, passes);
}

inline function computeDepthOfFieldCoc(depth:Float, focusDistance:Float, aperture:Float, focalLength:Float):Float {
  return flight._cpp._fn.Effects.computeDepthOfFieldCoc(depth, focusDistance, aperture, focalLength);
}

inline function computeExposureScale(exposure:Float):Float {
  return flight._cpp._fn.Effects.computeExposureScale(exposure);
}

inline function computeGaussianRadiusFromSigma(sigma:Float):Float {
  return flight._cpp._fn.Effects.computeGaussianRadiusFromSigma(sigma);
}

inline function computeGaussianSigmaForBlurRadius(radius:Float, passes:Float):Float {
  return flight._cpp._fn.Effects.computeGaussianSigmaForBlurRadius(radius, passes);
}

inline function computeGaussianSigmaFromRadius(radius:Float):Float {
  return flight._cpp._fn.Effects.computeGaussianSigmaFromRadius(radius);
}

inline function computeLinearDepthFromNonlinear(depth:Float, near:Float, far:Float):Float {
  return flight._cpp._fn.Effects.computeLinearDepthFromNonlinear(depth, near, far);
}

inline function computeReinhardExtendedToneMap(x:Float, white:Float):Float {
  return flight._cpp._fn.Effects.computeReinhardExtendedToneMap(x, white);
}

inline function computeReinhardToneMap(x:Float):Float {
  return flight._cpp._fn.Effects.computeReinhardToneMap(x);
}

inline function computeUncharted2ToneMap(x:Float):Float {
  return flight._cpp._fn.Effects.computeUncharted2ToneMap(x);
}

inline function getBlurDownsampleLevel(sigma:Float):Float {
  return flight._cpp._fn.Effects.getBlurDownsampleLevel(sigma);
}

inline function getBlurResidualSigma(sigma:Float, level:Float):Float {
  return flight._cpp._fn.Effects.getBlurResidualSigma(sigma, level);
}

inline function getGaussianKernelSize(sigma:Float):Float {
  return flight._cpp._fn.Effects.getGaussianKernelSize(sigma);
}

inline function getLinearSampledGaussianTapCount(sigma:Float):Float {
  return flight._cpp._fn.Effects.getLinearSampledGaussianTapCount(sigma);
}
