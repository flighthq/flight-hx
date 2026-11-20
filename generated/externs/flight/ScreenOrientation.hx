package flight;

abstract ScreenOrientation(Int) from Int to Int {
	public static inline var Landscape:ScreenOrientation = 0;
	public static inline var LandscapeFlipped:ScreenOrientation = 1;
	public static inline var Portrait:ScreenOrientation = 2;
	public static inline var PortraitFlipped:ScreenOrientation = 3;
}
