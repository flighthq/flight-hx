package flight;

abstract Physics2DAbiContactSelection(Int) from Int to Int {
	public static inline var All:Physics2DAbiContactSelection = 0;
	public static inline var Began:Physics2DAbiContactSelection = 1;
	public static inline var Ended:Physics2DAbiContactSelection = 2;
}
