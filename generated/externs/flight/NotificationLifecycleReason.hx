package flight;

abstract NotificationLifecycleReason(Int) from Int to Int {
	public static inline var AlreadyDestroyed:NotificationLifecycleReason = 0;
	public static inline var Ok:NotificationLifecycleReason = 1;
	public static inline var OperationFailed:NotificationLifecycleReason = 2;
}
