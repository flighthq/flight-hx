package flight;

#if hl

typedef Scene3DPickOptions = flight._hl.Scene3DPickOptions;

#elseif cpp

typedef Scene3DPickOptions = flight._cpp.Scene3DPickOptions;

#elseif (js && flight_esm)

typedef Scene3DPickOptions = flight._js.Scene3DPickOptions;

#elseif js

#error "flight.Scene3DPickOptions on js requires flight_esm."

#else

#error "flight.Scene3DPickOptions: no backend for this target."

#end
