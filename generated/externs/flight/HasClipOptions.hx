package flight;

#if hl

typedef HasClipOptions = flight._hl.HasClipOptions;

#elseif cpp

typedef HasClipOptions = flight._cpp.HasClipOptions;

#elseif (js && flight_esm)

typedef HasClipOptions = flight._js.HasClipOptions;

#elseif js

#error "flight.HasClipOptions on js requires flight_esm."

#else

#error "flight.HasClipOptions: no backend for this target."

#end
