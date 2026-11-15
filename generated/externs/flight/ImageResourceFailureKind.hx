package flight;

abstract ImageResourceFailureKind(Int) from Int to Int {
	public static inline var Error:ImageResourceFailureKind = 0;
	public static inline var Unavailable:ImageResourceFailureKind = 1;
}
