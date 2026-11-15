package flight;

#if hl

typedef UnpackedRectangleExplanation = flight._hl.UnpackedRectangleExplanation;

#elseif cpp

typedef UnpackedRectangleExplanation = flight._cpp.UnpackedRectangleExplanation;

#elseif (js && flight_esm)

typedef UnpackedRectangleExplanation = flight._js.UnpackedRectangleExplanation;

#elseif js

#error "flight.UnpackedRectangleExplanation on js requires flight_esm."

#else

#error "flight.UnpackedRectangleExplanation: no backend for this target."

#end
