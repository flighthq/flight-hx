package flight;

abstract PermissionRequestReason(Int) from Int to Int {
	public static inline var BestEffort:PermissionRequestReason = 0;
	public static inline var CleanupFailed:PermissionRequestReason = 1;
	public static inline var Denied:PermissionRequestReason = 2;
	public static inline var Dismissed:PermissionRequestReason = 3;
	public static inline var Granted:PermissionRequestReason = 4;
	public static inline var NoRequestRoute:PermissionRequestReason = 5;
	public static inline var OperationFailed:PermissionRequestReason = 6;
	public static inline var RuntimeUnavailable:PermissionRequestReason = 7;
	public static inline var Timeout:PermissionRequestReason = 8;
	public static inline var Unsupported:PermissionRequestReason = 9;
}
