package flight;

abstract PermissionState(Int) from Int to Int {
	public static inline var Denied:PermissionState = 0;
	public static inline var Granted:PermissionState = 1;
	public static inline var Prompt:PermissionState = 2;
}
