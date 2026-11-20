package flight;

abstract NotificationCloseReason(Int) from Int to Int {
	public static inline var AlreadyClosed:NotificationCloseReason = 0;
	public static inline var Ok:NotificationCloseReason = 1;
	public static inline var OperationFailed:NotificationCloseReason = 2;
}
