package flight;

abstract RenderTargetFormatPolicy(Int) from Int to Int {
	public static inline var Preferred:RenderTargetFormatPolicy = 0;
	public static inline var Required:RenderTargetFormatPolicy = 1;
}
