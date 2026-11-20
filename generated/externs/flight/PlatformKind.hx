package flight;

abstract PlatformKind(Int) from Int to Int {
	public static inline var Desktop:PlatformKind = 0;
	public static inline var Mobile:PlatformKind = 1;
	public static inline var Web:PlatformKind = 2;
	public static inline var Unknown:PlatformKind = 3;
}
