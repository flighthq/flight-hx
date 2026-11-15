package flight;

abstract ClipRegionContoursReason(Int) from Int to Int {
	public static inline var OddCoordinateCount:ClipRegionContoursReason = 0;
	public static inline var TooFewPoints:ClipRegionContoursReason = 1;
}
