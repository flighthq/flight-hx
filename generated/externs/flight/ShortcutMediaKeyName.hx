package flight;

abstract ShortcutMediaKeyName(Int) from Int to Int {
	public static inline var MediaNextTrack:ShortcutMediaKeyName = 0;
	public static inline var MediaPlayPause:ShortcutMediaKeyName = 1;
	public static inline var MediaPreviousTrack:ShortcutMediaKeyName = 2;
	public static inline var MediaStop:ShortcutMediaKeyName = 3;
	public static inline var VolumeDown:ShortcutMediaKeyName = 4;
	public static inline var VolumeMute:ShortcutMediaKeyName = 5;
	public static inline var VolumeUp:ShortcutMediaKeyName = 6;
}
