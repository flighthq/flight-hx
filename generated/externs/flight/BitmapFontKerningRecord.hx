package flight;

#if hl

typedef BitmapFontKerningRecord = flight._hl.BitmapFontKerningRecord;

#elseif cpp

typedef BitmapFontKerningRecord = flight._cpp.BitmapFontKerningRecord;

#elseif (js && flight_esm)

typedef BitmapFontKerningRecord = flight._js.BitmapFontKerningRecord;

#elseif js

#error "flight.BitmapFontKerningRecord on js requires flight_esm."

#else

#error "flight.BitmapFontKerningRecord: no backend for this target."

#end
