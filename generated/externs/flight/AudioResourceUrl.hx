package flight;

#if hl

typedef AudioResourceUrl = flight._hl.AudioResourceUrl;

#elseif cpp

typedef AudioResourceUrl = flight._cpp.AudioResourceUrl;

#elseif (js && flight_esm)

typedef AudioResourceUrl = flight._js.AudioResourceUrl;

#elseif js

#error "flight.AudioResourceUrl on js requires flight_esm."

#else

#error "flight.AudioResourceUrl: no backend for this target."

#end
