package flight;

abstract PowerBatteryHealthState(Int) from Int to Int {
	public static inline var Good:PowerBatteryHealthState = 0;
	public static inline var Fair:PowerBatteryHealthState = 1;
	public static inline var Poor:PowerBatteryHealthState = 2;
	public static inline var Unknown:PowerBatteryHealthState = 3;
}
