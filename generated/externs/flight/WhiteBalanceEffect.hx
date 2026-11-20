package flight;

#if hl

typedef WhiteBalanceEffect = flight._hl.WhiteBalanceEffect;

#elseif cpp

typedef WhiteBalanceEffect = flight._cpp.WhiteBalanceEffect;

#elseif (js && flight_esm)

typedef WhiteBalanceEffect = flight._js.WhiteBalanceEffect;

#elseif js

#error "flight.WhiteBalanceEffect on js requires flight_esm."

#else

#error "flight.WhiteBalanceEffect: no backend for this target."

#end
