package flight;

abstract AccessibilityLiveness(Int) from Int to Int {
	public static inline var Polite:AccessibilityLiveness = 0;
	public static inline var Assertive:AccessibilityLiveness = 1;
}
