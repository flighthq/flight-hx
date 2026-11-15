package flight;

#if hl

typedef Obb = flight._hl.Obb;

#elseif cpp

typedef Obb = flight._cpp.Obb;

#elseif (js && flight_esm)

typedef Obb = flight._js.Obb;

#elseif js

#error "flight.Obb on js requires flight_esm."

#else

#error "flight.Obb: no backend for this target."

#end
