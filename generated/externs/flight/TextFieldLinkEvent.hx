package flight;

#if hl

typedef TextFieldLinkEvent = flight._hl.TextFieldLinkEvent;

#elseif cpp

typedef TextFieldLinkEvent = flight._cpp.TextFieldLinkEvent;

#elseif (js && flight_esm)

typedef TextFieldLinkEvent = flight._js.TextFieldLinkEvent;

#elseif js

#error "flight.TextFieldLinkEvent on js requires flight_esm."

#else

#error "flight.TextFieldLinkEvent: no backend for this target."

#end
