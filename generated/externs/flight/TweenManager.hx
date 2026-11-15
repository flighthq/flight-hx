package flight;

#if hl

typedef TweenManager = flight._hl.TweenManager;

#elseif cpp

typedef TweenManager = flight._cpp.TweenManager;

#elseif (js && flight_esm)

typedef TweenManager = flight._js.TweenManager;

#elseif js

#error "flight.TweenManager on js requires flight_esm."

#else

#error "flight.TweenManager: no backend for this target."

#end
