package flight._js._fn;

@:jsRequire("@flighthq/path-formats")
extern class PathFormats {
	@:native("appendSvgPathData")
	public static function appendSvgPathData(path:flight._js.Path, d:String):Bool;
	@:native("explainSvgPathData")
	public static function explainSvgPathData(d:String):Null<flight._js.SvgPathDataExplanation>;
	@:native("formatSvgPathData")
	public static function formatSvgPathData(path:flight._js.Path, options:Null<flight._js.SvgPathDataFormatOptions>):String;
	@:native("parseSvgPathData")
	public static function parseSvgPathData(d:String):Null<flight._js.Path>;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSvgPathDataExplanation(ptr:flight._js.SvgPathDataExplanation):Void {}
}
