package flight;

#if hl

typedef ShellExternalUrlPolicy = flight._hl.ShellExternalUrlPolicy;

#elseif cpp

typedef ShellExternalUrlPolicy = flight._cpp.ShellExternalUrlPolicy;

#elseif (js && flight_esm)

typedef ShellExternalUrlPolicy = flight._js.ShellExternalUrlPolicy;

#elseif js

#error "flight.ShellExternalUrlPolicy on js requires flight_esm."

#else

#error "flight.ShellExternalUrlPolicy: no backend for this target."

#end
