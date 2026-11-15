package flight;

#if hl

typedef TweenContext = flight._hl.TweenContext;

#elseif cpp

typedef TweenContext = flight._cpp.TweenContext;

#elseif (js && flight_esm)

typedef TweenContext = flight._js.TweenContext;

#elseif js

#error "flight.TweenContext on js requires flight_esm."

#else

#error "flight.TweenContext: no backend for this target."

#end
