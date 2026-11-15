package flight;

abstract RenderTargetFormat(Int) from Int to Int {
	public static inline var Rgba8:RenderTargetFormat = 0;
	public static inline var Rgba16F:RenderTargetFormat = 1;
	public static inline var Rgba32F:RenderTargetFormat = 2;
}
