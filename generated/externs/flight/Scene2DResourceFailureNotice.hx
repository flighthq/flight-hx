package flight;

#if hl

typedef Scene2DResourceFailureNotice = flight._hl.Scene2DResourceFailureNotice;

#elseif cpp

typedef Scene2DResourceFailureNotice = flight._cpp.Scene2DResourceFailureNotice;

#elseif (js && flight_esm)

typedef Scene2DResourceFailureNotice = flight._js.Scene2DResourceFailureNotice;

#elseif js

#error "flight.Scene2DResourceFailureNotice on js requires flight_esm."

#else

#error "flight.Scene2DResourceFailureNotice: no backend for this target."

#end
