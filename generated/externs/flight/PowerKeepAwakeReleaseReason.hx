package flight;

abstract PowerKeepAwakeReleaseReason(Int) from Int to Int {
	public static inline var Ok:PowerKeepAwakeReleaseReason = 0;
	public static inline var Inactive:PowerKeepAwakeReleaseReason = 1;
	public static inline var Failed:PowerKeepAwakeReleaseReason = 2;
}
