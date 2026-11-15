package flight;

abstract FogModifierMode(Int) from Int to Int {
	public static inline var Exponential:FogModifierMode = 0;
	public static inline var Exponential2:FogModifierMode = 1;
	public static inline var Linear:FogModifierMode = 2;
}
