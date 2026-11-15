package flight;

abstract EffectInput(Int) from Int to Int {
	public static inline var Hdr:EffectInput = 0;
	public static inline var Depth:EffectInput = 1;
	public static inline var Motion:EffectInput = 2;
	public static inline var Temporal:EffectInput = 3;
}
