package flight;

abstract ScreenPermissionState(Int) from Int to Int {
	public static inline var Denied:ScreenPermissionState = 0;
	public static inline var Granted:ScreenPermissionState = 1;
	public static inline var Prompt:ScreenPermissionState = 2;
}
