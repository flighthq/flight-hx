package flight;

abstract AlphaType(Int) from Int to Int {
	public static inline var Opaque:AlphaType = 0;
	public static inline var Premultiplied:AlphaType = 1;
	public static inline var Straight:AlphaType = 2;
}
