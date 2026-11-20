package flight;

abstract TextDirection(Int) from Int to Int {
	public static inline var LeftToRight:TextDirection = 0;
	public static inline var RightToLeft:TextDirection = 1;
	public static inline var TopToBottom:TextDirection = 2;
}
