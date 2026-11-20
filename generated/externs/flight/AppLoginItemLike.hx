package flight;

#if hl

typedef AppLoginItemLike = flight._hl.AppLoginItemLike;

#elseif cpp

typedef AppLoginItemLike = flight._cpp.AppLoginItemLike;

#elseif (js && flight_esm)

typedef AppLoginItemLike = flight._js.AppLoginItemLike;

#elseif js

#error "flight.AppLoginItemLike on js requires flight_esm."

#else

#error "flight.AppLoginItemLike: no backend for this target."

#end
