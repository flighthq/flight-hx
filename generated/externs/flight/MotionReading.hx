package flight;

#if hl

typedef MotionReading = flight._hl.MotionReading;

#elseif cpp

typedef MotionReading = flight._cpp.MotionReading;

#elseif (js && flight_esm)

typedef MotionReading = flight._js.MotionReading;

#elseif js

#error "flight.MotionReading on js requires flight_esm."

#else

#error "flight.MotionReading: no backend for this target."

#end
