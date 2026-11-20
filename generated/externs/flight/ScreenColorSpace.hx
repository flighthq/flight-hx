package flight;

abstract ScreenColorSpace(Int) from Int to Int {
	public static inline var DisplayP3:ScreenColorSpace = 0;
	public static inline var Rec2020:ScreenColorSpace = 1;
	public static inline var Srgb:ScreenColorSpace = 2;
}
