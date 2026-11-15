package flight;

abstract ClipRegionStatus(Int) from Int to Int {
	public static inline var Active:ClipRegionStatus = 0;
	public static inline var Released:ClipRegionStatus = 1;
}
