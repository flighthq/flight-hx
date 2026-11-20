package flight;

#if (js && flight_esm)
extern inline function getFileDialogHandleOperations(handle:Dynamic):Null<FileDialogHandleOperations> {
	return flight._js._fn.Dialog.getFileDialogHandleOperations(handle);
}
#else
extern inline function getFileDialogHandleOperations(handle:Dynamic):FileDialogHandleOperations {
#if hl
	return flight._hl._fn.Dialog.getFileDialogHandleOperations(handle);
#elseif cpp
	return flight._cpp._fn.Dialog.getFileDialogHandleOperations(handle);
#elseif (js && flight_esm)
	return flight._js._fn.Dialog.getFileDialogHandleOperations(handle);
#else
	#error "flight.Dialog: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeFileDialogHandleOperations(ptr:FileDialogHandleOperations):Void {
	flight._js._fn.Dialog.freeFileDialogHandleOperations(ptr);
}
#else
extern inline function freeFileDialogHandleOperations(ptr:FileDialogHandleOperations):Void {
#if hl
	flight._hl._fn.Dialog.freeFileDialogHandleOperations(ptr);
#elseif cpp
	flight._cpp._fn.Dialog.freeFileDialogHandleOperations(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Dialog.freeFileDialogHandleOperations(ptr);
#else
	#error "flight.Dialog: no backend for this target."
#end
}
#end
