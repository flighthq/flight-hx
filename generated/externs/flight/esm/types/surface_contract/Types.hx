package flight.esm.types.surface_contract;

#if (js && flight_esm)
typedef CanvasSurface = flight.esm.types.surface.Types.CanvasSurface;

typedef HostCanvasCapabilities = flight.esm.types.surface.Types.HostCanvasCapabilities;

typedef HostCanvasCapability = flight.esm.types.surface.Types.HostCanvasCapability;

typedef HostSurfaceCapabilities = flight.esm.types.surface.Types.HostSurfaceCapabilities;

typedef HostSurfaceContextCapability<Context, Options> = flight.esm.types.surface.Types.HostSurfaceContextCapability<Context, Options>;

typedef HostSurfaceDisplayCapability = flight.esm.types.surface.Types.HostSurfaceDisplayCapability;

typedef HostSurfaceResizeCapability = flight.esm.types.surface.Types.HostSurfaceResizeCapability;

typedef HostWgpuSurfaceCapability<Acquisition, Options> = flight.esm.types.surface.Types.HostWgpuSurfaceCapability<Acquisition, Options>;

typedef NativeSurfaceHandle = flight.esm.types.surface.Types.NativeSurfaceHandle;

typedef Surface = flight.esm.types.surface.Types.Surface;

typedef SurfaceRuntime = flight.esm.types.surface.Types.SurfaceRuntime;

typedef SurfaceWithAcquisition<Acquisition, Brand> = flight.esm.types.surface.Types.SurfaceWithAcquisition<Acquisition, Brand>;

typedef SurfaceWithContext<Context, Brand> = flight.esm.types.surface.Types.SurfaceWithContext<Context, Brand>;

typedef WgpuPresentationSurface = flight.esm.types.surface.Types.WgpuPresentationSurface;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
