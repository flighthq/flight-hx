package flight;

abstract VideoResourceLoadReadiness(Int) from Int to Int {
	public static inline var Metadata:VideoResourceLoadReadiness = 0;
	public static inline var Canplay:VideoResourceLoadReadiness = 1;
	public static inline var Canplaythrough:VideoResourceLoadReadiness = 2;
}
