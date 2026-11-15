package flight;

abstract Scene3DForwardLightSelectionReason(Int) from Int to Int {
	public static inline var SelectionPrepared:Scene3DForwardLightSelectionReason = 0;
	public static inline var SelectionRequired:Scene3DForwardLightSelectionReason = 1;
	public static inline var WithinBudget:Scene3DForwardLightSelectionReason = 2;
}
