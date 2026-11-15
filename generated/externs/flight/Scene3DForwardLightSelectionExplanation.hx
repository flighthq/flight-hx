package flight;

#if hl

typedef Scene3DForwardLightSelectionExplanation = flight._hl.Scene3DForwardLightSelectionExplanation;

#elseif cpp

typedef Scene3DForwardLightSelectionExplanation = flight._cpp.Scene3DForwardLightSelectionExplanation;

#elseif (js && flight_esm)

typedef Scene3DForwardLightSelectionExplanation = flight._js.Scene3DForwardLightSelectionExplanation;

#elseif js

#error "flight.Scene3DForwardLightSelectionExplanation on js requires flight_esm."

#else

#error "flight.Scene3DForwardLightSelectionExplanation: no backend for this target."

#end
