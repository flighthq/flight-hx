package flight;

abstract ShapeTessellationBlockedBy(Int) from Int to Int {
	public static inline var NonSolidFill:ShapeTessellationBlockedBy = 0;
	public static inline var NonSolidStroke:ShapeTessellationBlockedBy = 1;
	public static inline var None:ShapeTessellationBlockedBy = 2;
	public static inline var StrokeOutline:ShapeTessellationBlockedBy = 3;
}
