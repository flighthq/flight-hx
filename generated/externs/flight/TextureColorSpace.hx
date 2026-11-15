package flight;

abstract TextureColorSpace(Int) from Int to Int {
	public static inline var Linear:TextureColorSpace = 0;
	public static inline var Srgb:TextureColorSpace = 1;
}
