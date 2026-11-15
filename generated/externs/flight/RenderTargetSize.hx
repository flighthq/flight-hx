package flight;

#if hl

typedef RenderTargetSize = flight._hl.RenderTargetSize;

#elseif cpp

typedef RenderTargetSize = flight._cpp.RenderTargetSize;

#elseif (js && flight_esm)

typedef RenderTargetSize = flight._js.RenderTargetSize;

#elseif js

#error "flight.RenderTargetSize on js requires flight_esm."

#else

#error "flight.RenderTargetSize: no backend for this target."

#end
