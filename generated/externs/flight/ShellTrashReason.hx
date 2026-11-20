package flight;

abstract ShellTrashReason(Int) from Int to Int {
	public static inline var Ok:ShellTrashReason = 0;
	public static inline var OperationFailed:ShellTrashReason = 1;
}
