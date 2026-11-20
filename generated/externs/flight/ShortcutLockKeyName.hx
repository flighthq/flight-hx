package flight;

abstract ShortcutLockKeyName(Int) from Int to Int {
	public static inline var CapsLock:ShortcutLockKeyName = 0;
	public static inline var NumLock:ShortcutLockKeyName = 1;
	public static inline var PrintScreen:ShortcutLockKeyName = 2;
	public static inline var ScrollLock:ShortcutLockKeyName = 3;
}
