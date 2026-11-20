package flight;

abstract StatusBarStyle(Int) from Int to Int {
	public static inline var Light:StatusBarStyle = 0;
	public static inline var Dark:StatusBarStyle = 1;
	public static inline var Default:StatusBarStyle = 2;
}
