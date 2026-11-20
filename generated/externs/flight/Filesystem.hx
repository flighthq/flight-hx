package flight;

#if (js && flight_esm)
extern inline function getFileBaseName(path:String):String {
	return flight._js._fn.Filesystem.getFileBaseName(path);
}
#else
extern inline function getFileBaseName(path:String):String {
#if hl
	return cast flight._hl._fn.Filesystem.getFileBaseName(cast path);
#elseif cpp
	return cast flight._cpp._fn.Filesystem.getFileBaseName(cast path);
#elseif (js && flight_esm)
	return cast flight._js._fn.Filesystem.getFileBaseName(path);
#else
	#error "flight.Filesystem: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getFileDirectoryName(path:String):String {
	return flight._js._fn.Filesystem.getFileDirectoryName(path);
}
#else
extern inline function getFileDirectoryName(path:String):String {
#if hl
	return cast flight._hl._fn.Filesystem.getFileDirectoryName(cast path);
#elseif cpp
	return cast flight._cpp._fn.Filesystem.getFileDirectoryName(cast path);
#elseif (js && flight_esm)
	return cast flight._js._fn.Filesystem.getFileDirectoryName(path);
#else
	#error "flight.Filesystem: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getFileExtensionName(path:String):String {
	return flight._js._fn.Filesystem.getFileExtensionName(path);
}
#else
extern inline function getFileExtensionName(path:String):String {
#if hl
	return cast flight._hl._fn.Filesystem.getFileExtensionName(cast path);
#elseif cpp
	return cast flight._cpp._fn.Filesystem.getFileExtensionName(cast path);
#elseif (js && flight_esm)
	return cast flight._js._fn.Filesystem.getFileExtensionName(path);
#else
	#error "flight.Filesystem: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getFileSystemPath(kind:Dynamic):String {
	return flight._js._fn.Filesystem.getFileSystemPath(kind);
}
#else
extern inline function getFileSystemPath(kind:flight.FileSystemPathKind):String {
#if hl
	return cast flight._hl._fn.Filesystem.getFileSystemPath(kind);
#elseif cpp
	return cast flight._cpp._fn.Filesystem.getFileSystemPath(kind);
#elseif (js && flight_esm)
	return cast flight._js._fn.Filesystem.getFileSystemPath(kind);
#else
	#error "flight.Filesystem: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isAbsoluteFilePath(path:String):Bool {
	return flight._js._fn.Filesystem.isAbsoluteFilePath(path);
}
#else
extern inline function isAbsoluteFilePath(path:String):Bool {
#if hl
	return flight._hl._fn.Filesystem.isAbsoluteFilePath(cast path);
#elseif cpp
	return flight._cpp._fn.Filesystem.isAbsoluteFilePath(cast path);
#elseif (js && flight_esm)
	return flight._js._fn.Filesystem.isAbsoluteFilePath(path);
#else
	#error "flight.Filesystem: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function joinFilePath(segments:Dynamic):String {
	return flight._js._fn.Filesystem.joinFilePath(segments);
}
#else
extern inline function joinFilePath(segments:Dynamic, segmentsLen:Int):String {
#if hl
	return cast flight._hl._fn.Filesystem.joinFilePath(segments, segmentsLen);
#elseif cpp
	return cast flight._cpp._fn.Filesystem.joinFilePath(segments, segmentsLen);
#elseif (js && flight_esm)
	return cast flight._js._fn.Filesystem.joinFilePath(segments, segmentsLen);
#else
	#error "flight.Filesystem: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function normalizeFilePath(path:String):String {
	return flight._js._fn.Filesystem.normalizeFilePath(path);
}
#else
extern inline function normalizeFilePath(path:String):String {
#if hl
	return cast flight._hl._fn.Filesystem.normalizeFilePath(cast path);
#elseif cpp
	return cast flight._cpp._fn.Filesystem.normalizeFilePath(cast path);
#elseif (js && flight_esm)
	return cast flight._js._fn.Filesystem.normalizeFilePath(path);
#else
	#error "flight.Filesystem: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function watchPath(path:String, listener:FileWatchListener):FileWatchUnsubscribe {
	return flight._js._fn.Filesystem.watchPath(path, listener);
}
#end
#if (js && flight_esm)
extern inline function freeFileWatchUnsubscribe(ptr:FileWatchUnsubscribe):Void {
	flight._js._fn.Filesystem.freeFileWatchUnsubscribe(ptr);
}
#else
extern inline function freeFileWatchUnsubscribe(ptr:FileWatchUnsubscribe):Void {
#if hl
	flight._hl._fn.Filesystem.freeFileWatchUnsubscribe(ptr);
#elseif cpp
	flight._cpp._fn.Filesystem.freeFileWatchUnsubscribe(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Filesystem.freeFileWatchUnsubscribe(ptr);
#else
	#error "flight.Filesystem: no backend for this target."
#end
}
#end
