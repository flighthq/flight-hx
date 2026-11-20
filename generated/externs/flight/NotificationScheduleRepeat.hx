package flight;

abstract NotificationScheduleRepeat(Int) from Int to Int {
	public static inline var Day:NotificationScheduleRepeat = 0;
	public static inline var Hour:NotificationScheduleRepeat = 1;
	public static inline var Minute:NotificationScheduleRepeat = 2;
	public static inline var Month:NotificationScheduleRepeat = 3;
	public static inline var Week:NotificationScheduleRepeat = 4;
	public static inline var Year:NotificationScheduleRepeat = 5;
}
