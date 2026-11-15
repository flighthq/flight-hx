package flight._cpp._fn;

extern class Color {
	@:native("flight_color_from_kelvin")
	public static function colorFromKelvin(kelvin:Single):Int;
	@:native("flight_allocate_hsl_color")
	public static function allocateHslColor():flight._cpp.HslColor;
	@:native("flight_hsl_to_rgb")
	public static function hslToRgb(out:cpp.Star<cpp.Void>, h:Single, s:Single, l:Single):Void;
	@:native("flight_rgb_to_hsl")
	public static function rgbToHsl(out:flight._cpp.HslColor, color:Int):Void;
	@:native("flight_allocate_hsv_color")
	public static function allocateHsvColor():flight._cpp.HsvColor;
	@:native("flight_hsv_to_rgb")
	public static function hsvToRgb(out:cpp.Star<cpp.Void>, h:Single, s:Single, v:Single):Void;
	@:native("flight_rgb_to_hsv")
	public static function rgbToHsv(out:flight._cpp.HsvColor, color:Int):Void;
	@:native("flight_lerp_color")
	public static function lerpColor(start:Int, end:Int, t:Single):Int;
	@:native("flight_lerp_linear_color")
	public static function lerpLinearColor(out:flight._cpp.LinearColor, start:flight._cpp.LinearColor, end:flight._cpp.LinearColor, t:Single):Void;
	@:native("flight_get_color_contrast_ratio")
	public static function getColorContrastRatio(a:Int, b:Int):Single;
	@:native("flight_get_color_luminance")
	public static function getColorLuminance(color:Int):Single;
	@:native("flight_get_rec2020_luminance_weights")
	public static function getRec2020LuminanceWeights(out:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_rec709_luminance_weights")
	public static function getRec709LuminanceWeights(out:cpp.Star<cpp.Void>):Void;
	@:native("flight_clamp_linear_rgb")
	public static function clampLinearRgb(out:cpp.Star<cpp.Void>, r:Single, g:Single, b:Single):Void;
	@:native("flight_linear_rgb_to_oklab")
	public static function linearRgbToOklab(out:cpp.Star<cpp.Void>, r:Single, g:Single, b:Single):Void;
	@:native("flight_oklab_to_linear_rgb")
	public static function oklabToLinearRgb(out:cpp.Star<cpp.Void>, l:Single, a:Single, b:Single):Void;
	@:native("flight_allocate_linear_color")
	public static function allocateLinearColor():flight._cpp.LinearColor;
	@:native("flight_compute_rgb_hex_string")
	public static function computeRgbHexString(color:Int):cpp.ConstCharStar;
	@:native("flight_compute_rgba_css_string")
	public static function computeRgbaCssString(color:Int):cpp.ConstCharStar;
	@:native("flight_get_color_alpha")
	public static function getColorAlpha(color:Int):Single;
	@:native("flight_get_color_rgb")
	public static function getColorRgb(color:Int):Int;
	@:native("flight_pack_color")
	public static function packColor(r:Single, g:Single, b:Single, a:Single):Int;
	@:native("flight_pack_linear_channels_to_color")
	public static function packLinearChannelsToColor(r:Single, g:Single, b:Single, a:Single):Int;
	@:native("flight_pack_linear_to_color")
	public static function packLinearToColor(color:flight._cpp.LinearColor):Int;
	@:native("flight_pack_opaque_color")
	public static function packOpaqueColor(rgb:Int):Int;
	@:native("flight_set_color_alpha")
	public static function setColorAlpha(color:Int, alpha:Single):Int;
	@:native("flight_unpack_color_rgba")
	public static function unpackColorRgba(out:cpp.Star<cpp.Void>, color:Int):Void;
	@:native("flight_unpack_color_to_linear")
	public static function unpackColorToLinear(out:flight._cpp.LinearColor, color:Int):Void;
	@:native("flight_premultiply_color_alpha")
	public static function premultiplyColorAlpha(color:Int):Int;
	@:native("flight_unpremultiply_color_alpha")
	public static function unpremultiplyColorAlpha(color:Int):Int;
	@:native("flight_linear_channel_to_srgb")
	public static function linearChannelToSrgb(value:Single):Single;
	@:native("flight_srgb_channel_to_linear")
	public static function srgbChannelToLinear(value:Single):Single;
	@:native("flight_free_hsl_color")
	public static function freeHslColor(ptr:flight._cpp.HslColor):Void;
	@:native("flight_free_hsv_color")
	public static function freeHsvColor(ptr:flight._cpp.HsvColor):Void;
	@:native("flight_free_linear_color")
	public static function freeLinearColor(ptr:flight._cpp.LinearColor):Void;
}
