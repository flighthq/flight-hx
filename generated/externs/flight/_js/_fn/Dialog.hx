package flight._js._fn;

@:jsRequire("@flighthq/dialog")
extern class Dialog {
	@:native("getFileDialogHandleOperations")
	public static function getFileDialogHandleOperations(handle:Dynamic):Null<flight._js.FileDialogHandleOperations>;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeFileDialogHandleOperations(ptr:flight._js.FileDialogHandleOperations):Void {}
}
