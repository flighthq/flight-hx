package flight;

abstract PlatformRuntime(Int) from Int to Int {
	public static inline var Web:PlatformRuntime = 0;
	public static inline var Electron:PlatformRuntime = 1;
	public static inline var Tauri:PlatformRuntime = 2;
	public static inline var Capacitor:PlatformRuntime = 3;
	public static inline var Native:PlatformRuntime = 4;
	public static inline var Unknown:PlatformRuntime = 5;
}
