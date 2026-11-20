package flight;

#if hl

typedef MotionBlurEffect = flight._hl.MotionBlurEffect;

#elseif cpp

typedef MotionBlurEffect = flight._cpp.MotionBlurEffect;

#elseif (js && flight_esm)

typedef MotionBlurEffect = flight._js.MotionBlurEffect;

#elseif js

#error "flight.MotionBlurEffect on js requires flight_esm."

#else

#error "flight.MotionBlurEffect: no backend for this target."

#end
