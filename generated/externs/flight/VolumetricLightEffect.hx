package flight;

#if hl

typedef VolumetricLightEffect = flight._hl.VolumetricLightEffect;

#elseif cpp

typedef VolumetricLightEffect = flight._cpp.VolumetricLightEffect;

#elseif (js && flight_esm)

typedef VolumetricLightEffect = flight._js.VolumetricLightEffect;

#elseif js

#error "flight.VolumetricLightEffect on js requires flight_esm."

#else

#error "flight.VolumetricLightEffect: no backend for this target."

#end
