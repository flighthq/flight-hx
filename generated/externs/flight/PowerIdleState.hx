package flight;

abstract PowerIdleState(Int) from Int to Int {
	public static inline var Active:PowerIdleState = 0;
	public static inline var Idle:PowerIdleState = 1;
	public static inline var Unknown:PowerIdleState = 2;
}
