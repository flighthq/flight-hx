package flight;

#if hl

typedef TrayAnimationState = flight._hl.TrayAnimationState;

#elseif cpp

typedef TrayAnimationState = flight._cpp.TrayAnimationState;

#elseif (js && flight_esm)

typedef TrayAnimationState = flight._js.TrayAnimationState;

#elseif js

#error "flight.TrayAnimationState on js requires flight_esm."

#else

#error "flight.TrayAnimationState: no backend for this target."

#end
