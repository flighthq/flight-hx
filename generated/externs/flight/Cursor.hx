package flight;

#if hl

typedef Cursor = flight._hl.Cursor;

#elseif cpp

typedef Cursor = flight._cpp.Cursor;

#elseif (js && flight_esm)

typedef Cursor = flight._js.Cursor;

#elseif js

#error "flight.Cursor on js requires flight_esm."

#else

#error "flight.Cursor: no backend for this target."

#end
