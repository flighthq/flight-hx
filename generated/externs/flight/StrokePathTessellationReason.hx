package flight;

abstract StrokePathTessellationReason(Int) from Int to Int {
	public static inline var Ok:StrokePathTessellationReason = 0;
	public static inline var InvalidStyle:StrokePathTessellationReason = 1;
	public static inline var InvalidPath:StrokePathTessellationReason = 2;
	public static inline var SelfIntersectingCenterline:StrokePathTessellationReason = 3;
	public static inline var ReversingJoin:StrokePathTessellationReason = 4;
	public static inline var SelfIntersectingOutline:StrokePathTessellationReason = 5;
}
