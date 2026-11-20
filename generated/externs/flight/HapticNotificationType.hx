package flight;

abstract HapticNotificationType(Int) from Int to Int {
	public static inline var Success:HapticNotificationType = 0;
	public static inline var Warning:HapticNotificationType = 1;
	public static inline var Error:HapticNotificationType = 2;
}
