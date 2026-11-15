package flight;

abstract TextureFilter(Int) from Int to Int {
	public static inline var Linear:TextureFilter = 0;
	public static inline var LinearMipmapLinear:TextureFilter = 1;
	public static inline var LinearMipmapNearest:TextureFilter = 2;
	public static inline var Nearest:TextureFilter = 3;
	public static inline var NearestMipmapLinear:TextureFilter = 4;
	public static inline var NearestMipmapNearest:TextureFilter = 5;
}
