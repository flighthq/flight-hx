package flight;

abstract NotificationSubscriptionDisposeReason(Int) from Int to Int {
	public static inline var AlreadyDisposed:NotificationSubscriptionDisposeReason = 0;
	public static inline var Ok:NotificationSubscriptionDisposeReason = 1;
	public static inline var OperationFailed:NotificationSubscriptionDisposeReason = 2;
}
