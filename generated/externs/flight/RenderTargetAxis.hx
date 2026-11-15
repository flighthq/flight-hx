package flight;

abstract RenderTargetAxis(Int) from Int to Int {
	public static inline var Width:RenderTargetAxis = 0;
	public static inline var Height:RenderTargetAxis = 1;
	public static inline var Format:RenderTargetAxis = 2;
	public static inline var ColorAttachments:RenderTargetAxis = 3;
	public static inline var ColorFormats:RenderTargetAxis = 4;
	public static inline var SampleCount:RenderTargetAxis = 5;
	public static inline var Depth:RenderTargetAxis = 6;
	public static inline var ColorSpace:RenderTargetAxis = 7;
}
