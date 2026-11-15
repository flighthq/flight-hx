package flight;

#if hl

typedef AnimationCrossfadeOptions = flight._hl.AnimationCrossfadeOptions;

#elseif cpp

typedef AnimationCrossfadeOptions = flight._cpp.AnimationCrossfadeOptions;

#elseif (js && flight_esm)

typedef AnimationCrossfadeOptions = flight._js.AnimationCrossfadeOptions;

#elseif js

#error "flight.AnimationCrossfadeOptions on js requires flight_esm."

#else

#error "flight.AnimationCrossfadeOptions: no backend for this target."

#end
