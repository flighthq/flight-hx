package flight;

#if hl

typedef InteractionHitEligibility = flight._hl.InteractionHitEligibility;

#elseif cpp

typedef InteractionHitEligibility = flight._cpp.InteractionHitEligibility;

#elseif (js && flight_esm)

typedef InteractionHitEligibility = flight._js.InteractionHitEligibility;

#elseif js

#error "flight.InteractionHitEligibility on js requires flight_esm."

#else

#error "flight.InteractionHitEligibility: no backend for this target."

#end
