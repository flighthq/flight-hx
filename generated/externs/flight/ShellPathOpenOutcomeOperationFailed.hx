package flight;

#if hl

typedef ShellPathOpenOutcomeOperationFailed = flight._hl.ShellPathOpenOutcomeOperationFailed;

#elseif cpp

typedef ShellPathOpenOutcomeOperationFailed = flight._cpp.ShellPathOpenOutcomeOperationFailed;

#elseif (js && flight_esm)

typedef ShellPathOpenOutcomeOperationFailed = flight._js.ShellPathOpenOutcomeOperationFailed;

#elseif js

#error "flight.ShellPathOpenOutcomeOperationFailed on js requires flight_esm."

#else

#error "flight.ShellPathOpenOutcomeOperationFailed: no backend for this target."

#end
