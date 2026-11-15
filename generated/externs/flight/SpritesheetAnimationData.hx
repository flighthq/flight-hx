package flight;

#if hl

typedef SpritesheetAnimationData = flight._hl.SpritesheetAnimationData;

#elseif cpp

typedef SpritesheetAnimationData = flight._cpp.SpritesheetAnimationData;

#elseif (js && flight_esm)

typedef SpritesheetAnimationData = flight._js.SpritesheetAnimationData;

#elseif js

#error "flight.SpritesheetAnimationData on js requires flight_esm."

#else

#error "flight.SpritesheetAnimationData: no backend for this target."

#end
