package flight;

abstract CompressionFraming(Int) from Int to Int {
	public static inline var Raw:CompressionFraming = 0;
	public static inline var Rfc1950:CompressionFraming = 1;
}
