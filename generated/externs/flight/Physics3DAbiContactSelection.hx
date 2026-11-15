package flight;

abstract Physics3DAbiContactSelection(Int) from Int to Int {
	public static inline var All:Physics3DAbiContactSelection = 0;
	public static inline var Began:Physics3DAbiContactSelection = 1;
	public static inline var Ended:Physics3DAbiContactSelection = 2;
}
