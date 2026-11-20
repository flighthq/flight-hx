package flight;

abstract FileWatchEventType(Int) from Int to Int {
	public static inline var Created:FileWatchEventType = 0;
	public static inline var Deleted:FileWatchEventType = 1;
	public static inline var Modified:FileWatchEventType = 2;
}
