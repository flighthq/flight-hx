package flight;

abstract RelativeTimeStyle(Int) from Int to Int {
	public static inline var Long:RelativeTimeStyle = 0;
	public static inline var Short:RelativeTimeStyle = 1;
	public static inline var Narrow:RelativeTimeStyle = 2;
}
