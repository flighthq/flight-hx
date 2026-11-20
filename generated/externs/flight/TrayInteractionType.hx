package flight;

abstract TrayInteractionType(Int) from Int to Int {
	public static inline var Click:TrayInteractionType = 0;
	public static inline var DoubleClick:TrayInteractionType = 1;
	public static inline var RightClick:TrayInteractionType = 2;
}
