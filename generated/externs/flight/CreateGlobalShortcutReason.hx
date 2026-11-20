package flight;

abstract CreateGlobalShortcutReason(Int) from Int to Int {
	public static inline var Created:CreateGlobalShortcutReason = 0;
	public static inline var Unparseable:CreateGlobalShortcutReason = 1;
}
