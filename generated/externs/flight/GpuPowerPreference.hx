package flight;

abstract GpuPowerPreference(Int) from Int to Int {
	public static inline var HighPerformance:GpuPowerPreference = 0;
	public static inline var LowPower:GpuPowerPreference = 1;
}
