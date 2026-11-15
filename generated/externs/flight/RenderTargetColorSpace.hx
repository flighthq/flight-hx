package flight;

abstract RenderTargetColorSpace(Int) from Int to Int {
	public static inline var Linear:RenderTargetColorSpace = 0;
	public static inline var Srgb:RenderTargetColorSpace = 1;
}
