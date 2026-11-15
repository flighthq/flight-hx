package flight;

abstract ShapeTessellationStatus(Int) from Int to Int {
	public static inline var NeedsRasterizer:ShapeTessellationStatus = 0;
	public static inline var Tessellates:ShapeTessellationStatus = 1;
}
