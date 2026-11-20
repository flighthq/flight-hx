package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/dialog")
extern class Dialog {
  public static function createFileDialogHandle(kind:String, name:String, path:Null<String>, ?operations:Null<flight.esm.types.dialog_contract.Types.FileDialogHandleOperations>):flight.esm.types.dialog_contract.Types.FileDialogHandle;
  public static function getFileDialogHandleOperations(handle:flight.esm.types.dialog_contract.Types.FileDialogHandle):Null<flight.esm.types.dialog_contract.Types.FileDialogHandleOperations>;
  public static function showCapturePhotoDialog(hostPhotoCaptureDialog:flight.esm.types.dialog_contract.Types.HostPhotoCaptureDialogCapability, ?options:Null<flight.esm.types.dialog_contract.Types.CapturePhotoDialogOptions>):js.lib.Promise<flight.esm.types.dialog_contract.Types.PhotoCaptureDialogResult>;
  public static function showCaptureVideoDialog(hostVideoCaptureDialog:flight.esm.types.dialog_contract.Types.HostVideoCaptureDialogCapability, ?options:Null<flight.esm.types.dialog_contract.Types.CaptureVideoDialogOptions>):js.lib.Promise<flight.esm.types.dialog_contract.Types.VideoCaptureDialogResult>;
  public static function showConfirmDialog(hostMessageDialog:flight.esm.types.dialog_contract.Types.HostMessageDialogCapability, options:flight.esm.types.dialog_contract.Types.MessageDialogOptions):js.lib.Promise<Bool>;
  public static function showErrorBox(hostMessageDialog:flight.esm.types.dialog_contract.Types.HostMessageDialogCapability, title:String, content:String, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<flight.esm.types.dialog_contract.Types.MessageDialogResult>;
  public static function showErrorDialog(hostMessageDialog:flight.esm.types.dialog_contract.Types.HostMessageDialogCapability, options:flight.esm.types.dialog_contract.Types.MessageDialogOptions):js.lib.Promise<flight.esm.types.dialog_contract.Types.MessageDialogResult>;
  public static function showInfoDialog(hostMessageDialog:flight.esm.types.dialog_contract.Types.HostMessageDialogCapability, options:flight.esm.types.dialog_contract.Types.MessageDialogOptions):js.lib.Promise<flight.esm.types.dialog_contract.Types.MessageDialogResult>;
  public static function showMessageDialog(hostMessageDialog:flight.esm.types.dialog_contract.Types.HostMessageDialogCapability, options:flight.esm.types.dialog_contract.Types.MessageDialogOptions):js.lib.Promise<flight.esm.types.dialog_contract.Types.MessageDialogResult>;
  public static function showOpenDirectoryDialog(hostDirectoryOpenDialog:flight.esm.types.dialog_contract.Types.HostDirectoryOpenDialogCapability, ?options:Null<flight.esm.types.dialog_contract.Types.OpenDirectoryDialogOptions>):js.lib.Promise<flight.esm.types.dialog_contract.Types.DirectoryOpenDialogResult>;
  public static function showOpenFileDialog(hostFileOpenDialog:flight.esm.types.dialog_contract.Types.HostFileOpenDialogCapability, options:flight.esm.types.dialog_contract.Types.OpenFileDialogOptions):js.lib.Promise<flight.esm.types.dialog_contract.Types.FileOpenDialogResult>;
  public static function showOpenImageDialog(hostImageOpenDialog:flight.esm.types.dialog_contract.Types.HostImageOpenDialogCapability, ?options:Null<flight.esm.types.dialog_contract.Types.OpenImageDialogOptions>):js.lib.Promise<flight.esm.types.dialog_contract.Types.ImageOpenDialogResult>;
  public static function showPromptDialog(hostPromptDialog:flight.esm.types.dialog_contract.Types.HostPromptDialogCapability, options:flight.esm.types.dialog_contract.Types.PromptDialogOptions):js.lib.Promise<Null<String>>;
  public static function showSaveFileDialog(hostFileSaveDialog:flight.esm.types.dialog_contract.Types.HostFileSaveDialogCapability, options:flight.esm.types.dialog_contract.Types.SaveFileDialogOptions):js.lib.Promise<flight.esm.types.dialog_contract.Types.FileSaveDialogResult>;
  public static function showWarningDialog(hostMessageDialog:flight.esm.types.dialog_contract.Types.HostMessageDialogCapability, options:flight.esm.types.dialog_contract.Types.MessageDialogOptions):js.lib.Promise<flight.esm.types.dialog_contract.Types.MessageDialogResult>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
