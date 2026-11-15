package flight;

#if hl

typedef Node2DFields = flight._hl.Node2DFields;

#elseif cpp

typedef Node2DFields = flight._cpp.Node2DFields;

#elseif (js && flight_esm)

typedef Node2DFields = flight._js.Node2DFields;

#elseif js

#error "flight.Node2DFields on js requires flight_esm."

#else

#error "flight.Node2DFields: no backend for this target."

#end
