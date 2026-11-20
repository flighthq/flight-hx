package flight;

#if hl

typedef Scene3DKindUsage = flight._hl.Scene3DKindUsage;

#elseif cpp

typedef Scene3DKindUsage = flight._cpp.Scene3DKindUsage;

#elseif (js && flight_esm)

typedef Scene3DKindUsage = flight._js.Scene3DKindUsage;

#elseif js

#error "flight.Scene3DKindUsage on js requires flight_esm."

#else

#error "flight.Scene3DKindUsage: no backend for this target."

#end
