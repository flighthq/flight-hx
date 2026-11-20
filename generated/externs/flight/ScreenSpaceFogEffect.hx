package flight;

#if hl

typedef ScreenSpaceFogEffect = flight._hl.ScreenSpaceFogEffect;

#elseif cpp

typedef ScreenSpaceFogEffect = flight._cpp.ScreenSpaceFogEffect;

#elseif (js && flight_esm)

typedef ScreenSpaceFogEffect = flight._js.ScreenSpaceFogEffect;

#elseif js

#error "flight.ScreenSpaceFogEffect on js requires flight_esm."

#else

#error "flight.ScreenSpaceFogEffect: no backend for this target."

#end
