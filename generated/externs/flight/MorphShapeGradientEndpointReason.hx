package flight;

abstract MorphShapeGradientEndpointReason(Int) from Int to Int {
	public static inline var EmptyGradient:MorphShapeGradientEndpointReason = 0;
	public static inline var EndStopComponentCountMismatch:MorphShapeGradientEndpointReason = 1;
	public static inline var Ok:MorphShapeGradientEndpointReason = 2;
	public static inline var StartStopComponentCountMismatch:MorphShapeGradientEndpointReason = 3;
	public static inline var StopCountMismatch:MorphShapeGradientEndpointReason = 4;
}
