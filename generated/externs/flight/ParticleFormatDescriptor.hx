package flight;

#if hl

typedef ParticleFormatDescriptor = flight._hl.ParticleFormatDescriptor;

#elseif cpp

typedef ParticleFormatDescriptor = flight._cpp.ParticleFormatDescriptor;

#elseif (js && flight_esm)

typedef ParticleFormatDescriptor = flight._js.ParticleFormatDescriptor;

#elseif js

#error "flight.ParticleFormatDescriptor on js requires flight_esm."

#else

#error "flight.ParticleFormatDescriptor: no backend for this target."

#end
