package flight;

abstract PowerKeepAwakeAcquireReason(Int) from Int to Int {
	public static inline var Ok:PowerKeepAwakeAcquireReason = 0;
	public static inline var Unavailable:PowerKeepAwakeAcquireReason = 1;
	public static inline var Denied:PowerKeepAwakeAcquireReason = 2;
	public static inline var Failed:PowerKeepAwakeAcquireReason = 3;
}
