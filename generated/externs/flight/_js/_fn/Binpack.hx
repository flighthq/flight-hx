package flight._js._fn;

@:jsRequire("@flighthq/binpack")
extern class Binpack {
	@:native("explainUnpackedRectangles")
	public static function explainUnpackedRectangles(out:Dynamic, rectangles:Dynamic, options:Null<flight._js.BinPackOptions>):Void;
	@:native("getPackResultOccupancy")
	public static function getPackResultOccupancy(result:flight._js.PackResult):Float;
	@:native("packRectangles")
	public static function packRectangles(rects:Dynamic, options:Null<flight._js.BinPackOptions>):flight._js.PackResult;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePackResult(ptr:flight._js.PackResult):Void {}
}
