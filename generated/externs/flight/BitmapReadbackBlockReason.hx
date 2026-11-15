package flight;

abstract BitmapReadbackBlockReason(Int) from Int to Int {
	public static inline var Ok:BitmapReadbackBlockReason = 0;
	public static inline var EmptySize:BitmapReadbackBlockReason = 1;
	public static inline var TaintedSource:BitmapReadbackBlockReason = 2;
	public static inline var NoCanvas:BitmapReadbackBlockReason = 3;
	public static inline var BackendNotInstalled:BitmapReadbackBlockReason = 4;
}
