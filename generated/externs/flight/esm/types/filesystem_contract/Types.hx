package flight.esm.types.filesystem_contract;

#if (js && flight_esm)
typedef FileEntry = { name:String, path:String, isDirectory:Bool };

typedef FilePermissions = { readable:Bool, writable:Bool, executable:Bool };

typedef FileStat = { size:Float, isDirectory:Bool, modifiedTime:Float, createdTime:Float, isSymlink:Bool };

typedef FileSystemBasicOperations = { appendTextFile:((path:String, data:String, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Bool>), copy:((from:String, to:String) -> js.lib.Promise<Bool>), directoryExists:((path:String) -> js.lib.Promise<Bool>), fileExists:((path:String) -> js.lib.Promise<Bool>), makeDirectory:((path:String) -> js.lib.Promise<Bool>), readBinaryFile:((path:String, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Null<js.lib.Uint8Array>>), readDirectory:((path:String, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Array<flight.esm.types.filesystem_contract.Types.FileEntry>>), readTextFile:((path:String, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Null<String>>), removeDirectory:((path:String, ?recursive:Null<Bool>) -> js.lib.Promise<Bool>), removeFile:((path:String) -> js.lib.Promise<Bool>), rename:((from:String, to:String) -> js.lib.Promise<Bool>), statFile:((path:String) -> js.lib.Promise<Null<flight.esm.types.filesystem_contract.Types.FileStat>>), writeBinaryFile:((path:String, data:js.lib.Uint8Array, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Bool>), writeTextFile:((path:String, data:String, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Bool>) };

typedef FileSystemPathKind = String;

typedef FileSystemUsage = { usedBytes:Float, quotaBytes:Float };

typedef FileWalkOptions = { ?maxDepth:Null<Float>, ?signal:Null<js.html.AbortSignal> };

typedef FileWatchEvent = { type:flight.esm.types.filesystem_contract.Types.FileWatchEventType, path:String };

typedef FileWatchEventType = String;

typedef HostFileSystemCapability = { ?canAccessFile:Null<((path:String, mode:String) -> js.lib.Promise<Bool>)>, ?getFileSystemUsage:Null<(() -> js.lib.Promise<Dynamic>)>, ?openFileReadStream:Null<((path:String, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Dynamic>)>, ?openFileWriteStream:Null<((path:String, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Dynamic>)>, ?readBinaryFileRange:Null<((path:String, offset:Float, length:Float, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Dynamic>)>, ?readDirectoryRecursive:Null<((path:String, ?options:Dynamic) -> js.lib.Promise<Array<Dynamic>>)>, ?writeFileAtomic:Null<((path:String, data:Dynamic, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Bool>)>, ?appendTextFile:Null<((path:String, data:String, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Bool>)>, ?copy:Null<((from:String, to:String) -> js.lib.Promise<Bool>)>, ?directoryExists:Null<((path:String) -> js.lib.Promise<Bool>)>, ?fileExists:Null<((path:String) -> js.lib.Promise<Bool>)>, ?makeDirectory:Null<((path:String) -> js.lib.Promise<Bool>)>, ?readBinaryFile:Null<((path:String, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Dynamic>)>, ?readDirectory:Null<((path:String, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Array<Dynamic>>)>, ?readTextFile:Null<((path:String, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Dynamic>)>, ?removeDirectory:Null<((path:String, ?recursive:Null<Bool>) -> js.lib.Promise<Bool>)>, ?removeFile:Null<((path:String) -> js.lib.Promise<Bool>)>, ?rename:Null<((from:String, to:String) -> js.lib.Promise<Bool>)>, ?statFile:Null<((path:String) -> js.lib.Promise<Dynamic>)>, ?writeBinaryFile:Null<((path:String, data:js.lib.Uint8Array, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Bool>)>, ?writeTextFile:Null<((path:String, data:String, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<Bool>)> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
