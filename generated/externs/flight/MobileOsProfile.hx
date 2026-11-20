package flight;

abstract MobileOsProfile(Int) from Int to Int {
	public static inline var Android:MobileOsProfile = 0;
	public static inline var Ios:MobileOsProfile = 1;
}
