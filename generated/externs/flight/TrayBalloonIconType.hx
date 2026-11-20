package flight;

abstract TrayBalloonIconType(Int) from Int to Int {
	public static inline var None:TrayBalloonIconType = 0;
	public static inline var Info:TrayBalloonIconType = 1;
	public static inline var Warning:TrayBalloonIconType = 2;
	public static inline var Error:TrayBalloonIconType = 3;
}
