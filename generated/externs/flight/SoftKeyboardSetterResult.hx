package flight;

abstract SoftKeyboardSetterResult(Int) from Int to Int {
	public static inline var Ok:SoftKeyboardSetterResult = 0;
	public static inline var OperationUnavailable:SoftKeyboardSetterResult = 1;
	public static inline var OperationFailed:SoftKeyboardSetterResult = 2;
}
