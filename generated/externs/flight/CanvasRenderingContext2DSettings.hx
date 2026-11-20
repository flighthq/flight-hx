package flight;

#if hl

typedef CanvasRenderingContext2DSettings = flight._hl.CanvasRenderingContext2DSettings;

#elseif cpp

typedef CanvasRenderingContext2DSettings = flight._cpp.CanvasRenderingContext2DSettings;

#elseif (js && flight_esm)

typedef CanvasRenderingContext2DSettings = flight._js.CanvasRenderingContext2DSettings;

#elseif js

#error "flight.CanvasRenderingContext2DSettings on js requires flight_esm."

#else

#error "flight.CanvasRenderingContext2DSettings: no backend for this target."

#end
