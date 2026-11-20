package flight;

abstract NotificationCancelReason(Int) from Int to Int {
	public static inline var AlreadyCancelled:NotificationCancelReason = 0;
	public static inline var Ok:NotificationCancelReason = 1;
	public static inline var OperationFailed:NotificationCancelReason = 2;
}
