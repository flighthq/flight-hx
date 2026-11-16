package flight;

#if hl

typedef Awd2PropertiesRead = flight._hl.Awd2PropertiesRead;

#elseif cpp

typedef Awd2PropertiesRead = flight._cpp.Awd2PropertiesRead;

#elseif (js && flight_esm)

typedef Awd2PropertiesRead = flight._js.Awd2PropertiesRead;

#elseif js

#error "flight.Awd2PropertiesRead on js requires flight_esm."

#else

#error "flight.Awd2PropertiesRead: no backend for this target."

#end
