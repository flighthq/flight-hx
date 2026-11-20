package flight._cpp._fn;

extern class Dialog {
	@:native("flight_get_file_dialog_handle_operations")
	public static function getFileDialogHandleOperations(handle:cpp.Star<cpp.Void>):flight._cpp.FileDialogHandleOperations;
	@:native("flight_free_file_dialog_handle_operations")
	public static function freeFileDialogHandleOperations(ptr:flight._cpp.FileDialogHandleOperations):Void;
}
