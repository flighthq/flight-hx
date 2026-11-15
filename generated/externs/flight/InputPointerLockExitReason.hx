package flight;

abstract InputPointerLockExitReason(Int) from Int to Int {
	public static inline var Ok:InputPointerLockExitReason = 0;
	public static inline var ApiUnavailable:InputPointerLockExitReason = 1;
	public static inline var OperationFailed:InputPointerLockExitReason = 2;
}
