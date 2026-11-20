package flight;

#if hl

typedef AudioMixerGuardStateRef = flight._hl.AudioMixerGuardStateRef;

#elseif cpp

typedef AudioMixerGuardStateRef = flight._cpp.AudioMixerGuardStateRef;

#elseif (js && flight_esm)

typedef AudioMixerGuardStateRef = flight._js.AudioMixerGuardStateRef;

#elseif js

#error "flight.AudioMixerGuardStateRef on js requires flight_esm."

#else

#error "flight.AudioMixerGuardStateRef: no backend for this target."

#end
