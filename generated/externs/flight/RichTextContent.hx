package flight;

#if hl

typedef RichTextContent = flight._hl.RichTextContent;

#elseif cpp

typedef RichTextContent = flight._cpp.RichTextContent;

#elseif (js && flight_esm)

typedef RichTextContent = flight._js.RichTextContent;

#elseif js

#error "flight.RichTextContent on js requires flight_esm."

#else

#error "flight.RichTextContent: no backend for this target."

#end
