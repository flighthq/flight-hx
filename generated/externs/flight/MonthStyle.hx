package flight;

abstract MonthStyle(Int) from Int to Int {
	public static inline var Numeric:MonthStyle = 0;
	public static inline var TwoDigit:MonthStyle = 1;
	public static inline var Long:MonthStyle = 2;
	public static inline var Short:MonthStyle = 3;
	public static inline var Narrow:MonthStyle = 4;
}
