package flight._hl._fn;

extern class Dialog {
	@:hlNative("flight", "flight_get_file_dialog_handle_operations")
	public static function getFileDialogHandleOperations(handle:hl.Bytes):flight._hl.FileDialogHandleOperations;
	@:hlNative("flight", "flight_free_file_dialog_handle_operations")
	public static function freeFileDialogHandleOperations(ptr:flight._hl.FileDialogHandleOperations):Void;
}
