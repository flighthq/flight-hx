package flight;

abstract Physics2DAbiWorldStatus(Int) from Int to Int {
	public static inline var Busy:Physics2DAbiWorldStatus = 0;
	public static inline var Ready:Physics2DAbiWorldStatus = 1;
	public static inline var Stale:Physics2DAbiWorldStatus = 2;
}
