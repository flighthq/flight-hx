package flight;

abstract InputPointerLockRequestReason(Int) from Int to Int {
	public static inline var Ok:InputPointerLockRequestReason = 0;
	public static inline var ApiUnavailable:InputPointerLockRequestReason = 1;
	public static inline var Denied:InputPointerLockRequestReason = 2;
	public static inline var OperationFailed:InputPointerLockRequestReason = 3;
	public static inline var TargetNotFound:InputPointerLockRequestReason = 4;
}
