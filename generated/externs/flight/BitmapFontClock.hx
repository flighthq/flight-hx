package flight;

#if hl

typedef BitmapFontClock = flight._hl.BitmapFontClock;

#elseif cpp

typedef BitmapFontClock = flight._cpp.BitmapFontClock;

#elseif (js && flight_esm)

typedef BitmapFontClock = flight._js.BitmapFontClock;

#elseif js

#error "flight.BitmapFontClock on js requires flight_esm."

#else

#error "flight.BitmapFontClock: no backend for this target."

#end
