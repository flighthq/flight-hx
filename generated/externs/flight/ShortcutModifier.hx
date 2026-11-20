package flight;

abstract ShortcutModifier(Int) from Int to Int {
	public static inline var Alt:ShortcutModifier = 0;
	public static inline var CommandOrControl:ShortcutModifier = 1;
	public static inline var Control:ShortcutModifier = 2;
	public static inline var Meta:ShortcutModifier = 3;
	public static inline var Shift:ShortcutModifier = 4;
	public static inline var Super:ShortcutModifier = 5;
}
