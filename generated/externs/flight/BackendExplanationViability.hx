package flight;

abstract BackendExplanationViability(Int) from Int to Int {
	public static inline var Available:BackendExplanationViability = 0;
	public static inline var RuntimeApiUnavailable:BackendExplanationViability = 1;
	public static inline var Unobserved:BackendExplanationViability = 2;
}
