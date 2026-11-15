package flight;

abstract DisplacementMode(Int) from Int to Int {
	public static inline var Wrap:DisplacementMode = 0;
	public static inline var Clamp:DisplacementMode = 1;
	public static inline var Ignore:DisplacementMode = 2;
	public static inline var Color:DisplacementMode = 3;
}
