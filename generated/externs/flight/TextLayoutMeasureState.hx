package flight;

#if hl

typedef TextLayoutMeasureState = flight._hl.TextLayoutMeasureState;

#elseif cpp

typedef TextLayoutMeasureState = flight._cpp.TextLayoutMeasureState;

#elseif (js && flight_esm)

typedef TextLayoutMeasureState = flight._js.TextLayoutMeasureState;

#elseif js

#error "flight.TextLayoutMeasureState on js requires flight_esm."

#else

#error "flight.TextLayoutMeasureState: no backend for this target."

#end
