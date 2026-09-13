import * as color from '@flighthq/color/contract';
import * as math from '@flighthq/math/contract';

export function collectTranspiledBehavior() {
  const hsl = [];
  color.hslToRgb(hsl, 0.25, 0.6, 0.4);
  const hsv = [];
  color.hsvToRgb(hsv, 0.75, 0.8, 0.9);
  const rgbHsl = color.allocateHslColor();
  color.rgbToHsl(rgbHsl, 4281558681);
  const rgbHsv = color.allocateHsvColor();
  color.rgbToHsv(rgbHsv, 4281558681);

  const randomValues = [0.25, 0.75];
  let randomIndex = 0;
  const gaussianPair = math.randomGaussianPair(() => randomValues[randomIndex++], 1.5, 0.75);

  return {
    approx: [math.approxEqual(1, 1.0000001), math.approxZero(0.0000001)],
    clamp: [math.clamp(-2, -1, 3), math.clamp(5, -1, 3), math.saturate(0.25)],
    color: [
      color.colorFromKelvin(2000),
      color.colorFromKelvin(6500),
      color.colorFromKelvin(12000),
      color.getColorLuminance(4281558681),
      color.getColorContrastRatio(4278190080, 4294967295),
    ],
    easingMath: [math.smoothStep(0, 1, 0.3), math.smootherStep(0, 1, 0.3), math.pingPong(7.5, 2)],
    gaussianPair,
    hsl,
    hsv,
    integerMath: [math.factorial(7), math.gcd(84, 30), math.lcm(12, 18), math.nextPowerOfTwo(33), math.previousPowerOfTwo(33)],
    interpolation: [math.inverseLerp(10, 30, 15), math.lerp(-4, 8, 0.25), math.remap(5, 0, 10, -1, 1)],
    rgbHsl,
    rgbHsv,
    transfer: [
      color.srgbChannelToLinear(0.42),
      color.linearChannelToSrgb(0.18),
      color.premultiplyColorAlpha(2151686160),
      color.unpremultiplyColorAlpha(2150637576),
    ],
  };
}
