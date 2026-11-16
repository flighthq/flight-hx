package flight;

#if hl

typedef MotionPathDirection = flight._hl.MotionPathDirection;

#elseif cpp

typedef MotionPathDirection = flight._cpp.MotionPathDirection;

#elseif (js && flight_esm)

typedef MotionPathDirection = flight._js.MotionPathDirection;

#elseif js

#error "flight.MotionPathDirection on js requires flight_esm."

#else

#error "flight.MotionPathDirection: no backend for this target."

#end
