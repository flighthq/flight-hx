package flight;

abstract RenderStateBackend(Int) from Int to Int {
	public static inline var Canvas:RenderStateBackend = 0;
	public static inline var Dom:RenderStateBackend = 1;
	public static inline var Gl:RenderStateBackend = 2;
	public static inline var Wgpu:RenderStateBackend = 3;
}
