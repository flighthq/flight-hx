package flight;

#if hl

typedef SelectableRichTextManager = flight._hl.SelectableRichTextManager;

#elseif cpp

typedef SelectableRichTextManager = flight._cpp.SelectableRichTextManager;

#elseif (js && flight_esm)

typedef SelectableRichTextManager = flight._js.SelectableRichTextManager;

#elseif js

#error "flight.SelectableRichTextManager on js requires flight_esm."

#else

#error "flight.SelectableRichTextManager: no backend for this target."

#end
