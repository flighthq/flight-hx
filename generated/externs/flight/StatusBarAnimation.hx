package flight;

abstract StatusBarAnimation(Int) from Int to Int {
	public static inline var None:StatusBarAnimation = 0;
	public static inline var Fade:StatusBarAnimation = 1;
	public static inline var Slide:StatusBarAnimation = 2;
}
