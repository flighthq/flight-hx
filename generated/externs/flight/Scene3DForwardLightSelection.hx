package flight;

#if hl

typedef Scene3DForwardLightSelection = flight._hl.Scene3DForwardLightSelection;

#elseif cpp

typedef Scene3DForwardLightSelection = flight._cpp.Scene3DForwardLightSelection;

#elseif (js && flight_esm)

typedef Scene3DForwardLightSelection = flight._js.Scene3DForwardLightSelection;

#elseif js

#error "flight.Scene3DForwardLightSelection on js requires flight_esm."

#else

#error "flight.Scene3DForwardLightSelection: no backend for this target."

#end
