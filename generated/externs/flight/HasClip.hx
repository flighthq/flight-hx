package flight;

#if hl

typedef HasClip = flight._hl.HasClip;

#elseif cpp

typedef HasClip = flight._cpp.HasClip;

#elseif (js && flight_esm)

typedef HasClip = flight._js.HasClip;

#elseif js

#error "flight.HasClip on js requires flight_esm."

#else

#error "flight.HasClip: no backend for this target."

#end
