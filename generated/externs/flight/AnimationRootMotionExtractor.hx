package flight;

#if hl

typedef AnimationRootMotionExtractor = flight._hl.AnimationRootMotionExtractor;

#elseif cpp

typedef AnimationRootMotionExtractor = flight._cpp.AnimationRootMotionExtractor;

#elseif (js && flight_esm)

typedef AnimationRootMotionExtractor = flight._js.AnimationRootMotionExtractor;

#elseif js

#error "flight.AnimationRootMotionExtractor on js requires flight_esm."

#else

#error "flight.AnimationRootMotionExtractor: no backend for this target."

#end
