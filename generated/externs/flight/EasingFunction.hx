package flight;

#if hl

typedef EasingFunction = flight._hl.EasingFunction;

#elseif cpp

typedef EasingFunction = flight._cpp.EasingFunction;

#elseif (js && flight_esm)

typedef EasingFunction = flight._js.EasingFunction;

#elseif js

#error "flight.EasingFunction on js requires flight_esm."

#else

#error "flight.EasingFunction: no backend for this target."

#end
