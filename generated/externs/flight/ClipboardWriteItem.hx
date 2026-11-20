package flight;

#if hl

typedef ClipboardWriteItem = flight._hl.ClipboardWriteItem;

#elseif cpp

typedef ClipboardWriteItem = flight._cpp.ClipboardWriteItem;

#elseif (js && flight_esm)

typedef ClipboardWriteItem = flight._js.ClipboardWriteItem;

#elseif js

#error "flight.ClipboardWriteItem on js requires flight_esm."

#else

#error "flight.ClipboardWriteItem: no backend for this target."

#end
