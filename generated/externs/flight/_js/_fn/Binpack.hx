package flight._js._fn;

@:jsRequire("flight")
extern class Binpack {
	@:native("flight_explain_unpacked_rectangles")
	public static function explainUnpackedRectangles(out:Dynamic, rectangles:Dynamic, rectanglesLen:Int, options:flight._js.BinPackOptions):Void;
	@:native("flight_get_pack_result_occupancy")
	public static function getPackResultOccupancy(result:flight._js.PackResult):Float;
	@:native("flight_pack_rectangles")
	public static function packRectangles(rects:Dynamic, rectsLen:Int, options:flight._js.BinPackOptions):flight._js.PackResult;
	@:native("flight_free_pack_result")
	public static function freePackResult(ptr:flight._js.PackResult):Void;
}
