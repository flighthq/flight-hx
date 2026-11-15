package flight;

#if hl

typedef TiltShiftEffect = flight._hl.TiltShiftEffect;

#elseif cpp

typedef TiltShiftEffect = flight._cpp.TiltShiftEffect;

#elseif (js && flight_esm)

typedef TiltShiftEffect = flight._js.TiltShiftEffect;

#elseif js

#error "flight.TiltShiftEffect on js requires flight_esm."

#else

#error "flight.TiltShiftEffect: no backend for this target."

#end
