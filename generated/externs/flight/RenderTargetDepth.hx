package flight;

abstract RenderTargetDepth(Int) from Int to Int {
	public static inline var None:RenderTargetDepth = 0;
	public static inline var DepthStencil:RenderTargetDepth = 1;
	public static inline var DepthStencilSampled:RenderTargetDepth = 2;
}
