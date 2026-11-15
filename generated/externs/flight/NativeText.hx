package flight;

#if hl

typedef NativeText = flight._hl.NativeText;

#elseif cpp

typedef NativeText = flight._cpp.NativeText;

#elseif (js && flight_esm)

typedef NativeText = flight._js.NativeText;

#elseif js

#error "flight.NativeText on js requires flight_esm."

#else

#error "flight.NativeText: no backend for this target."

#end
