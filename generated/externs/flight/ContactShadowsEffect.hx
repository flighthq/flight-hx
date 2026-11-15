package flight;

#if hl

typedef ContactShadowsEffect = flight._hl.ContactShadowsEffect;

#elseif cpp

typedef ContactShadowsEffect = flight._cpp.ContactShadowsEffect;

#elseif (js && flight_esm)

typedef ContactShadowsEffect = flight._js.ContactShadowsEffect;

#elseif js

#error "flight.ContactShadowsEffect on js requires flight_esm."

#else

#error "flight.ContactShadowsEffect: no backend for this target."

#end
