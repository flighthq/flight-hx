package flight;

#if hl

typedef RenderTargetAxes = flight._hl.RenderTargetAxes;

#elseif cpp

typedef RenderTargetAxes = flight._cpp.RenderTargetAxes;

#elseif (js && flight_esm)

typedef RenderTargetAxes = flight._js.RenderTargetAxes;

#elseif js

#error "flight.RenderTargetAxes on js requires flight_esm."

#else

#error "flight.RenderTargetAxes: no backend for this target."

#end
