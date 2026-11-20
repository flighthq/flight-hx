package flight;

abstract AppPathKind(Int) from Int to Int {
	public static inline var UserData:AppPathKind = 0;
	public static inline var Logs:AppPathKind = 1;
	public static inline var CrashDumps:AppPathKind = 2;
}
