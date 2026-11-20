package flight;

abstract SensorsPermissionState(Int) from Int to Int {
	public static inline var Denied:SensorsPermissionState = 0;
	public static inline var Granted:SensorsPermissionState = 1;
	public static inline var Prompt:SensorsPermissionState = 2;
	public static inline var Unsupported:SensorsPermissionState = 3;
}
