package flight;

abstract SensorAccuracy(Int) from Int to Int {
	public static inline var High:SensorAccuracy = 0;
	public static inline var Low:SensorAccuracy = 1;
	public static inline var Medium:SensorAccuracy = 2;
	public static inline var Unknown:SensorAccuracy = 3;
}
