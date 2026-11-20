package flight;

abstract NotificationEventReleaseReason(Int) from Int to Int {
	public static inline var Ok:NotificationEventReleaseReason = 0;
	public static inline var OperationFailed:NotificationEventReleaseReason = 1;
}
