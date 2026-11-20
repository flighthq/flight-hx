package flight;

abstract NotificationSubscriptionDetachReason(Int) from Int to Int {
	public static inline var NotAttached:NotificationSubscriptionDetachReason = 0;
	public static inline var Ok:NotificationSubscriptionDetachReason = 1;
	public static inline var OperationFailed:NotificationSubscriptionDetachReason = 2;
}
