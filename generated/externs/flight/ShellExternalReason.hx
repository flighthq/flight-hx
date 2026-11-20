package flight;

abstract ShellExternalReason(Int) from Int to Int {
	public static inline var BlockedScheme:ShellExternalReason = 0;
	public static inline var Ok:ShellExternalReason = 1;
	public static inline var OperationFailed:ShellExternalReason = 2;
	public static inline var PopupBlocked:ShellExternalReason = 3;
}
