package flight;

abstract InnerEffectSourceMode(Int) from Int to Int {
	public static inline var Draw:InnerEffectSourceMode = 0;
	public static inline var Hide:InnerEffectSourceMode = 1;
}
