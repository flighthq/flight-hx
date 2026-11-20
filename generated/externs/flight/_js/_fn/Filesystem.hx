package flight._js._fn;

@:jsRequire("@flighthq/filesystem")
extern class Filesystem {
	@:native("getFileBaseName")
	public static function getFileBaseName(path:String):String;
	@:native("getFileDirectoryName")
	public static function getFileDirectoryName(path:String):String;
	@:native("getFileExtensionName")
	public static function getFileExtensionName(path:String):String;
	@:native("getFileSystemPath")
	public static function getFileSystemPath(kind:Dynamic):String;
	@:native("isAbsoluteFilePath")
	public static function isAbsoluteFilePath(path:String):Bool;
	@:native("joinFilePath")
	public static function joinFilePath(segments:Dynamic):String;
	@:native("normalizeFilePath")
	public static function normalizeFilePath(path:String):String;
	@:native("watchPath")
	public static function watchPath(path:String, listener:flight._js.FileWatchListener):flight._js.FileWatchUnsubscribe;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeFileWatchUnsubscribe(ptr:flight._js.FileWatchUnsubscribe):Void {}
}
