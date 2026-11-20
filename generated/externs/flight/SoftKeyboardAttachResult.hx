package flight;

abstract SoftKeyboardAttachResult(Int) from Int to Int {
	public static inline var Ok:SoftKeyboardAttachResult = 0;
	public static inline var AcquisitionFailed:SoftKeyboardAttachResult = 1;
}
