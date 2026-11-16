package flight;

#if hl

typedef Woff2Cursor = flight._hl.Woff2Cursor;

#elseif cpp

typedef Woff2Cursor = flight._cpp.Woff2Cursor;

#elseif (js && flight_esm)

typedef Woff2Cursor = flight._js.Woff2Cursor;

#elseif js

#error "flight.Woff2Cursor on js requires flight_esm."

#else

#error "flight.Woff2Cursor: no backend for this target."

#end
