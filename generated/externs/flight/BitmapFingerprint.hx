package flight;

#if hl

typedef BitmapFingerprint = flight._hl.BitmapFingerprint;

#elseif cpp

typedef BitmapFingerprint = flight._cpp.BitmapFingerprint;

#elseif (js && flight_esm)

typedef BitmapFingerprint = flight._js.BitmapFingerprint;

#elseif js

#error "flight.BitmapFingerprint on js requires flight_esm."

#else

#error "flight.BitmapFingerprint: no backend for this target."

#end
