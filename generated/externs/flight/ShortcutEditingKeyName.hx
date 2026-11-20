package flight;

abstract ShortcutEditingKeyName(Int) from Int to Int {
	public static inline var Backspace:ShortcutEditingKeyName = 0;
	public static inline var Delete:ShortcutEditingKeyName = 1;
	public static inline var Escape:ShortcutEditingKeyName = 2;
	public static inline var Insert:ShortcutEditingKeyName = 3;
	public static inline var Return:ShortcutEditingKeyName = 4;
	public static inline var Space:ShortcutEditingKeyName = 5;
	public static inline var Tab:ShortcutEditingKeyName = 6;
}
