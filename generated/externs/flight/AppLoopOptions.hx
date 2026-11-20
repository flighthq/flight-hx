package flight;

#if hl

typedef AppLoopOptions = flight._hl.AppLoopOptions;

#elseif cpp

typedef AppLoopOptions = flight._cpp.AppLoopOptions;

#elseif (js && flight_esm)

typedef AppLoopOptions = flight._js.AppLoopOptions;

#elseif js

#error "flight.AppLoopOptions on js requires flight_esm."

#else

#error "flight.AppLoopOptions: no backend for this target."

#end
