package flight;

#if hl

typedef FxaaEffect = flight._hl.FxaaEffect;

#elseif cpp

typedef FxaaEffect = flight._cpp.FxaaEffect;

#elseif (js && flight_esm)

typedef FxaaEffect = flight._js.FxaaEffect;

#elseif js

#error "flight.FxaaEffect on js requires flight_esm."

#else

#error "flight.FxaaEffect: no backend for this target."

#end
