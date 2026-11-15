package flight;

#if hl

typedef StrokeStyle = flight._hl.StrokeStyle;

#elseif cpp

typedef StrokeStyle = flight._cpp.StrokeStyle;

#elseif (js && flight_esm)

typedef StrokeStyle = flight._js.StrokeStyle;

#elseif js

#error "flight.StrokeStyle on js requires flight_esm."

#else

#error "flight.StrokeStyle: no backend for this target."

#end
