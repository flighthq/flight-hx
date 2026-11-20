package flight;

abstract AppLaunchKind(Int) from Int to Int {
	public static inline var Cold:AppLaunchKind = 0;
	public static inline var Warm:AppLaunchKind = 1;
}
