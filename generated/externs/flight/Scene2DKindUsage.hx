package flight;

#if hl

typedef Scene2DKindUsage = flight._hl.Scene2DKindUsage;

#elseif cpp

typedef Scene2DKindUsage = flight._cpp.Scene2DKindUsage;

#elseif (js && flight_esm)

typedef Scene2DKindUsage = flight._js.Scene2DKindUsage;

#elseif js

#error "flight.Scene2DKindUsage on js requires flight_esm."

#else

#error "flight.Scene2DKindUsage: no backend for this target."

#end
