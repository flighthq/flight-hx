package flight;

abstract CapsStyle(Int) from Int to Int {
	public static inline var None:CapsStyle = 0;
	public static inline var Round:CapsStyle = 1;
	public static inline var Square:CapsStyle = 2;
}
