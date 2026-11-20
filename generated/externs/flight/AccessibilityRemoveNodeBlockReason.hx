package flight;

abstract AccessibilityRemoveNodeBlockReason(Int) from Int to Int {
	public static inline var Destroyed:AccessibilityRemoveNodeBlockReason = 0;
	public static inline var NoDom:AccessibilityRemoveNodeBlockReason = 1;
	public static inline var NodeNotFound:AccessibilityRemoveNodeBlockReason = 2;
}
