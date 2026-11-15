package flight;

#if hl

typedef Physics2DAbiExecutionResult = flight._hl.Physics2DAbiExecutionResult;

#elseif cpp

typedef Physics2DAbiExecutionResult = flight._cpp.Physics2DAbiExecutionResult;

#elseif (js && flight_esm)

typedef Physics2DAbiExecutionResult = flight._js.Physics2DAbiExecutionResult;

#elseif js

#error "flight.Physics2DAbiExecutionResult on js requires flight_esm."

#else

#error "flight.Physics2DAbiExecutionResult: no backend for this target."

#end
