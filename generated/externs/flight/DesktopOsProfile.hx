package flight;

abstract DesktopOsProfile(Int) from Int to Int {
	public static inline var Linux:DesktopOsProfile = 0;
	public static inline var MacOs:DesktopOsProfile = 1;
	public static inline var Windows:DesktopOsProfile = 2;
}
