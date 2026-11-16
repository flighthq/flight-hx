package flight;

#if hl

typedef ExternalAudioResourceReference = flight._hl.ExternalAudioResourceReference;

#elseif cpp

typedef ExternalAudioResourceReference = flight._cpp.ExternalAudioResourceReference;

#elseif (js && flight_esm)

typedef ExternalAudioResourceReference = flight._js.ExternalAudioResourceReference;

#elseif js

#error "flight.ExternalAudioResourceReference on js requires flight_esm."

#else

#error "flight.ExternalAudioResourceReference: no backend for this target."

#end
