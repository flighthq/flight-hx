package flight;

abstract TrayBalloonEventType(Int) from Int to Int {
	public static inline var Click:TrayBalloonEventType = 0;
	public static inline var Close:TrayBalloonEventType = 1;
	public static inline var Show:TrayBalloonEventType = 2;
}
