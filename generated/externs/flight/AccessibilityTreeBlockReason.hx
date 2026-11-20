package flight;

abstract AccessibilityTreeBlockReason(Int) from Int to Int {
	public static inline var Destroyed:AccessibilityTreeBlockReason = 0;
	public static inline var NoDom:AccessibilityTreeBlockReason = 1;
}
