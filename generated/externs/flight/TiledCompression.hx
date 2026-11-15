package flight;

abstract TiledCompression(Int) from Int to Int {
	public static inline var Gzip:TiledCompression = 0;
	public static inline var Zlib:TiledCompression = 1;
	public static inline var Zstd:TiledCompression = 2;
}
