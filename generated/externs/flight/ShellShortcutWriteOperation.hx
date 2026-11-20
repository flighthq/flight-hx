package flight;

abstract ShellShortcutWriteOperation(Int) from Int to Int {
	public static inline var Create:ShellShortcutWriteOperation = 0;
	public static inline var Replace:ShellShortcutWriteOperation = 1;
	public static inline var Update:ShellShortcutWriteOperation = 2;
}
