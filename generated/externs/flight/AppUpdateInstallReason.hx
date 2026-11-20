package flight;

abstract AppUpdateInstallReason(Int) from Int to Int {
	public static inline var Ok:AppUpdateInstallReason = 0;
	public static inline var OperationFailed:AppUpdateInstallReason = 1;
}
