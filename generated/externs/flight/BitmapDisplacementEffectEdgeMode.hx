package flight;

abstract BitmapDisplacementEffectEdgeMode(Int) from Int to Int {
	public static inline var Clamp:BitmapDisplacementEffectEdgeMode = 0;
	public static inline var Wrap:BitmapDisplacementEffectEdgeMode = 1;
}
