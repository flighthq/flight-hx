package flight;

#if hl

typedef ShareTextContent = flight._hl.ShareTextContent;

#elseif cpp

typedef ShareTextContent = flight._cpp.ShareTextContent;

#elseif (js && flight_esm)

typedef ShareTextContent = flight._js.ShareTextContent;

#elseif js

#error "flight.ShareTextContent on js requires flight_esm."

#else

#error "flight.ShareTextContent: no backend for this target."

#end
