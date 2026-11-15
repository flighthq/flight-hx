package flight;

#if hl

typedef BitmapEncodeFailureExplanation = flight._hl.BitmapEncodeFailureExplanation;

#elseif cpp

typedef BitmapEncodeFailureExplanation = flight._cpp.BitmapEncodeFailureExplanation;

#elseif (js && flight_esm)

typedef BitmapEncodeFailureExplanation = flight._js.BitmapEncodeFailureExplanation;

#elseif js

#error "flight.BitmapEncodeFailureExplanation on js requires flight_esm."

#else

#error "flight.BitmapEncodeFailureExplanation: no backend for this target."

#end
