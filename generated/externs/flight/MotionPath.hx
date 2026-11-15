package flight;

#if hl

typedef MotionPath = flight._hl.MotionPath;

#elseif cpp

typedef MotionPath = flight._cpp.MotionPath;

#elseif (js && flight_esm)

typedef MotionPath = flight._js.MotionPath;

#elseif js

#error "flight.MotionPath on js requires flight_esm."

#else

#error "flight.MotionPath: no backend for this target."

#end
