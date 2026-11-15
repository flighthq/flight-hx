package flight;

abstract FlowGuardKind(Int) from Int to Int {
	public static inline var DuplicateStatePush:FlowGuardKind = 0;
	public static inline var TransitionDuringTransition:FlowGuardKind = 1;
}
