package flight;

#if hl

typedef ShellProcess = flight._hl.ShellProcess;

#elseif cpp

typedef ShellProcess = flight._cpp.ShellProcess;

#elseif (js && flight_esm)

typedef ShellProcess = flight._js.ShellProcess;

#elseif js

#error "flight.ShellProcess on js requires flight_esm."

#else

#error "flight.ShellProcess: no backend for this target."

#end
