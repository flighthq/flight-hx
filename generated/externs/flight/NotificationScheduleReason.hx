package flight;

abstract NotificationScheduleReason(Int) from Int to Int {
	public static inline var InvalidSchedule:NotificationScheduleReason = 0;
	public static inline var OperationFailed:NotificationScheduleReason = 1;
	public static inline var PermissionDenied:NotificationScheduleReason = 2;
	public static inline var Scheduled:NotificationScheduleReason = 3;
}
