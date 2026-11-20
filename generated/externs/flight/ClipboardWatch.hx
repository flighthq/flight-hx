package flight;

#if hl

typedef ClipboardWatch = flight._hl.ClipboardWatch;

#elseif cpp

typedef ClipboardWatch = flight._cpp.ClipboardWatch;

#elseif (js && flight_esm)

typedef ClipboardWatch = flight._js.ClipboardWatch;

#elseif js

#error "flight.ClipboardWatch on js requires flight_esm."

#else

#error "flight.ClipboardWatch: no backend for this target."

#end
