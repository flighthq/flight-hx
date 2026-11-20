package flight;

abstract NotificationSubscriptionAttachReason(Int) from Int to Int {
	public static inline var Ok:NotificationSubscriptionAttachReason = 0;
	public static inline var OperationFailed:NotificationSubscriptionAttachReason = 1;
}
