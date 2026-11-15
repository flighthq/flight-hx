package flight;

#if hl

typedef Skin2D = flight._hl.Skin2D;

#elseif cpp

typedef Skin2D = flight._cpp.Skin2D;

#elseif (js && flight_esm)

typedef Skin2D = flight._js.Skin2D;

#elseif js

#error "flight.Skin2D on js requires flight_esm."

#else

#error "flight.Skin2D: no backend for this target."

#end
