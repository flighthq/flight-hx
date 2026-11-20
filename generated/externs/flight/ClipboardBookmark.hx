package flight;

#if hl

typedef ClipboardBookmark = flight._hl.ClipboardBookmark;

#elseif cpp

typedef ClipboardBookmark = flight._cpp.ClipboardBookmark;

#elseif (js && flight_esm)

typedef ClipboardBookmark = flight._js.ClipboardBookmark;

#elseif js

#error "flight.ClipboardBookmark on js requires flight_esm."

#else

#error "flight.ClipboardBookmark: no backend for this target."

#end
