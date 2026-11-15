package flight;

#if hl

typedef SpritesheetAnimationFrameNameOptions = flight._hl.SpritesheetAnimationFrameNameOptions;

#elseif cpp

typedef SpritesheetAnimationFrameNameOptions = flight._cpp.SpritesheetAnimationFrameNameOptions;

#elseif (js && flight_esm)

typedef SpritesheetAnimationFrameNameOptions = flight._js.SpritesheetAnimationFrameNameOptions;

#elseif js

#error "flight.SpritesheetAnimationFrameNameOptions on js requires flight_esm."

#else

#error "flight.SpritesheetAnimationFrameNameOptions: no backend for this target."

#end
