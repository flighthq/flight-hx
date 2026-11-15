package flight;

#if hl

typedef AudioDecoderRegistry = flight._hl.AudioDecoderRegistry;

#elseif cpp

typedef AudioDecoderRegistry = flight._cpp.AudioDecoderRegistry;

#elseif (js && flight_esm)

typedef AudioDecoderRegistry = flight._js.AudioDecoderRegistry;

#elseif js

#error "flight.AudioDecoderRegistry on js requires flight_esm."

#else

#error "flight.AudioDecoderRegistry: no backend for this target."

#end
