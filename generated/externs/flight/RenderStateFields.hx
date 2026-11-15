package flight;

#if hl

typedef RenderStateFields = flight._hl.RenderStateFields;

#elseif cpp

typedef RenderStateFields = flight._cpp.RenderStateFields;

#elseif (js && flight_esm)

typedef RenderStateFields = flight._js.RenderStateFields;

#elseif js

#error "flight.RenderStateFields on js requires flight_esm."

#else

#error "flight.RenderStateFields: no backend for this target."

#end
