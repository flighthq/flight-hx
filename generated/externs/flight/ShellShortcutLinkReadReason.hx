package flight;

abstract ShellShortcutLinkReadReason(Int) from Int to Int {
	public static inline var Ok:ShellShortcutLinkReadReason = 0;
	public static inline var OperationFailed:ShellShortcutLinkReadReason = 1;
}
