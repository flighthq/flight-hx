package flight;

abstract SceneCoverage(Int) from Int to Int {
	public static inline var FallbackRemediable:SceneCoverage = 0;
	public static inline var FallbackUnavailable:SceneCoverage = 1;
	public static inline var Satisfied:SceneCoverage = 2;
	public static inline var Unavailable:SceneCoverage = 3;
	public static inline var Unregistered:SceneCoverage = 4;
}
