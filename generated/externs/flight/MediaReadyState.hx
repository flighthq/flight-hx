package flight;

abstract MediaReadyState(Int) from Int to Int {
	public static inline var Buffering:MediaReadyState = 0;
	public static inline var Error:MediaReadyState = 1;
	public static inline var Idle:MediaReadyState = 2;
	public static inline var Ready:MediaReadyState = 3;
}
