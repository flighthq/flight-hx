package flight;

abstract ContentParserInputKind(Int) from Int to Int {
	public static inline var Bytes:ContentParserInputKind = 0;
	public static inline var String:ContentParserInputKind = 1;
}
