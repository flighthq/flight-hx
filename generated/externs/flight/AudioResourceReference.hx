package flight;

#if hl

typedef AudioResourceReference = flight._hl.AudioResourceReference;

#elseif cpp

typedef AudioResourceReference = flight._cpp.AudioResourceReference;

#elseif (js && flight_esm)

typedef AudioResourceReference = flight._js.AudioResourceReference;

#elseif js

#error "flight.AudioResourceReference on js requires flight_esm."

#else

#error "flight.AudioResourceReference: no backend for this target."

#end
