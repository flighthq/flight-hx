package flight;

abstract LifecycleOperation(Int) from Int to Int {
	public static inline var GetState:LifecycleOperation = 0;
	public static inline var Subscribe:LifecycleOperation = 1;
	public static inline var GetLaunchKind:LifecycleOperation = 2;
	public static inline var SubscribeMemoryWarning:LifecycleOperation = 3;
}
