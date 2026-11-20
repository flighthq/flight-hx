package flight;

abstract NotificationSchedulePrecision(Int) from Int to Int {
	public static inline var Exact:NotificationSchedulePrecision = 0;
	public static inline var Inexact:NotificationSchedulePrecision = 1;
}
