package flight;

abstract PointerType(Int) from Int to Int {
	public static inline var Mouse:PointerType = 0;
	public static inline var Pen:PointerType = 1;
	public static inline var Touch:PointerType = 2;
	public static inline var Unknown:PointerType = 3;
}
