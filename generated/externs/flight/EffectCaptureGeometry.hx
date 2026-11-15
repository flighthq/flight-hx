package flight;

#if hl

typedef EffectCaptureGeometry = flight._hl.EffectCaptureGeometry;

#elseif cpp

typedef EffectCaptureGeometry = flight._cpp.EffectCaptureGeometry;

#elseif (js && flight_esm)

typedef EffectCaptureGeometry = flight._js.EffectCaptureGeometry;

#elseif js

#error "flight.EffectCaptureGeometry on js requires flight_esm."

#else

#error "flight.EffectCaptureGeometry: no backend for this target."

#end
