package flight;

abstract LibgdxSpawnShape(Int) from Int to Int {
	public static inline var Point:LibgdxSpawnShape = 0;
	public static inline var Line:LibgdxSpawnShape = 1;
	public static inline var Square:LibgdxSpawnShape = 2;
	public static inline var Ellipse:LibgdxSpawnShape = 3;
}
