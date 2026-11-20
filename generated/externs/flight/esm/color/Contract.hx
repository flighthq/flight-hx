package flight.esm.color;

#if (js && flight_esm)
@:jsRequire("@flighthq/color/contract")
extern class Contract {
  public static final HslColor:Dynamic;
  public static final HsvColor:Dynamic;
  public static final LinearColor:Dynamic;
  public static function allocateHslColor():flight.esm.types.color_contract.Types.HslColorRaw;
  public static function allocateHsvColor():flight.esm.types.color_contract.Types.HsvColorRaw;
  public static function allocateLinearColor():flight.esm.types.color_contract.Types.LinearColorRaw;
  public static function clampLinearRgb(out:js.lib.Float32Array, r:Float, g:Float, b:Float):Void;
  public static function colorFromKelvin(kelvin:Float):Float;
  public static function computeRgbHexString(color:Float):String;
  public static function computeRgbaCssString(color:Float):String;
  public static function getColorAlpha(color:Float):Float;
  public static function getColorContrastRatio(a:Float, b:Float):Float;
  public static function getColorLuminance(color:Float):Float;
  public static function getColorRgb(color:Float):Float;
  public static function getRec2020LuminanceWeights(out:js.lib.Float32Array):Void;
  public static function getRec709LuminanceWeights(out:js.lib.Float32Array):Void;
  public static function hslToRgb(out:js.lib.Float32Array, h:Float, s:Float, l:Float):Void;
  public static function hsvToRgb(out:js.lib.Float32Array, h:Float, s:Float, v:Float):Void;
  public static function lerpColor(start:Float, end:Float, t:Float):Float;
  public static function lerpLinearColor(out:flight.esm.types.color_contract.Types.LinearColorRaw, start:flight.esm.types.color_contract.Types.LinearColorRaw, end:flight.esm.types.color_contract.Types.LinearColorRaw, t:Float):Void;
  public static function linearChannelToSrgb(value:Float):Float;
  public static function linearRgbToOklab(out:js.lib.Float32Array, r:Float, g:Float, b:Float):Void;
  public static function oklabToLinearRgb(out:js.lib.Float32Array, l:Float, a:Float, b:Float):Void;
  public static function packColor(r:Float, g:Float, b:Float, a:Float):Float;
  public static function packLinearChannelsToColor(r:Float, g:Float, b:Float, a:Float):Float;
  public static function packLinearToColor(color:flight.esm.types.color_contract.Types.LinearColorRaw):Float;
  public static function packOpaqueColor(rgb:Float):Float;
  public static function premultiplyColorAlpha(color:Float):Float;
  public static function rgbToHsl(out:flight.esm.types.color_contract.Types.HslColorRaw, color:Float):Void;
  public static function rgbToHsv(out:flight.esm.types.color_contract.Types.HsvColorRaw, color:Float):Void;
  public static function setColorAlpha(color:Float, alpha:Float):Float;
  public static function srgbChannelToLinear(value:Float):Float;
  public static function unpackColorRgba(out:js.lib.Float32Array, color:Float):Void;
  public static function unpackColorToLinear(out:flight.esm.types.color_contract.Types.LinearColorRaw, color:Float):Void;
  public static function unpremultiplyColorAlpha(color:Float):Float;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
