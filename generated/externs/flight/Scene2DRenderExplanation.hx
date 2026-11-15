package flight;

#if hl

typedef Scene2DRenderExplanation = flight._hl.Scene2DRenderExplanation;

#elseif cpp

typedef Scene2DRenderExplanation = flight._cpp.Scene2DRenderExplanation;

#elseif (js && flight_esm)

typedef Scene2DRenderExplanation = flight._js.Scene2DRenderExplanation;

#elseif js

#error "flight.Scene2DRenderExplanation on js requires flight_esm."

#else

#error "flight.Scene2DRenderExplanation: no backend for this target."

#end
