package flight;

#if hl

typedef AutoExposureEffect = flight._hl.AutoExposureEffect;

#elseif cpp

typedef AutoExposureEffect = flight._cpp.AutoExposureEffect;

#elseif (js && flight_esm)

typedef AutoExposureEffect = flight._js.AutoExposureEffect;

#elseif js

#error "flight.AutoExposureEffect on js requires flight_esm."

#else

#error "flight.AutoExposureEffect: no backend for this target."

#end
