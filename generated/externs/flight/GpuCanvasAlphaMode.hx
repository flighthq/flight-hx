package flight;

abstract GpuCanvasAlphaMode(Int) from Int to Int {
	public static inline var Opaque:GpuCanvasAlphaMode = 0;
	public static inline var Premultiplied:GpuCanvasAlphaMode = 1;
}
