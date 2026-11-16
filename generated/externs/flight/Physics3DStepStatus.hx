package flight;

abstract Physics3DStepStatus(Int) from Int to Int {
	public static inline var InvalidStep:Physics3DStepStatus = 0;
	public static inline var Ready:Physics3DStepStatus = 1;
}
