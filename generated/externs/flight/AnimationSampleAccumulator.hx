package flight;

#if hl

typedef AnimationSampleAccumulator = flight._hl.AnimationSampleAccumulator;

#elseif cpp

typedef AnimationSampleAccumulator = flight._cpp.AnimationSampleAccumulator;

#elseif (js && flight_esm)

typedef AnimationSampleAccumulator = flight._js.AnimationSampleAccumulator;

#elseif js

#error "flight.AnimationSampleAccumulator on js requires flight_esm."

#else

#error "flight.AnimationSampleAccumulator: no backend for this target."

#end
