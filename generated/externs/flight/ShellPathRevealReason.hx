package flight;

abstract ShellPathRevealReason(Int) from Int to Int {
	public static inline var Ok:ShellPathRevealReason = 0;
	public static inline var OperationFailed:ShellPathRevealReason = 1;
}
