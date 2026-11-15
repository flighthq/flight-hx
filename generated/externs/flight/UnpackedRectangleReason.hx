package flight;

abstract UnpackedRectangleReason(Int) from Int to Int {
	public static inline var Oversized:UnpackedRectangleReason = 0;
	public static inline var RegionCollapsed:UnpackedRectangleReason = 1;
	public static inline var BinExhausted:UnpackedRectangleReason = 2;
}
