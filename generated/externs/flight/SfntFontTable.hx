package flight;

#if hl

typedef SfntFontTable = flight._hl.SfntFontTable;

#elseif cpp

typedef SfntFontTable = flight._cpp.SfntFontTable;

#elseif (js && flight_esm)

typedef SfntFontTable = flight._js.SfntFontTable;

#elseif js

#error "flight.SfntFontTable on js requires flight_esm."

#else

#error "flight.SfntFontTable: no backend for this target."

#end
