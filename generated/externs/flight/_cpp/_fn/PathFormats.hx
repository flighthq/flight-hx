package flight._cpp._fn;

extern class PathFormats {
	@:native("flight_append_svg_path_data")
	public static function appendSvgPathData(path:flight._cpp.Path, d:cpp.ConstCharStar):Bool;
	@:native("flight_explain_svg_path_data")
	public static function explainSvgPathData(d:cpp.ConstCharStar):flight._cpp.SvgPathDataExplanation;
	@:native("flight_format_svg_path_data")
	public static function formatSvgPathData(path:flight._cpp.Path, options:flight._cpp.SvgPathDataFormatOptions):cpp.ConstCharStar;
	@:native("flight_parse_svg_path_data")
	public static function parseSvgPathData(d:cpp.ConstCharStar):flight._cpp.Path;
	@:native("flight_free_svg_path_data_explanation")
	public static function freeSvgPathDataExplanation(ptr:flight._cpp.SvgPathDataExplanation):Void;
}
