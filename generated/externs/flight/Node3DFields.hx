package flight;

#if hl

typedef Node3DFields = flight._hl.Node3DFields;

#elseif cpp

typedef Node3DFields = flight._cpp.Node3DFields;

#elseif (js && flight_esm)

typedef Node3DFields = flight._js.Node3DFields;

#elseif js

#error "flight.Node3DFields on js requires flight_esm."

#else

#error "flight.Node3DFields: no backend for this target."

#end
