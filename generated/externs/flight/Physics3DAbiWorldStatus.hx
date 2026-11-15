package flight;

abstract Physics3DAbiWorldStatus(Int) from Int to Int {
	public static inline var Busy:Physics3DAbiWorldStatus = 0;
	public static inline var Ready:Physics3DAbiWorldStatus = 1;
	public static inline var Stale:Physics3DAbiWorldStatus = 2;
}
