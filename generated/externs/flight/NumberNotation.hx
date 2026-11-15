package flight;

abstract NumberNotation(Int) from Int to Int {
	public static inline var Standard:NumberNotation = 0;
	public static inline var Scientific:NumberNotation = 1;
	public static inline var Engineering:NumberNotation = 2;
	public static inline var Compact:NumberNotation = 3;
}
