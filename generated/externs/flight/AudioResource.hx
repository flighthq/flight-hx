package flight;

#if hl

typedef AudioResource = flight._hl.AudioResource;

#elseif cpp

typedef AudioResource = flight._cpp.AudioResource;

#elseif (js && flight_esm)

typedef AudioResource = flight._js.AudioResource;

#elseif js

#error "flight.AudioResource on js requires flight_esm."

#else

#error "flight.AudioResource: no backend for this target."

#end
