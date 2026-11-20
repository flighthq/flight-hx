package flight;

abstract PlatformEndianness(Int) from Int to Int {
	public static inline var Big:PlatformEndianness = 0;
	public static inline var Little:PlatformEndianness = 1;
	public static inline var Unknown:PlatformEndianness = 2;
}
