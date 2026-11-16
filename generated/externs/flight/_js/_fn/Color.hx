package flight._js._fn;

@:jsRequire("@flighthq/color")
extern class Color {
	@:native("colorFromKelvin")
	public static function colorFromKelvin(kelvin:Float):Int;
	@:native("allocateHslColor")
	public static function allocateHslColor():flight._js.HslColor;
	@:native("hslToRgb")
	public static function hslToRgb(out:Dynamic, h:Float, s:Float, l:Float):Void;
	@:native("rgbToHsl")
	public static function rgbToHsl(out:flight._js.HslColor, color:Int):Void;
	@:native("allocateHsvColor")
	public static function allocateHsvColor():flight._js.HsvColor;
	@:native("hsvToRgb")
	public static function hsvToRgb(out:Dynamic, h:Float, s:Float, v:Float):Void;
	@:native("rgbToHsv")
	public static function rgbToHsv(out:flight._js.HsvColor, color:Int):Void;
	@:native("lerpColor")
	public static function lerpColor(start:Int, end:Int, t:Float):Int;
	@:native("lerpLinearColor")
	public static function lerpLinearColor(out:flight._js.LinearColor, start:flight._js.LinearColor, end:flight._js.LinearColor, t:Float):Void;
	@:native("getColorContrastRatio")
	public static function getColorContrastRatio(a:Int, b:Int):Float;
	@:native("getColorLuminance")
	public static function getColorLuminance(color:Int):Float;
	@:native("getRec2020LuminanceWeights")
	public static function getRec2020LuminanceWeights(out:Dynamic):Void;
	@:native("getRec709LuminanceWeights")
	public static function getRec709LuminanceWeights(out:Dynamic):Void;
	@:native("clampLinearRgb")
	public static function clampLinearRgb(out:Dynamic, r:Float, g:Float, b:Float):Void;
	@:native("linearRgbToOklab")
	public static function linearRgbToOklab(out:Dynamic, r:Float, g:Float, b:Float):Void;
	@:native("oklabToLinearRgb")
	public static function oklabToLinearRgb(out:Dynamic, l:Float, a:Float, b:Float):Void;
	@:native("allocateLinearColor")
	public static function allocateLinearColor():flight._js.LinearColor;
	@:native("computeRgbHexString")
	public static function computeRgbHexString(color:Int):String;
	@:native("computeRgbaCssString")
	public static function computeRgbaCssString(color:Int):String;
	@:native("getColorAlpha")
	public static function getColorAlpha(color:Int):Float;
	@:native("getColorRgb")
	public static function getColorRgb(color:Int):Int;
	@:native("packColor")
	public static function packColor(r:Float, g:Float, b:Float, a:Float):Int;
	@:native("packLinearChannelsToColor")
	public static function packLinearChannelsToColor(r:Float, g:Float, b:Float, a:Float):Int;
	@:native("packLinearToColor")
	public static function packLinearToColor(color:flight._js.LinearColor):Int;
	@:native("packOpaqueColor")
	public static function packOpaqueColor(rgb:Int):Int;
	@:native("setColorAlpha")
	public static function setColorAlpha(color:Int, alpha:Float):Int;
	@:native("unpackColorRgba")
	public static function unpackColorRgba(out:Dynamic, color:Int):Void;
	@:native("unpackColorToLinear")
	public static function unpackColorToLinear(out:flight._js.LinearColor, color:Int):Void;
	@:native("premultiplyColorAlpha")
	public static function premultiplyColorAlpha(color:Int):Int;
	@:native("unpremultiplyColorAlpha")
	public static function unpremultiplyColorAlpha(color:Int):Int;
	@:native("linearChannelToSrgb")
	public static function linearChannelToSrgb(value:Float):Float;
	@:native("srgbChannelToLinear")
	public static function srgbChannelToLinear(value:Float):Float;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeHslColor(ptr:flight._js.HslColor):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeHsvColor(ptr:flight._js.HsvColor):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeLinearColor(ptr:flight._js.LinearColor):Void {}
}
