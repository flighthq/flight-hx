package flight;

abstract NotificationPermission(Int) from Int to Int {
	public static inline var Default:NotificationPermission = 0;
	public static inline var Denied:NotificationPermission = 1;
	public static inline var Granted:NotificationPermission = 2;
}
