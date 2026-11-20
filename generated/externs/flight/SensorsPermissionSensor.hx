package flight;

abstract SensorsPermissionSensor(Int) from Int to Int {
	public static inline var Magnetometer:SensorsPermissionSensor = 0;
	public static inline var Motion:SensorsPermissionSensor = 1;
	public static inline var Orientation:SensorsPermissionSensor = 2;
}
