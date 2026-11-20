package flight;

#if hl

typedef HitTestContext = flight._hl.HitTestContext;

#elseif cpp

typedef HitTestContext = flight._cpp.HitTestContext;

#elseif (js && flight_esm)

typedef HitTestContext = flight._js.HitTestContext;

#elseif js

#error "flight.HitTestContext on js requires flight_esm."

#else

#error "flight.HitTestContext: no backend for this target."

#end
