package flight._js._fn;

@:jsRequire("flight")
extern class PathFormats {
	@:native("flight_append_svg_path_data")
	public static function appendSvgPathData(path:flight._js.Path, d:String):Bool;
	@:native("flight_explain_svg_path_data")
	public static function explainSvgPathData(d:String):Dynamic;
	@:native("flight_format_svg_path_data")
	public static function formatSvgPathData(path:flight._js.Path, options:flight._js.SvgPathDataFormatOptions):String;
	@:native("flight_parse_svg_path_data")
	public static function parseSvgPathData(d:String):Dynamic;
	@:native("flight_free_svg_path_data_explanation")
	public static function freeSvgPathDataExplanation(ptr:flight._js.SvgPathDataExplanation):Void;
}
