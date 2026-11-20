package flight;

#if hl

typedef MarqueeSelection = flight._hl.MarqueeSelection;

#elseif cpp

typedef MarqueeSelection = flight._cpp.MarqueeSelection;

#elseif (js && flight_esm)

typedef MarqueeSelection = flight._js.MarqueeSelection;

#elseif js

#error "flight.MarqueeSelection on js requires flight_esm."

#else

#error "flight.MarqueeSelection: no backend for this target."

#end
