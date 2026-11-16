package flight;

abstract MaterialAlphaMode(Int) from Int to Int {
	public static inline var Blend:MaterialAlphaMode = 0;
	public static inline var Mask:MaterialAlphaMode = 1;
	public static inline var Opaque:MaterialAlphaMode = 2;
}
