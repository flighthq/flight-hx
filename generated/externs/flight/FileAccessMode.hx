package flight;

abstract FileAccessMode(Int) from Int to Int {
	public static inline var Executable:FileAccessMode = 0;
	public static inline var Readable:FileAccessMode = 1;
	public static inline var Writable:FileAccessMode = 2;
}
