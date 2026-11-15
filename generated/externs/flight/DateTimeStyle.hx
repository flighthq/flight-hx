package flight;

abstract DateTimeStyle(Int) from Int to Int {
	public static inline var Full:DateTimeStyle = 0;
	public static inline var Long:DateTimeStyle = 1;
	public static inline var Medium:DateTimeStyle = 2;
	public static inline var Short:DateTimeStyle = 3;
}
