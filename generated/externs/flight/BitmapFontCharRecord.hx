package flight;

#if hl

typedef BitmapFontCharRecord = flight._hl.BitmapFontCharRecord;

#elseif cpp

typedef BitmapFontCharRecord = flight._cpp.BitmapFontCharRecord;

#elseif (js && flight_esm)

typedef BitmapFontCharRecord = flight._js.BitmapFontCharRecord;

#elseif js

#error "flight.BitmapFontCharRecord on js requires flight_esm."

#else

#error "flight.BitmapFontCharRecord: no backend for this target."

#end
