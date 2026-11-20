package flight;

abstract PermissionQueryReason(Int) from Int to Int {
	public static inline var BestEffort:PermissionQueryReason = 0;
	public static inline var Ok:PermissionQueryReason = 1;
	public static inline var OperationFailed:PermissionQueryReason = 2;
	public static inline var RuntimeUnavailable:PermissionQueryReason = 3;
	public static inline var Unsupported:PermissionQueryReason = 4;
}
