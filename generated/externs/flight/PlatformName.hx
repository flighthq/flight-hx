package flight;

abstract PlatformName(Int) from Int to Int {
	public static inline var Web:PlatformName = 0;
	public static inline var Windows:PlatformName = 1;
	public static inline var MacOs:PlatformName = 2;
	public static inline var Linux:PlatformName = 3;
	public static inline var Ios:PlatformName = 4;
	public static inline var Android:PlatformName = 5;
	public static inline var Unknown:PlatformName = 6;
}
