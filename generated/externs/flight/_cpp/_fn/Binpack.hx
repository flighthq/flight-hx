package flight._cpp._fn;

extern class Binpack {
	@:native("flight_explain_unpacked_rectangles")
	public static function explainUnpackedRectangles(out:cpp.Star<cpp.Void>, rectangles:cpp.Star<cpp.Void>, rectanglesLen:Int, options:flight._cpp.BinPackOptions):Void;
	@:native("flight_get_pack_result_occupancy")
	public static function getPackResultOccupancy(result:flight._cpp.PackResult):Single;
	@:native("flight_pack_rectangles")
	public static function packRectangles(rects:cpp.Star<cpp.Void>, rectsLen:Int, options:flight._cpp.BinPackOptions):flight._cpp.PackResult;
	@:native("flight_free_pack_result")
	public static function freePackResult(ptr:flight._cpp.PackResult):Void;
}
