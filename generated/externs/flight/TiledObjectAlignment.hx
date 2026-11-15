package flight;

abstract TiledObjectAlignment(Int) from Int to Int {
	public static inline var Unspecified:TiledObjectAlignment = 0;
	public static inline var TopLeft:TiledObjectAlignment = 1;
	public static inline var Top:TiledObjectAlignment = 2;
	public static inline var TopRight:TiledObjectAlignment = 3;
	public static inline var Left:TiledObjectAlignment = 4;
	public static inline var Center:TiledObjectAlignment = 5;
	public static inline var Right:TiledObjectAlignment = 6;
	public static inline var BottomLeft:TiledObjectAlignment = 7;
	public static inline var Bottom:TiledObjectAlignment = 8;
	public static inline var BottomRight:TiledObjectAlignment = 9;
}
