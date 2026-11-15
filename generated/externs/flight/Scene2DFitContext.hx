package flight;

#if hl

typedef Scene2DFitContext = flight._hl.Scene2DFitContext;

#elseif cpp

typedef Scene2DFitContext = flight._cpp.Scene2DFitContext;

#elseif (js && flight_esm)

typedef Scene2DFitContext = flight._js.Scene2DFitContext;

#elseif js

#error "flight.Scene2DFitContext on js requires flight_esm."

#else

#error "flight.Scene2DFitContext: no backend for this target."

#end
