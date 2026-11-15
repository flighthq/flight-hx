package flight;

abstract BevelType(Int) from Int to Int {
	public static inline var Full:BevelType = 0;
	public static inline var Inner:BevelType = 1;
	public static inline var Outer:BevelType = 2;
}
