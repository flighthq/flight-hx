package flight;

abstract NotificationDirection(Int) from Int to Int {
	public static inline var Auto:NotificationDirection = 0;
	public static inline var Ltr:NotificationDirection = 1;
	public static inline var Rtl:NotificationDirection = 2;
}
