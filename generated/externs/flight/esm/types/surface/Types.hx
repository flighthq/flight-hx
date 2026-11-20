package flight.esm.types.surface;

#if (js && flight_esm)
typedef CanvasSurface = { __brand:String, context:js.html.CanvasRenderingContext2D };

typedef HostCanvasCapabilities = { ?context:Null<flight.esm.types.surface.Types.HostCanvasCapability> };

typedef HostCanvasCapability = { acquire:((surface:flight.esm.types.surface.Types.Surface, ?options:Dynamic) -> Null<js.html.CanvasRenderingContext2D>), create:((window:flight.esm.types.app.Types.AppWindow, width:Float, height:Float, ?options:Dynamic) -> Dynamic), createSurface:((width:Float, height:Float) -> Null<flight.esm.types.surface.Types.CanvasSurface>), destroySurface:((surface:flight.esm.types.surface.Types.CanvasSurface) -> Void), release:((surface:flight.esm.types.surface.Types.Surface) -> Void) };

typedef HostSurfaceCapabilities = { ?display:Null<flight.esm.types.surface.Types.HostSurfaceDisplayCapability>, ?resize:Null<flight.esm.types.surface.Types.HostSurfaceResizeCapability> };

typedef HostSurfaceContextCapability<Context, Options> = { acquire:((surface:flight.esm.types.surface.Types.Surface, ?options:Null<Options>) -> Null<Context>), create:((window:flight.esm.types.app.Types.AppWindow, width:Float, height:Float, ?options:Null<Options>) -> Dynamic), release:((surface:flight.esm.types.surface.Types.Surface) -> Void) };

typedef HostSurfaceDisplayCapability = { setDisplaySize:((surface:flight.esm.types.surface.Types.Surface, width:Float, height:Float) -> Void) };

typedef HostSurfaceResizeCapability = { resize:((surface:flight.esm.types.surface.Types.Surface, width:Float, height:Float) -> Void) };

typedef HostWgpuSurfaceCapability<Acquisition, Options> = { acquire:((surface:flight.esm.types.surface.Types.Surface, options:Dynamic) -> js.lib.Promise<Acquisition>), create:((window:flight.esm.types.app.Types.AppWindow, width:Float, height:Float) -> Dynamic), release:((acquisition:Acquisition) -> Void) };

typedef NativeSurfaceHandle = Dynamic;

typedef Surface = Dynamic;

typedef SurfaceRuntime = { handle:Dynamic, binding:Dynamic, ?uid:Null<String> };

typedef SurfaceWithAcquisition<Acquisition, Brand> = { __brand:Brand, acquisition:Acquisition };

typedef SurfaceWithContext<Context, Brand> = { __brand:Brand, context:Context };

typedef WgpuPresentationSurface = { height:Float, width:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
