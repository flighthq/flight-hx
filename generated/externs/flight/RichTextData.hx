package flight;

#if hl

typedef RichTextData = flight._hl.RichTextData;

#elseif cpp

typedef RichTextData = flight._cpp.RichTextData;

#elseif (js && flight_esm)

typedef RichTextData = flight._js.RichTextData;

#elseif js

#error "flight.RichTextData on js requires flight_esm."

#else

#error "flight.RichTextData: no backend for this target."

#end
