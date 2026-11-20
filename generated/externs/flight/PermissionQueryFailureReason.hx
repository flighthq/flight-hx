package flight;

abstract PermissionQueryFailureReason(Int) from Int to Int {
	public static inline var OperationFailed:PermissionQueryFailureReason = 0;
	public static inline var RuntimeUnavailable:PermissionQueryFailureReason = 1;
	public static inline var Unsupported:PermissionQueryFailureReason = 2;
}
