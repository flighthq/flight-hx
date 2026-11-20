package flight;

abstract GeolocationErrorReason(Int) from Int to Int {
	public static inline var Denied:GeolocationErrorReason = 0;
	public static inline var Timeout:GeolocationErrorReason = 1;
	public static inline var Unavailable:GeolocationErrorReason = 2;
}
