package flight;

#if hl

typedef ColorBlindSimulationAdjustment = flight._hl.ColorBlindSimulationAdjustment;

#elseif cpp

typedef ColorBlindSimulationAdjustment = flight._cpp.ColorBlindSimulationAdjustment;

#elseif (js && flight_esm)

typedef ColorBlindSimulationAdjustment = flight._js.ColorBlindSimulationAdjustment;

#elseif js

#error "flight.ColorBlindSimulationAdjustment on js requires flight_esm."

#else

#error "flight.ColorBlindSimulationAdjustment: no backend for this target."

#end
