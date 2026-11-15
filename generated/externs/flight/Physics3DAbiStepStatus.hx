package flight;

abstract Physics3DAbiStepStatus(Int) from Int to Int {
	public static inline var BusyWorld:Physics3DAbiStepStatus = 0;
	public static inline var Complete:Physics3DAbiStepStatus = 1;
	public static inline var Declined:Physics3DAbiStepStatus = 2;
	public static inline var InsufficientHookBuffer:Physics3DAbiStepStatus = 3;
	public static inline var StaleWorld:Physics3DAbiStepStatus = 4;
}
