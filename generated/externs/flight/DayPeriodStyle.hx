package flight;

abstract DayPeriodStyle(Int) from Int to Int {
	public static inline var Narrow:DayPeriodStyle = 0;
	public static inline var Short:DayPeriodStyle = 1;
	public static inline var Long:DayPeriodStyle = 2;
}
