package flight;

abstract TextureWrap(Int) from Int to Int {
	public static inline var ClampToEdge:TextureWrap = 0;
	public static inline var MirrorRepeat:TextureWrap = 1;
	public static inline var Repeat:TextureWrap = 2;
}
