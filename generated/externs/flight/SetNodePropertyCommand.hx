package flight;

#if hl

typedef SetNodePropertyCommand = flight._hl.SetNodePropertyCommand;

#elseif cpp

typedef SetNodePropertyCommand = flight._cpp.SetNodePropertyCommand;

#elseif (js && flight_esm)

typedef SetNodePropertyCommand = flight._js.SetNodePropertyCommand;

#elseif js

#error "flight.SetNodePropertyCommand on js requires flight_esm."

#else

#error "flight.SetNodePropertyCommand: no backend for this target."

#end
