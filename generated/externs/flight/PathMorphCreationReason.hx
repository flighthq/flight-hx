package flight;

abstract PathMorphCreationReason(Int) from Int to Int {
	public static inline var Ok:PathMorphCreationReason = 0;
	public static inline var WindingMismatch:PathMorphCreationReason = 1;
	public static inline var ContourCountMismatch:PathMorphCreationReason = 2;
	public static inline var ContourClosednessMismatch:PathMorphCreationReason = 3;
	public static inline var ContourOrientationMismatch:PathMorphCreationReason = 4;
}
