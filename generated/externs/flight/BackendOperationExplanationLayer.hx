package flight;

abstract BackendOperationExplanationLayer(Int) from Int to Int {
	public static inline var Custom:BackendOperationExplanationLayer = 0;
	public static inline var Host:BackendOperationExplanationLayer = 1;
	public static inline var None:BackendOperationExplanationLayer = 2;
	public static inline var Sentinel:BackendOperationExplanationLayer = 3;
}
