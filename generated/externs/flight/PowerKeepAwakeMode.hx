package flight;

abstract PowerKeepAwakeMode(Int) from Int to Int {
	public static inline var PreventDisplaySleep:PowerKeepAwakeMode = 0;
	public static inline var PreventAppSuspension:PowerKeepAwakeMode = 1;
}
