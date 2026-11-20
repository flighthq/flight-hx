package flight;

abstract FocusDirection(Int) from Int to Int {
	public static inline var Down:FocusDirection = 0;
	public static inline var Left:FocusDirection = 1;
	public static inline var Right:FocusDirection = 2;
	public static inline var Up:FocusDirection = 3;
}
