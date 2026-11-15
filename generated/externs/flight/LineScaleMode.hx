package flight;

abstract LineScaleMode(Int) from Int to Int {
	public static inline var Horizontal:LineScaleMode = 0;
	public static inline var None:LineScaleMode = 1;
	public static inline var Normal:LineScaleMode = 2;
	public static inline var Vertical:LineScaleMode = 3;
}
