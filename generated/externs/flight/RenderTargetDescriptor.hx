package flight;

#if hl

typedef RenderTargetDescriptor = flight._hl.RenderTargetDescriptor;

#elseif cpp

typedef RenderTargetDescriptor = flight._cpp.RenderTargetDescriptor;

#elseif (js && flight_esm)

typedef RenderTargetDescriptor = flight._js.RenderTargetDescriptor;

#elseif js

#error "flight.RenderTargetDescriptor on js requires flight_esm."

#else

#error "flight.RenderTargetDescriptor: no backend for this target."

#end
