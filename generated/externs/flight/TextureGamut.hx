package flight;

abstract TextureGamut(Int) from Int to Int {
	public static inline var DisplayP3:TextureGamut = 0;
	public static inline var Srgb:TextureGamut = 1;
}
