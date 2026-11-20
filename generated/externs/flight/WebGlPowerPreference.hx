package flight;

abstract WebGlPowerPreference(Int) from Int to Int {
	public static inline var Default:WebGlPowerPreference = 0;
	public static inline var HighPerformance:WebGlPowerPreference = 1;
	public static inline var LowPower:WebGlPowerPreference = 2;
}
