package flight;

#if hl

typedef IridescencePbrExtension = flight._hl.IridescencePbrExtension;

#elseif cpp

typedef IridescencePbrExtension = flight._cpp.IridescencePbrExtension;

#elseif (js && flight_esm)

typedef IridescencePbrExtension = flight._js.IridescencePbrExtension;

#elseif js

#error "flight.IridescencePbrExtension on js requires flight_esm."

#else

#error "flight.IridescencePbrExtension: no backend for this target."

#end
