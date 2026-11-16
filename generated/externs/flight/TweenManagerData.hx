package flight;

#if hl

typedef TweenManagerData = flight._hl.TweenManagerData;

#elseif cpp

typedef TweenManagerData = flight._cpp.TweenManagerData;

#elseif (js && flight_esm)

typedef TweenManagerData = flight._js.TweenManagerData;

#elseif js

#error "flight.TweenManagerData on js requires flight_esm."

#else

#error "flight.TweenManagerData: no backend for this target."

#end
