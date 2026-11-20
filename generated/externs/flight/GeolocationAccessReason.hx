package flight;

abstract GeolocationAccessReason(Int) from Int to Int {
	public static inline var CleanupFailed:GeolocationAccessReason = 0;
	public static inline var Denied:GeolocationAccessReason = 1;
	public static inline var Dismissed:GeolocationAccessReason = 2;
	public static inline var Granted:GeolocationAccessReason = 3;
	public static inline var OperationFailed:GeolocationAccessReason = 4;
	public static inline var RuntimeUnavailable:GeolocationAccessReason = 5;
	public static inline var Timeout:GeolocationAccessReason = 6;
}
