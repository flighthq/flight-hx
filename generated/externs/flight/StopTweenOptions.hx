package flight;

#if hl

typedef StopTweenOptions = flight._hl.StopTweenOptions;

#elseif cpp

typedef StopTweenOptions = flight._cpp.StopTweenOptions;

#elseif (js && flight_esm)

typedef StopTweenOptions = flight._js.StopTweenOptions;

#elseif js

#error "flight.StopTweenOptions on js requires flight_esm."

#else

#error "flight.StopTweenOptions: no backend for this target."

#end
