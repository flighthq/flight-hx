package flight;

abstract AppMemoryPressure(Int) from Int to Int {
	public static inline var Normal:AppMemoryPressure = 0;
	public static inline var Moderate:AppMemoryPressure = 1;
	public static inline var Critical:AppMemoryPressure = 2;
}
