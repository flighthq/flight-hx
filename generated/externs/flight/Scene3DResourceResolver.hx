package flight;

#if hl

typedef Scene3DResourceResolver = flight._hl.Scene3DResourceResolver;

#elseif cpp

typedef Scene3DResourceResolver = flight._cpp.Scene3DResourceResolver;

#elseif (js && flight_esm)

typedef Scene3DResourceResolver = flight._js.Scene3DResourceResolver;

#elseif js

#error "flight.Scene3DResourceResolver on js requires flight_esm."

#else

#error "flight.Scene3DResourceResolver: no backend for this target."

#end
