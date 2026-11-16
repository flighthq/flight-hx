package flight;

#if hl

typedef AudioResourceFailure = flight._hl.AudioResourceFailure;

#elseif cpp

typedef AudioResourceFailure = flight._cpp.AudioResourceFailure;

#elseif (js && flight_esm)

typedef AudioResourceFailure = flight._js.AudioResourceFailure;

#elseif js

#error "flight.AudioResourceFailure on js requires flight_esm."

#else

#error "flight.AudioResourceFailure: no backend for this target."

#end
