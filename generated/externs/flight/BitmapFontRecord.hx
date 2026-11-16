package flight;

#if hl

typedef BitmapFontRecord = flight._hl.BitmapFontRecord;

#elseif cpp

typedef BitmapFontRecord = flight._cpp.BitmapFontRecord;

#elseif (js && flight_esm)

typedef BitmapFontRecord = flight._js.BitmapFontRecord;

#elseif js

#error "flight.BitmapFontRecord on js requires flight_esm."

#else

#error "flight.BitmapFontRecord: no backend for this target."

#end
