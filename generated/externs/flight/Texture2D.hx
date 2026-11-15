package flight;

#if hl

typedef Texture2D = flight._hl.Texture2D;

#elseif cpp

typedef Texture2D = flight._cpp.Texture2D;

#elseif (js && flight_esm)

typedef Texture2D = flight._js.Texture2D;

#elseif js

#error "flight.Texture2D on js requires flight_esm."

#else

#error "flight.Texture2D: no backend for this target."

#end
