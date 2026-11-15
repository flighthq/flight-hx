package flight;

#if hl

typedef ColorBlindSimulationAdjustmentOptions = flight._hl.ColorBlindSimulationAdjustmentOptions;

#elseif cpp

typedef ColorBlindSimulationAdjustmentOptions = flight._cpp.ColorBlindSimulationAdjustmentOptions;

#elseif (js && flight_esm)

typedef ColorBlindSimulationAdjustmentOptions = flight._js.ColorBlindSimulationAdjustmentOptions;

#elseif js

#error "flight.ColorBlindSimulationAdjustmentOptions on js requires flight_esm."

#else

#error "flight.ColorBlindSimulationAdjustmentOptions: no backend for this target."

#end
