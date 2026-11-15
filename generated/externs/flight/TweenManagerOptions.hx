package flight;

#if hl

typedef TweenManagerOptions = flight._hl.TweenManagerOptions;

#elseif cpp

typedef TweenManagerOptions = flight._cpp.TweenManagerOptions;

#elseif (js && flight_esm)

typedef TweenManagerOptions = flight._js.TweenManagerOptions;

#elseif js

#error "flight.TweenManagerOptions on js requires flight_esm."

#else

#error "flight.TweenManagerOptions: no backend for this target."

#end
