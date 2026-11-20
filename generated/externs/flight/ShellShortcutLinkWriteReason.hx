package flight;

abstract ShellShortcutLinkWriteReason(Int) from Int to Int {
	public static inline var Ok:ShellShortcutLinkWriteReason = 0;
	public static inline var OperationFailed:ShellShortcutLinkWriteReason = 1;
}
