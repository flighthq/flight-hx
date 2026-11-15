package flight;

abstract Physics2DStepStatus(Int) from Int to Int {
	public static inline var InvalidStep:Physics2DStepStatus = 0;
	public static inline var Ready:Physics2DStepStatus = 1;
}
