package flight;

#if hl

typedef AudioMixer = flight._hl.AudioMixer;

#elseif cpp

typedef AudioMixer = flight._cpp.AudioMixer;

#elseif (js && flight_esm)

typedef AudioMixer = flight._js.AudioMixer;

#elseif js

#error "flight.AudioMixer on js requires flight_esm."

#else

#error "flight.AudioMixer: no backend for this target."

#end
