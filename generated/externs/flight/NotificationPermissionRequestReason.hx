package flight;

abstract NotificationPermissionRequestReason(Int) from Int to Int {
	public static inline var Denied:NotificationPermissionRequestReason = 0;
	public static inline var Dismissed:NotificationPermissionRequestReason = 1;
	public static inline var Granted:NotificationPermissionRequestReason = 2;
	public static inline var OperationFailed:NotificationPermissionRequestReason = 3;
}
