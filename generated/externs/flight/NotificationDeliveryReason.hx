package flight;

abstract NotificationDeliveryReason(Int) from Int to Int {
	public static inline var Accepted:NotificationDeliveryReason = 0;
	public static inline var InvalidRequest:NotificationDeliveryReason = 1;
	public static inline var OperationFailed:NotificationDeliveryReason = 2;
	public static inline var PermissionDenied:NotificationDeliveryReason = 3;
}
