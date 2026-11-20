package flight;

abstract HapticsOperation(Int) from Int to Int {
	public static inline var Cancel:HapticsOperation = 0;
	public static inline var Capabilities:HapticsOperation = 1;
	public static inline var Impact:HapticsOperation = 2;
	public static inline var IsSupported:HapticsOperation = 3;
	public static inline var Notification:HapticsOperation = 4;
	public static inline var Prepare:HapticsOperation = 5;
	public static inline var Selection:HapticsOperation = 6;
	public static inline var Vibrate:HapticsOperation = 7;
	public static inline var VibratePattern:HapticsOperation = 8;
	public static inline var VibrateWaveform:HapticsOperation = 9;
}
