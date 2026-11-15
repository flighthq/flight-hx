package flight;

abstract TiledRenderOrder(Int) from Int to Int {
	public static inline var RightDown:TiledRenderOrder = 0;
	public static inline var RightUp:TiledRenderOrder = 1;
	public static inline var LeftDown:TiledRenderOrder = 2;
	public static inline var LeftUp:TiledRenderOrder = 3;
}
