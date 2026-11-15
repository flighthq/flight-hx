package flight;

#if hl

typedef NativeTextStyle = flight._hl.NativeTextStyle;

#elseif cpp

typedef NativeTextStyle = flight._cpp.NativeTextStyle;

#elseif (js && flight_esm)

typedef NativeTextStyle = flight._js.NativeTextStyle;

#elseif js

#error "flight.NativeTextStyle on js requires flight_esm."

#else

#error "flight.NativeTextStyle: no backend for this target."

#end
