package flight._js._fn;

@:jsRequire("flight")
extern class Color {
	@:native("flight_color_from_kelvin")
	public static function colorFromKelvin(kelvin:Float):Int;
	@:native("flight_allocate_hsl_color")
	public static function allocateHslColor():flight._js.HslColor;
	@:native("flight_hsl_to_rgb")
	public static function hslToRgb(out:Dynamic, h:Float, s:Float, l:Float):Void;
	@:native("flight_rgb_to_hsl")
	public static function rgbToHsl(out:flight._js.HslColor, color:Int):Void;
	@:native("flight_allocate_hsv_color")
	public static function allocateHsvColor():flight._js.HsvColor;
	@:native("flight_hsv_to_rgb")
	public static function hsvToRgb(out:Dynamic, h:Float, s:Float, v:Float):Void;
	@:native("flight_rgb_to_hsv")
	public static function rgbToHsv(out:flight._js.HsvColor, color:Int):Void;
	@:native("flight_lerp_color")
	public static function lerpColor(start:Int, end:Int, t:Float):Int;
	@:native("flight_lerp_linear_color")
	public static function lerpLinearColor(out:flight._js.LinearColor, start:flight._js.LinearColor, end:flight._js.LinearColor, t:Float):Void;
	@:native("flight_get_color_contrast_ratio")
	public static function getColorContrastRatio(a:Int, b:Int):Float;
	@:native("flight_get_color_luminance")
	public static function getColorLuminance(color:Int):Float;
	@:native("flight_get_rec2020_luminance_weights")
	public static function getRec2020LuminanceWeights(out:Dynamic):Void;
	@:native("flight_get_rec709_luminance_weights")
	public static function getRec709LuminanceWeights(out:Dynamic):Void;
	@:native("flight_clamp_linear_rgb")
	public static function clampLinearRgb(out:Dynamic, r:Float, g:Float, b:Float):Void;
	@:native("flight_linear_rgb_to_oklab")
	public static function linearRgbToOklab(out:Dynamic, r:Float, g:Float, b:Float):Void;
	@:native("flight_oklab_to_linear_rgb")
	public static function oklabToLinearRgb(out:Dynamic, l:Float, a:Float, b:Float):Void;
	@:native("flight_allocate_linear_color")
	public static function allocateLinearColor():flight._js.LinearColor;
	@:native("flight_compute_rgb_hex_string")
	public static function computeRgbHexString(color:Int):String;
	@:native("flight_compute_rgba_css_string")
	public static function computeRgbaCssString(color:Int):String;
	@:native("flight_get_color_alpha")
	public static function getColorAlpha(color:Int):Float;
	@:native("flight_get_color_rgb")
	public static function getColorRgb(color:Int):Int;
	@:native("flight_pack_color")
	public static function packColor(r:Float, g:Float, b:Float, a:Float):Int;
	@:native("flight_pack_linear_channels_to_color")
	public static function packLinearChannelsToColor(r:Float, g:Float, b:Float, a:Float):Int;
	@:native("flight_pack_linear_to_color")
	public static function packLinearToColor(color:flight._js.LinearColor):Int;
	@:native("flight_pack_opaque_color")
	public static function packOpaqueColor(rgb:Int):Int;
	@:native("flight_set_color_alpha")
	public static function setColorAlpha(color:Int, alpha:Float):Int;
	@:native("flight_unpack_color_rgba")
	public static function unpackColorRgba(out:Dynamic, color:Int):Void;
	@:native("flight_unpack_color_to_linear")
	public static function unpackColorToLinear(out:flight._js.LinearColor, color:Int):Void;
	@:native("flight_premultiply_color_alpha")
	public static function premultiplyColorAlpha(color:Int):Int;
	@:native("flight_unpremultiply_color_alpha")
	public static function unpremultiplyColorAlpha(color:Int):Int;
	@:native("flight_linear_channel_to_srgb")
	public static function linearChannelToSrgb(value:Float):Float;
	@:native("flight_srgb_channel_to_linear")
	public static function srgbChannelToLinear(value:Float):Float;
	@:native("flight_free_hsl_color")
	public static function freeHslColor(ptr:flight._js.HslColor):Void;
	@:native("flight_free_hsv_color")
	public static function freeHsvColor(ptr:flight._js.HsvColor):Void;
	@:native("flight_free_linear_color")
	public static function freeLinearColor(ptr:flight._js.LinearColor):Void;
}
