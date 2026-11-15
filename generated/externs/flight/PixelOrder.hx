package flight;

abstract PixelOrder(Int) from Int to Int {
	public static inline var Rgba:PixelOrder = 0;
	public static inline var Bgra:PixelOrder = 1;
	public static inline var Argb:PixelOrder = 2;
	public static inline var Abgr:PixelOrder = 3;
}
