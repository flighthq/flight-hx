package flight;

#if hl

typedef TweenPropertyDetail = flight._hl.TweenPropertyDetail;

#elseif cpp

typedef TweenPropertyDetail = flight._cpp.TweenPropertyDetail;

#elseif (js && flight_esm)

typedef TweenPropertyDetail = flight._js.TweenPropertyDetail;

#elseif js

#error "flight.TweenPropertyDetail on js requires flight_esm."

#else

#error "flight.TweenPropertyDetail: no backend for this target."

#end
