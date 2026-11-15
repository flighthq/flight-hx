package flight;

abstract EffectSourceMode(Int) from Int to Int {
	public static inline var Draw:EffectSourceMode = 0;
	public static inline var Hide:EffectSourceMode = 1;
	public static inline var Knockout:EffectSourceMode = 2;
}
