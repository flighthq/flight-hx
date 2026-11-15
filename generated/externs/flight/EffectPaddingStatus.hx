package flight;

abstract EffectPaddingStatus(Int) from Int to Int {
	public static inline var Complete:EffectPaddingStatus = 0;
	public static inline var MissingResolver:EffectPaddingStatus = 1;
}
