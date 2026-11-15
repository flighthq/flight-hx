package flight._hl._fn;

extern class Color {
	@:hlNative("flight", "flight_color_from_kelvin")
	public static function colorFromKelvin(kelvin:Single):Int;
	@:hlNative("flight", "flight_allocate_hsl_color")
	public static function allocateHslColor():flight._hl.HslColor;
	@:hlNative("flight", "flight_hsl_to_rgb")
	public static function hslToRgb(out:hl.Bytes, h:Single, s:Single, l:Single):Void;
	@:hlNative("flight", "flight_rgb_to_hsl")
	public static function rgbToHsl(out:flight._hl.HslColor, color:Int):Void;
	@:hlNative("flight", "flight_allocate_hsv_color")
	public static function allocateHsvColor():flight._hl.HsvColor;
	@:hlNative("flight", "flight_hsv_to_rgb")
	public static function hsvToRgb(out:hl.Bytes, h:Single, s:Single, v:Single):Void;
	@:hlNative("flight", "flight_rgb_to_hsv")
	public static function rgbToHsv(out:flight._hl.HsvColor, color:Int):Void;
	@:hlNative("flight", "flight_lerp_color")
	public static function lerpColor(start:Int, end:Int, t:Single):Int;
	@:hlNative("flight", "flight_lerp_linear_color")
	public static function lerpLinearColor(out:flight._hl.LinearColor, start:flight._hl.LinearColor, end:flight._hl.LinearColor, t:Single):Void;
	@:hlNative("flight", "flight_get_color_contrast_ratio")
	public static function getColorContrastRatio(a:Int, b:Int):Single;
	@:hlNative("flight", "flight_get_color_luminance")
	public static function getColorLuminance(color:Int):Single;
	@:hlNative("flight", "flight_get_rec2020_luminance_weights")
	public static function getRec2020LuminanceWeights(out:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_rec709_luminance_weights")
	public static function getRec709LuminanceWeights(out:hl.Bytes):Void;
	@:hlNative("flight", "flight_clamp_linear_rgb")
	public static function clampLinearRgb(out:hl.Bytes, r:Single, g:Single, b:Single):Void;
	@:hlNative("flight", "flight_linear_rgb_to_oklab")
	public static function linearRgbToOklab(out:hl.Bytes, r:Single, g:Single, b:Single):Void;
	@:hlNative("flight", "flight_oklab_to_linear_rgb")
	public static function oklabToLinearRgb(out:hl.Bytes, l:Single, a:Single, b:Single):Void;
	@:hlNative("flight", "flight_allocate_linear_color")
	public static function allocateLinearColor():flight._hl.LinearColor;
	@:hlNative("flight", "flight_compute_rgb_hex_string")
	public static function computeRgbHexString(color:Int):hl.Bytes;
	@:hlNative("flight", "flight_compute_rgba_css_string")
	public static function computeRgbaCssString(color:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_color_alpha")
	public static function getColorAlpha(color:Int):Single;
	@:hlNative("flight", "flight_get_color_rgb")
	public static function getColorRgb(color:Int):Int;
	@:hlNative("flight", "flight_pack_color")
	public static function packColor(r:Single, g:Single, b:Single, a:Single):Int;
	@:hlNative("flight", "flight_pack_linear_channels_to_color")
	public static function packLinearChannelsToColor(r:Single, g:Single, b:Single, a:Single):Int;
	@:hlNative("flight", "flight_pack_linear_to_color")
	public static function packLinearToColor(color:flight._hl.LinearColor):Int;
	@:hlNative("flight", "flight_pack_opaque_color")
	public static function packOpaqueColor(rgb:Int):Int;
	@:hlNative("flight", "flight_set_color_alpha")
	public static function setColorAlpha(color:Int, alpha:Single):Int;
	@:hlNative("flight", "flight_unpack_color_rgba")
	public static function unpackColorRgba(out:hl.Bytes, color:Int):Void;
	@:hlNative("flight", "flight_unpack_color_to_linear")
	public static function unpackColorToLinear(out:flight._hl.LinearColor, color:Int):Void;
	@:hlNative("flight", "flight_premultiply_color_alpha")
	public static function premultiplyColorAlpha(color:Int):Int;
	@:hlNative("flight", "flight_unpremultiply_color_alpha")
	public static function unpremultiplyColorAlpha(color:Int):Int;
	@:hlNative("flight", "flight_linear_channel_to_srgb")
	public static function linearChannelToSrgb(value:Single):Single;
	@:hlNative("flight", "flight_srgb_channel_to_linear")
	public static function srgbChannelToLinear(value:Single):Single;
	@:hlNative("flight", "flight_free_hsl_color")
	public static function freeHslColor(ptr:flight._hl.HslColor):Void;
	@:hlNative("flight", "flight_free_hsv_color")
	public static function freeHsvColor(ptr:flight._hl.HsvColor):Void;
	@:hlNative("flight", "flight_free_linear_color")
	public static function freeLinearColor(ptr:flight._hl.LinearColor):Void;
}
