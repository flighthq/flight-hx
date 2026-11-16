package flight;

#if hl

typedef Material3DFields = flight._hl.Material3DFields;

#elseif cpp

typedef Material3DFields = flight._cpp.Material3DFields;

#elseif (js && flight_esm)

typedef Material3DFields = flight._js.Material3DFields;

#elseif js

#error "flight.Material3DFields on js requires flight_esm."

#else

#error "flight.Material3DFields: no backend for this target."

#end
