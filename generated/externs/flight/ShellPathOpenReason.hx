package flight;

abstract ShellPathOpenReason(Int) from Int to Int {
	public static inline var Ok:ShellPathOpenReason = 0;
	public static inline var OperationFailed:ShellPathOpenReason = 1;
}
