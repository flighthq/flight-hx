package flight;

abstract FileDialogHandleKind(Int) from Int to Int {
	public static inline var File:FileDialogHandleKind = 0;
	public static inline var Directory:FileDialogHandleKind = 1;
}
