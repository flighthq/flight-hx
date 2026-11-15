package flight;

#if hl

typedef LiftGammaGainAdjustmentOptions = flight._hl.LiftGammaGainAdjustmentOptions;

#elseif cpp

typedef LiftGammaGainAdjustmentOptions = flight._cpp.LiftGammaGainAdjustmentOptions;

#elseif (js && flight_esm)

typedef LiftGammaGainAdjustmentOptions = flight._js.LiftGammaGainAdjustmentOptions;

#elseif js

#error "flight.LiftGammaGainAdjustmentOptions on js requires flight_esm."

#else

#error "flight.LiftGammaGainAdjustmentOptions: no backend for this target."

#end
