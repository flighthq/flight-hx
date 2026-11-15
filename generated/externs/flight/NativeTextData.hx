package flight;

#if hl

typedef NativeTextData = flight._hl.NativeTextData;

#elseif cpp

typedef NativeTextData = flight._cpp.NativeTextData;

#elseif (js && flight_esm)

typedef NativeTextData = flight._js.NativeTextData;

#elseif js

#error "flight.NativeTextData on js requires flight_esm."

#else

#error "flight.NativeTextData: no backend for this target."

#end
