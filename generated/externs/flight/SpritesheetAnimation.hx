package flight;

#if hl

typedef SpritesheetAnimation = flight._hl.SpritesheetAnimation;

#elseif cpp

typedef SpritesheetAnimation = flight._cpp.SpritesheetAnimation;

#elseif (js && flight_esm)

typedef SpritesheetAnimation = flight._js.SpritesheetAnimation;

#elseif js

#error "flight.SpritesheetAnimation on js requires flight_esm."

#else

#error "flight.SpritesheetAnimation: no backend for this target."

#end
