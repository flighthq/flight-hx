package flight;

abstract ResourceResolutionState(Int) from Int to Int {
	public static inline var Failed:ResourceResolutionState = 0;
	public static inline var Loading:ResourceResolutionState = 1;
	public static inline var Resolved:ResourceResolutionState = 2;
	public static inline var Unresolved:ResourceResolutionState = 3;
}
