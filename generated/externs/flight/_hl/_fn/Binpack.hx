package flight._hl._fn;

extern class Binpack {
	@:hlNative("flight", "flight_explain_unpacked_rectangles")
	public static function explainUnpackedRectangles(out:hl.Bytes, rectangles:hl.Bytes, rectanglesLen:Int, options:flight._hl.BinPackOptions):Void;
	@:hlNative("flight", "flight_get_pack_result_occupancy")
	public static function getPackResultOccupancy(result:flight._hl.PackResult):Single;
	@:hlNative("flight", "flight_pack_rectangles")
	public static function packRectangles(rects:hl.Bytes, rectsLen:Int, options:flight._hl.BinPackOptions):flight._hl.PackResult;
	@:hlNative("flight", "flight_free_pack_result")
	public static function freePackResult(ptr:flight._hl.PackResult):Void;
}
