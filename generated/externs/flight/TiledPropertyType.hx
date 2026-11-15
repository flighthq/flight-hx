package flight;

abstract TiledPropertyType(Int) from Int to Int {
	public static inline var String:TiledPropertyType = 0;
	public static inline var Int:TiledPropertyType = 1;
	public static inline var Float:TiledPropertyType = 2;
	public static inline var Bool:TiledPropertyType = 3;
	public static inline var Color:TiledPropertyType = 4;
	public static inline var File:TiledPropertyType = 5;
	public static inline var Object:TiledPropertyType = 6;
}
