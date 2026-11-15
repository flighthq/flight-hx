package flight;

abstract SignDisplay(Int) from Int to Int {
	public static inline var Auto:SignDisplay = 0;
	public static inline var Never:SignDisplay = 1;
	public static inline var Always:SignDisplay = 2;
	public static inline var ExceptZero:SignDisplay = 3;
}
