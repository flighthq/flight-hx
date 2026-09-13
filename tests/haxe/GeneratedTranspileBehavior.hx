import flight.Color;
import flight.Math;

/** Deterministic vectors shared with the JavaScript Flight behavioral oracle. */
class GeneratedTranspileBehavior {
  static function main():Void {
    final hsl:Array<Float> = [];
    hslToRgb(hsl, 0.25, 0.6, 0.4);
    final hsv:Array<Float> = [];
    hsvToRgb(hsv, 0.75, 0.8, 0.9);
    final rgbHsl = allocateHslColor();
    rgbToHsl(rgbHsl, 4281558681);
    final rgbHsv = allocateHsvColor();
    rgbToHsv(rgbHsv, 4281558681);

    final randomValues = [0.25, 0.75];
    var randomIndex = 0;
    final gaussianPair = randomGaussianPair(() -> randomValues[randomIndex++], 1.5, 0.75);

    final result = {
      approx: [approxEqual(1, 1.0000001), approxZero(0.0000001)],
      clamp: [clamp(-2, -1, 3), clamp(5, -1, 3), saturate(0.25)],
      color: [
        colorFromKelvin(2000),
        colorFromKelvin(6500),
        colorFromKelvin(12000),
        getColorLuminance(4281558681),
        getColorContrastRatio(4278190080, 4294967295),
      ],
      easingMath: [smoothStep(0, 1, 0.3), smootherStep(0, 1, 0.3), pingPong(7.5, 2)],
      gaussianPair: gaussianPair,
      hsl: hsl,
      hsv: hsv,
      integerMath: [factorial(7), gcd(84, 30), lcm(12, 18), nextPowerOfTwo(33), previousPowerOfTwo(33)],
      interpolation: [inverseLerp(10, 30, 15), lerp(-4, 8, 0.25), remap(5, 0, 10, -1, 1)],
      rgbHsl: rgbHsl,
      rgbHsv: rgbHsv,
      transfer: [
        srgbChannelToLinear(0.42),
        linearChannelToSrgb(0.18),
        premultiplyColorAlpha(2151686160),
        unpremultiplyColorAlpha(2150637576),
      ],
    };
    js.Syntax.code('console.log(JSON.stringify({0}))', result);
  }
}
