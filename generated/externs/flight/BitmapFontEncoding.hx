package flight;

abstract BitmapFontEncoding(Int) from Int to Int {
	public static inline var Msdf:BitmapFontEncoding = 0;
	public static inline var Raster:BitmapFontEncoding = 1;
	public static inline var Sdf:BitmapFontEncoding = 2;
}
