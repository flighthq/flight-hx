package flight;

abstract PlatformEngine(Int) from Int to Int {
	public static inline var Gecko:PlatformEngine = 0;
	public static inline var Blink:PlatformEngine = 1;
	public static inline var Webkit:PlatformEngine = 2;
	public static inline var Unknown:PlatformEngine = 3;
}
