package flight;

abstract PermissionRequestFailureReason(Int) from Int to Int {
	public static inline var NoRequestRoute:PermissionRequestFailureReason = 0;
	public static inline var OperationFailed:PermissionRequestFailureReason = 1;
	public static inline var RuntimeUnavailable:PermissionRequestFailureReason = 2;
	public static inline var Timeout:PermissionRequestFailureReason = 3;
	public static inline var Unsupported:PermissionRequestFailureReason = 4;
}
