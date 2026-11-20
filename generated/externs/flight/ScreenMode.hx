package flight;

#if hl

typedef ScreenMode = flight._hl.ScreenMode;

#elseif cpp

typedef ScreenMode = flight._cpp.ScreenMode;

#elseif (js && flight_esm)

typedef ScreenMode = flight._js.ScreenMode;

#elseif js

#error "flight.ScreenMode on js requires flight_esm."

#else

#error "flight.ScreenMode: no backend for this target."

#end
