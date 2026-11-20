package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/filesystem")
extern class Filesystem {
  public static function appendTextFile(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String, data:String, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<Bool>;
  public static function canAccessFile(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String, mode:String):js.lib.Promise<Bool>;
  public static function copyFile(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, from:String, to:String):js.lib.Promise<Bool>;
  public static function createFileSymlink(_target:String, _linkPath:String):js.lib.Promise<Bool>;
  public static function directoryExists(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String):js.lib.Promise<Bool>;
  public static function fileExists(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String):js.lib.Promise<Bool>;
  public static function findFiles(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, rootPath:String, pattern:String, ?options:Null<flight.esm.types.filesystem_contract.Types.FileWalkOptions>):js.lib.Promise<Array<flight.esm.types.filesystem_contract.Types.FileEntry>>;
  public static function getFileBaseName(path:String):String;
  public static function getFileDirectoryName(path:String):String;
  public static function getFileExtensionName(path:String):String;
  public static function getFilePermissions(_path:String):js.lib.Promise<Null<flight.esm.types.filesystem_contract.Types.FilePermissions>>;
  public static function getFileRealPath(_path:String):js.lib.Promise<Null<String>>;
  public static function getFileSystemPath(_kind:flight.esm.types.filesystem_contract.Types.FileSystemPathKind):String;
  public static function getFileSystemUsage(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability):js.lib.Promise<Null<flight.esm.types.filesystem_contract.Types.FileSystemUsage>>;
  public static function isAbsoluteFilePath(path:String):Bool;
  public static function joinFilePath(...segments:String):String;
  public static function makeDirectory(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String):js.lib.Promise<Bool>;
  public static function normalizeFilePath(path:String):String;
  public static function openFileReadStream(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<Dynamic>;
  public static function openFileWriteStream(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<Dynamic>;
  public static function readBinaryFile(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<Null<js.lib.Uint8Array>>;
  public static function readBinaryFileRange(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String, offset:Float, length:Float, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<Null<js.lib.Uint8Array>>;
  public static function readDialogHandleBinaryFile(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, handle:flight.esm.types.dialog_contract.Types.FileDialogHandle, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<Null<js.lib.Uint8Array>>;
  public static function readDialogHandleTextFile(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, handle:flight.esm.types.dialog_contract.Types.FileDialogHandle, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<Null<String>>;
  public static function readDirectory(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<Array<flight.esm.types.filesystem_contract.Types.FileEntry>>;
  public static function readDirectoryRecursive(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String, ?options:Null<flight.esm.types.filesystem_contract.Types.FileWalkOptions>):js.lib.Promise<Array<flight.esm.types.filesystem_contract.Types.FileEntry>>;
  public static function readFileSymlink(_path:String):js.lib.Promise<Null<String>>;
  public static function readTextFile(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<Null<String>>;
  public static function removeDirectory(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String, ?recursive:Null<Bool>):js.lib.Promise<Bool>;
  public static function removeFile(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String):js.lib.Promise<Bool>;
  public static function renameFile(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, from:String, to:String):js.lib.Promise<Bool>;
  public static function setFilePermissions(_path:String, _permissions:flight.esm.types.filesystem_contract.Types.FilePermissions):js.lib.Promise<Bool>;
  public static function statFile(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String):js.lib.Promise<Null<flight.esm.types.filesystem_contract.Types.FileStat>>;
  public static function watchPath(_path:String, _listener:((event:flight.esm.types.filesystem_contract.Types.FileWatchEvent) -> Void)):(() -> Void);
  public static function writeBinaryFile(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String, data:js.lib.Uint8Array, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<Bool>;
  public static function writeBinaryFileChunks(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String, chunks:Dynamic, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<Bool>;
  public static function writeDialogHandleBinaryFile(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, handle:flight.esm.types.dialog_contract.Types.FileDialogHandle, data:js.lib.Uint8Array, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<Bool>;
  public static function writeDialogHandleTextFile(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, handle:flight.esm.types.dialog_contract.Types.FileDialogHandle, data:String, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<Bool>;
  public static function writeFileAtomic(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String, data:Dynamic, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<Bool>;
  public static function writeTextFile(hostFileSystem:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability, path:String, data:String, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<Bool>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
