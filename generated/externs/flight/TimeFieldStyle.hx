package flight;

abstract TimeFieldStyle(Int) from Int to Int {
	public static inline var Numeric:TimeFieldStyle = 0;
	public static inline var TwoDigit:TimeFieldStyle = 1;
}
