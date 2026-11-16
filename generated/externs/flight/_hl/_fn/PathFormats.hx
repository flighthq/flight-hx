package flight._hl._fn;

extern class PathFormats {
	@:hlNative("flight", "flight_append_svg_path_data")
	public static function appendSvgPathData(path:flight._hl.Path, d:hl.Bytes):Bool;
	@:hlNative("flight", "flight_explain_svg_path_data")
	public static function explainSvgPathData(d:hl.Bytes):flight._hl.SvgPathDataExplanation;
	@:hlNative("flight", "flight_format_svg_path_data")
	public static function formatSvgPathData(path:flight._hl.Path, options:flight._hl.SvgPathDataFormatOptions):hl.Bytes;
	@:hlNative("flight", "flight_parse_svg_path_data")
	public static function parseSvgPathData(d:hl.Bytes):flight._hl.Path;
	@:hlNative("flight", "flight_free_svg_path_data_explanation")
	public static function freeSvgPathDataExplanation(ptr:flight._hl.SvgPathDataExplanation):Void;
}
