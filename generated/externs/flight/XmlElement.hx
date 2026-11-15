package flight;

#if hl

typedef XmlElement = flight._hl.XmlElement;

#elseif cpp

typedef XmlElement = flight._cpp.XmlElement;

#elseif (js && flight_esm)

typedef XmlElement = flight._js.XmlElement;

#elseif js

#error "flight.XmlElement on js requires flight_esm."

#else

#error "flight.XmlElement: no backend for this target."

#end
