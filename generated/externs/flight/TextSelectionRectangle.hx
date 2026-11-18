package flight;

#if hl

typedef TextSelectionRectangle = flight._hl.TextSelectionRectangle;

#elseif cpp

typedef TextSelectionRectangle = flight._cpp.TextSelectionRectangle;

#elseif (js && flight_esm)

typedef TextSelectionRectangle = flight._js.TextSelectionRectangle;

#elseif js

#error "flight.TextSelectionRectangle on js requires flight_esm."

#else

#error "flight.TextSelectionRectangle: no backend for this target."

#end
