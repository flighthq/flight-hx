package flight;

#if (js && flight_esm)
extern inline function createCanvasSurface(capability:HostCanvasCapability, window:Dynamic, width:Float, height:Float, options:Null<CanvasRenderingContext2DSettings>):Null<Dynamic> {
	return flight._js._fn.Surface.createCanvasSurface(capability, window, width, height, options);
}
#else
extern inline function createCanvasSurface(capability:HostCanvasCapability, window:Dynamic, width:Float, height:Float, options:CanvasRenderingContext2DSettings):Dynamic {
#if hl
	return flight._hl._fn.Surface.createCanvasSurface(capability, window, width, height, options);
#elseif cpp
	return flight._cpp._fn.Surface.createCanvasSurface(capability, window, width, height, options);
#elseif (js && flight_esm)
	return flight._js._fn.Surface.createCanvasSurface(capability, window, width, height, options);
#else
	#error "flight.Surface: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function destroyCanvasSurface(capability:HostCanvasCapability, surface:Dynamic):Void {
	flight._js._fn.Surface.destroyCanvasSurface(capability, surface);
}
#else
extern inline function destroyCanvasSurface(capability:HostCanvasCapability, surface:Dynamic):Void {
#if hl
	flight._hl._fn.Surface.destroyCanvasSurface(capability, surface);
#elseif cpp
	flight._cpp._fn.Surface.destroyCanvasSurface(capability, surface);
#elseif (js && flight_esm)
	flight._js._fn.Surface.destroyCanvasSurface(capability, surface);
#else
	#error "flight.Surface: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resizeSurface(capability:HostSurfaceResizeCapability, surface:SurfaceRef, width:Float, height:Float):Void {
	flight._js._fn.Surface.resizeSurface(capability, surface, width, height);
}
#else
extern inline function resizeSurface(capability:HostSurfaceResizeCapability, surface:SurfaceRef, width:Float, height:Float):Void {
#if hl
	flight._hl._fn.Surface.resizeSurface(capability, surface, width, height);
#elseif cpp
	flight._cpp._fn.Surface.resizeSurface(capability, surface, width, height);
#elseif (js && flight_esm)
	flight._js._fn.Surface.resizeSurface(capability, surface, width, height);
#else
	#error "flight.Surface: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setSurfaceDisplaySize(capability:HostSurfaceDisplayCapability, surface:SurfaceRef, width:Float, height:Float):Void {
	flight._js._fn.Surface.setSurfaceDisplaySize(capability, surface, width, height);
}
#else
extern inline function setSurfaceDisplaySize(capability:HostSurfaceDisplayCapability, surface:SurfaceRef, width:Float, height:Float):Void {
#if hl
	flight._hl._fn.Surface.setSurfaceDisplaySize(capability, surface, width, height);
#elseif cpp
	flight._cpp._fn.Surface.setSurfaceDisplaySize(capability, surface, width, height);
#elseif (js && flight_esm)
	flight._js._fn.Surface.setSurfaceDisplaySize(capability, surface, width, height);
#else
	#error "flight.Surface: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachWindowRenderState(hostSurfaceResize:HostSurfaceResizeCapability, win:Dynamic, surface:SurfaceRef):Void {
	flight._js._fn.Surface.attachWindowRenderState(hostSurfaceResize, win, surface);
}
#else
extern inline function attachWindowRenderState(hostSurfaceResize:HostSurfaceResizeCapability, win:Dynamic, surface:SurfaceRef):Void {
#if hl
	flight._hl._fn.Surface.attachWindowRenderState(hostSurfaceResize, win, surface);
#elseif cpp
	flight._cpp._fn.Surface.attachWindowRenderState(hostSurfaceResize, win, surface);
#elseif (js && flight_esm)
	flight._js._fn.Surface.attachWindowRenderState(hostSurfaceResize, win, surface);
#else
	#error "flight.Surface: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachWindowRenderState(win:Dynamic):Void {
	flight._js._fn.Surface.detachWindowRenderState(win);
}
#else
extern inline function detachWindowRenderState(win:Dynamic):Void {
#if hl
	flight._hl._fn.Surface.detachWindowRenderState(win);
#elseif cpp
	flight._cpp._fn.Surface.detachWindowRenderState(win);
#elseif (js && flight_esm)
	flight._js._fn.Surface.detachWindowRenderState(win);
#else
	#error "flight.Surface: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCanvasSurfaceRef(ptr:CanvasSurface):Void {
	flight._js._fn.Surface.freeCanvasSurfaceRef(ptr);
}
#else
extern inline function freeCanvasSurfaceRef(ptr:CanvasSurface):Void {
#if hl
	flight._hl._fn.Surface.freeCanvasSurfaceRef(ptr);
#elseif cpp
	flight._cpp._fn.Surface.freeCanvasSurfaceRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Surface.freeCanvasSurfaceRef(ptr);
#else
	#error "flight.Surface: no backend for this target."
#end
}
#end
