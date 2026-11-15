package flight;

abstract TiledOrientation(Int) from Int to Int {
	public static inline var Orthogonal:TiledOrientation = 0;
	public static inline var Isometric:TiledOrientation = 1;
	public static inline var Staggered:TiledOrientation = 2;
	public static inline var Hexagonal:TiledOrientation = 3;
}
