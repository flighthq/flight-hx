package flight;

abstract AssetLoadStatus(Int) from Int to Int {
	public static inline var Freed:AssetLoadStatus = 0;
	public static inline var Loading:AssetLoadStatus = 1;
	public static inline var MissingDescriptor:AssetLoadStatus = 2;
	public static inline var MissingLoader:AssetLoadStatus = 3;
	public static inline var NeverAcquired:AssetLoadStatus = 4;
	public static inline var Resident:AssetLoadStatus = 5;
}
