package flight;

abstract SoftKeyboardVisibilityResult(Int) from Int to Int {
	public static inline var Ok:SoftKeyboardVisibilityResult = 0;
	public static inline var OperationFailed:SoftKeyboardVisibilityResult = 1;
}
