package flight;

abstract AudioResourceFailureKind(Int) from Int to Int {
	public static inline var Error:AudioResourceFailureKind = 0;
	public static inline var Unavailable:AudioResourceFailureKind = 1;
}
