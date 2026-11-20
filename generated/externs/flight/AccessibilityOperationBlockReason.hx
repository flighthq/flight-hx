package flight;

abstract AccessibilityOperationBlockReason(Int) from Int to Int {
	public static inline var Destroyed:AccessibilityOperationBlockReason = 0;
	public static inline var FocusNotMoved:AccessibilityOperationBlockReason = 1;
	public static inline var NoDom:AccessibilityOperationBlockReason = 2;
	public static inline var NodeNotFound:AccessibilityOperationBlockReason = 3;
}
