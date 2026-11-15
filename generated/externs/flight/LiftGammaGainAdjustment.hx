package flight;

#if hl

typedef LiftGammaGainAdjustment = flight._hl.LiftGammaGainAdjustment;

#elseif cpp

typedef LiftGammaGainAdjustment = flight._cpp.LiftGammaGainAdjustment;

#elseif (js && flight_esm)

typedef LiftGammaGainAdjustment = flight._js.LiftGammaGainAdjustment;

#elseif js

#error "flight.LiftGammaGainAdjustment on js requires flight_esm."

#else

#error "flight.LiftGammaGainAdjustment: no backend for this target."

#end
