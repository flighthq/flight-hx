package flight;

abstract StepPosition(Int) from Int to Int {
	public static inline var JumpStart:StepPosition = 0;
	public static inline var JumpEnd:StepPosition = 1;
	public static inline var JumpNone:StepPosition = 2;
	public static inline var JumpBoth:StepPosition = 3;
}
