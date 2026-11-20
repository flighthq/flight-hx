package flight._cpp._fn;

extern class Filesystem {
	@:native("flight_get_file_base_name")
	public static function getFileBaseName(path:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_get_file_directory_name")
	public static function getFileDirectoryName(path:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_get_file_extension_name")
	public static function getFileExtensionName(path:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_get_file_system_path")
	public static function getFileSystemPath(kind:Int):cpp.ConstCharStar;
	@:native("flight_is_absolute_file_path")
	public static function isAbsoluteFilePath(path:cpp.ConstCharStar):Bool;
	@:native("flight_join_file_path")
	public static function joinFilePath(segments:cpp.Star<cpp.Void>, segmentsLen:Int):cpp.ConstCharStar;
	@:native("flight_normalize_file_path")
	public static function normalizeFilePath(path:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_free_file_watch_unsubscribe")
	public static function freeFileWatchUnsubscribe(ptr:flight._cpp.FileWatchUnsubscribe):Void;
}
