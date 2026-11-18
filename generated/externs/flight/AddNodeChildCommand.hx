package flight;

#if hl

typedef AddNodeChildCommand = flight._hl.AddNodeChildCommand;

#elseif cpp

typedef AddNodeChildCommand = flight._cpp.AddNodeChildCommand;

#elseif (js && flight_esm)

typedef AddNodeChildCommand = flight._js.AddNodeChildCommand;

#elseif js

#error "flight.AddNodeChildCommand on js requires flight_esm."

#else

#error "flight.AddNodeChildCommand: no backend for this target."

#end
