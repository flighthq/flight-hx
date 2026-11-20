package flight;

#if hl

typedef CameraMotionBlurEffect = flight._hl.CameraMotionBlurEffect;

#elseif cpp

typedef CameraMotionBlurEffect = flight._cpp.CameraMotionBlurEffect;

#elseif (js && flight_esm)

typedef CameraMotionBlurEffect = flight._js.CameraMotionBlurEffect;

#elseif js

#error "flight.CameraMotionBlurEffect on js requires flight_esm."

#else

#error "flight.CameraMotionBlurEffect: no backend for this target."

#end
