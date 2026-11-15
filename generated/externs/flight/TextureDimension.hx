package flight;

abstract TextureDimension(Int) from Int to Int {
	public static inline var Texture2D:TextureDimension = 0;
	public static inline var Texture2DArray:TextureDimension = 1;
	public static inline var Texture3D:TextureDimension = 2;
	public static inline var Cube:TextureDimension = 3;
}
