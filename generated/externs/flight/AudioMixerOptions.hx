package flight;

#if hl

typedef AudioMixerOptions = flight._hl.AudioMixerOptions;

#elseif cpp

typedef AudioMixerOptions = flight._cpp.AudioMixerOptions;

#elseif (js && flight_esm)

typedef AudioMixerOptions = flight._js.AudioMixerOptions;

#elseif js

#error "flight.AudioMixerOptions on js requires flight_esm."

#else

#error "flight.AudioMixerOptions: no backend for this target."

#end
