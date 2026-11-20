package flight;

abstract MessageDialogKind(Int) from Int to Int {
	public static inline var Info:MessageDialogKind = 0;
	public static inline var Warning:MessageDialogKind = 1;
	public static inline var Error:MessageDialogKind = 2;
	public static inline var Question:MessageDialogKind = 3;
}
