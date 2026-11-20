package flight;

#if hl

typedef ShellProcessOptions = flight._hl.ShellProcessOptions;

#elseif cpp

typedef ShellProcessOptions = flight._cpp.ShellProcessOptions;

#elseif (js && flight_esm)

typedef ShellProcessOptions = flight._js.ShellProcessOptions;

#elseif js

#error "flight.ShellProcessOptions on js requires flight_esm."

#else

#error "flight.ShellProcessOptions: no backend for this target."

#end
