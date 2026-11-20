package flight._hl._fn;

extern class Filesystem {
	@:hlNative("flight", "flight_get_file_base_name")
	public static function getFileBaseName(path:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_file_directory_name")
	public static function getFileDirectoryName(path:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_file_extension_name")
	public static function getFileExtensionName(path:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_file_system_path")
	public static function getFileSystemPath(kind:Int):hl.Bytes;
	@:hlNative("flight", "flight_is_absolute_file_path")
	public static function isAbsoluteFilePath(path:hl.Bytes):Bool;
	@:hlNative("flight", "flight_join_file_path")
	public static function joinFilePath(segments:hl.Bytes, segmentsLen:Int):hl.Bytes;
	@:hlNative("flight", "flight_normalize_file_path")
	public static function normalizeFilePath(path:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_free_file_watch_unsubscribe")
	public static function freeFileWatchUnsubscribe(ptr:flight._hl.FileWatchUnsubscribe):Void;
}
