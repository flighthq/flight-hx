package flight;

#if hl

typedef AnimationClipEvent = flight._hl.AnimationClipEvent;

#elseif cpp

typedef AnimationClipEvent = flight._cpp.AnimationClipEvent;

#elseif (js && flight_esm)

typedef AnimationClipEvent = flight._js.AnimationClipEvent;

#elseif js

#error "flight.AnimationClipEvent on js requires flight_esm."

#else

#error "flight.AnimationClipEvent: no backend for this target."

#end
