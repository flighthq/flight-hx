package flight;

abstract Physics2DAbiStepStatus(Int) from Int to Int {
	public static inline var BusyWorld:Physics2DAbiStepStatus = 0;
	public static inline var Complete:Physics2DAbiStepStatus = 1;
	public static inline var Declined:Physics2DAbiStepStatus = 2;
	public static inline var InsufficientHookBuffer:Physics2DAbiStepStatus = 3;
	public static inline var StaleWorld:Physics2DAbiStepStatus = 4;
}
