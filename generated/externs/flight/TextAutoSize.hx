package flight;

abstract TextAutoSize(Int) from Int to Int {
	public static inline var Center:TextAutoSize = 0;
	public static inline var Left:TextAutoSize = 1;
	public static inline var None:TextAutoSize = 2;
	public static inline var Right:TextAutoSize = 3;
}
