package flight;

#if hl

typedef Md5DropTally = flight._hl.Md5DropTally;

#elseif cpp

typedef Md5DropTally = flight._cpp.Md5DropTally;

#elseif (js && flight_esm)

typedef Md5DropTally = flight._js.Md5DropTally;

#elseif js

#error "flight.Md5DropTally on js requires flight_esm."

#else

#error "flight.Md5DropTally: no backend for this target."

#end
