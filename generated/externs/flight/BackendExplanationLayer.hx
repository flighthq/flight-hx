package flight;

abstract BackendExplanationLayer(Int) from Int to Int {
	public static inline var Custom:BackendExplanationLayer = 0;
	public static inline var Host:BackendExplanationLayer = 1;
	public static inline var HostNotEnabled:BackendExplanationLayer = 2;
	public static inline var NoHostImplementation:BackendExplanationLayer = 3;
}
