package flight;

#if hl

typedef BitmapFontPageRecord = flight._hl.BitmapFontPageRecord;

#elseif cpp

typedef BitmapFontPageRecord = flight._cpp.BitmapFontPageRecord;

#elseif (js && flight_esm)

typedef BitmapFontPageRecord = flight._js.BitmapFontPageRecord;

#elseif js

#error "flight.BitmapFontPageRecord on js requires flight_esm."

#else

#error "flight.BitmapFontPageRecord: no backend for this target."

#end
