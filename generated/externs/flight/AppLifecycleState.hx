package flight;

abstract AppLifecycleState(Int) from Int to Int {
	public static inline var Active:AppLifecycleState = 0;
	public static inline var Inactive:AppLifecycleState = 1;
	public static inline var Background:AppLifecycleState = 2;
}
