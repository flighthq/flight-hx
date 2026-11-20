package flight;

#if hl

typedef IpcArguments = flight._hl.IpcArguments;

#elseif cpp

typedef IpcArguments = flight._cpp.IpcArguments;

#elseif (js && flight_esm)

typedef IpcArguments = flight._js.IpcArguments;

#elseif js

#error "flight.IpcArguments on js requires flight_esm."

#else

#error "flight.IpcArguments: no backend for this target."

#end
