package flight;

#if hl

typedef AppStepOptions = flight._hl.AppStepOptions;

#elseif cpp

typedef AppStepOptions = flight._cpp.AppStepOptions;

#elseif (js && flight_esm)

typedef AppStepOptions = flight._js.AppStepOptions;

#elseif js

#error "flight.AppStepOptions on js requires flight_esm."

#else

#error "flight.AppStepOptions: no backend for this target."

#end
