package flight;

#if hl

typedef ThreeDsPivotEntry = flight._hl.ThreeDsPivotEntry;

#elseif cpp

typedef ThreeDsPivotEntry = flight._cpp.ThreeDsPivotEntry;

#elseif (js && flight_esm)

typedef ThreeDsPivotEntry = flight._js.ThreeDsPivotEntry;

#elseif js

#error "flight.ThreeDsPivotEntry on js requires flight_esm."

#else

#error "flight.ThreeDsPivotEntry: no backend for this target."

#end
