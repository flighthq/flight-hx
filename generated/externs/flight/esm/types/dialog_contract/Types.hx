package flight.esm.types.dialog_contract;

#if (js && flight_esm)
typedef CapturePhotoDialogOptions = { ?facingMode:Null<String>, ?signal:Null<js.html.AbortSignal> };

typedef CaptureVideoDialogOptions = { ?facingMode:Null<String>, ?signal:Null<js.html.AbortSignal> };

typedef DialogImage = { dataUrl:String, height:Float, mimeType:String, width:Float };

typedef DialogVideo = { dataUrl:String, duration:Float, mimeType:String };

typedef DirectoryOpenDialogResult = Dynamic;

typedef FileDialogFilter = { accept:Dynamic, name:String };

typedef FileDialogHandle = { kind:String, name:String, path:Null<String> };

typedef FileDialogHandleOperations = { ?readBinary:Null<((?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Dynamic>)>, ?readText:Null<((?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Dynamic>)>, ?writeBinary:Null<((data:js.lib.Uint8Array, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Bool>)>, ?writeText:Null<((data:String, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Bool>)> };

typedef FileDialogHandleRuntime = { operations:Null<flight.esm.types.dialog_contract.Types.FileDialogHandleOperations>, binding:Dynamic, ?uid:Null<String> };

typedef FileOpenDialogResult = Dynamic;

typedef FileSaveDialogResult = Dynamic;

typedef HostDirectoryOpenDialogCapability = { open:((?options:Null<flight.esm.types.dialog_contract.Types.OpenDirectoryDialogOptions>) -> js.lib.Promise<flight.esm.types.dialog_contract.Types.DirectoryOpenDialogResult>) };

typedef HostFileOpenDialogCapability = { open:((options:flight.esm.types.dialog_contract.Types.OpenFileDialogOptions) -> js.lib.Promise<flight.esm.types.dialog_contract.Types.FileOpenDialogResult>) };

typedef HostFileSaveDialogCapability = { save:((options:flight.esm.types.dialog_contract.Types.SaveFileDialogOptions) -> js.lib.Promise<flight.esm.types.dialog_contract.Types.FileSaveDialogResult>) };

typedef HostImageOpenDialogCapability = { open:((?options:Null<flight.esm.types.dialog_contract.Types.OpenImageDialogOptions>) -> js.lib.Promise<flight.esm.types.dialog_contract.Types.ImageOpenDialogResult>) };

typedef HostMessageDialogCapability = { confirm:((options:flight.esm.types.dialog_contract.Types.MessageDialogOptions) -> js.lib.Promise<Bool>), message:((options:flight.esm.types.dialog_contract.Types.MessageDialogOptions) -> js.lib.Promise<flight.esm.types.dialog_contract.Types.MessageDialogResult>) };

typedef HostPhotoCaptureDialogCapability = { capture:((?options:Null<flight.esm.types.dialog_contract.Types.CapturePhotoDialogOptions>) -> js.lib.Promise<flight.esm.types.dialog_contract.Types.PhotoCaptureDialogResult>) };

typedef HostPromptDialogCapability = { prompt:((options:flight.esm.types.dialog_contract.Types.PromptDialogOptions) -> js.lib.Promise<Null<String>>) };

typedef HostVideoCaptureDialogCapability = { capture:((?options:Null<flight.esm.types.dialog_contract.Types.CaptureVideoDialogOptions>) -> js.lib.Promise<flight.esm.types.dialog_contract.Types.VideoCaptureDialogResult>) };

typedef ImageOpenDialogResult = Dynamic;

typedef MediaCaptureDialogFacingMode = String;

typedef MessageDialogKind = String;

typedef MessageDialogOptions = { ?title:Null<String>, message:String, ?detail:Null<String>, ?buttons:Null<Array<String>>, ?kind:Null<String>, ?checkboxLabel:Null<String>, ?checkboxChecked:Null<Bool>, ?defaultId:Null<Float>, ?cancelId:Null<Float>, ?parentWindow:Null<flight.esm.types.app.Types.AppWindow>, ?signal:Null<js.html.AbortSignal> };

typedef MessageDialogResult = { buttonIndex:Float, cancelled:Bool, checkboxChecked:Bool };

typedef OpenDirectoryDialogOptions = { ?signal:Null<js.html.AbortSignal> };

typedef OpenFileDialogOptions = { ?filters:Null<Array<flight.esm.types.dialog_contract.Types.FileDialogFilter>>, ?multiple:Null<Bool>, ?signal:Null<js.html.AbortSignal> };

typedef OpenImageDialogOptions = { ?signal:Null<js.html.AbortSignal> };

typedef PhotoCaptureDialogResult = Dynamic;

typedef PromptDialogOptions = { ?title:Null<String>, message:String, ?defaultValue:Null<String>, ?placeholder:Null<String>, ?parentWindow:Null<flight.esm.types.app.Types.AppWindow>, ?signal:Null<js.html.AbortSignal> };

typedef SaveFileDialogOptions = { ?defaultName:Null<String>, ?filters:Null<Array<flight.esm.types.dialog_contract.Types.FileDialogFilter>>, ?signal:Null<js.html.AbortSignal> };

typedef VideoCaptureDialogResult = Dynamic;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
