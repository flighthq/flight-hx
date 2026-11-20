package flight;

abstract FileSystemPathKind(Int) from Int to Int {
	public static inline var AppData:FileSystemPathKind = 0;
	public static inline var Cache:FileSystemPathKind = 1;
	public static inline var Desktop:FileSystemPathKind = 2;
	public static inline var Documents:FileSystemPathKind = 3;
	public static inline var Downloads:FileSystemPathKind = 4;
	public static inline var Home:FileSystemPathKind = 5;
	public static inline var Temp:FileSystemPathKind = 6;
}
