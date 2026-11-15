package flight;

#if hl

typedef TintAdjustment = flight._hl.TintAdjustment;

#elseif cpp

typedef TintAdjustment = flight._cpp.TintAdjustment;

#elseif (js && flight_esm)

typedef TintAdjustment = flight._js.TintAdjustment;

#elseif js

#error "flight.TintAdjustment on js requires flight_esm."

#else

#error "flight.TintAdjustment: no backend for this target."

#end
