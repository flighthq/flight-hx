package flight;

#if hl

typedef ExternalImageResourceReference = flight._hl.ExternalImageResourceReference;

#elseif cpp

typedef ExternalImageResourceReference = flight._cpp.ExternalImageResourceReference;

#elseif (js && flight_esm)

typedef ExternalImageResourceReference = flight._js.ExternalImageResourceReference;

#elseif js

#error "flight.ExternalImageResourceReference on js requires flight_esm."

#else

#error "flight.ExternalImageResourceReference: no backend for this target."

#end
