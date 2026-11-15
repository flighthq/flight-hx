package flight;

#if hl

typedef Physics3DAbiExecutionResult = flight._hl.Physics3DAbiExecutionResult;

#elseif cpp

typedef Physics3DAbiExecutionResult = flight._cpp.Physics3DAbiExecutionResult;

#elseif (js && flight_esm)

typedef Physics3DAbiExecutionResult = flight._js.Physics3DAbiExecutionResult;

#elseif js

#error "flight.Physics3DAbiExecutionResult on js requires flight_esm."

#else

#error "flight.Physics3DAbiExecutionResult: no backend for this target."

#end
