package flight;

#if hl

typedef Physics3DContact = flight._hl.Physics3DContact;

#elseif cpp

typedef Physics3DContact = flight._cpp.Physics3DContact;

#elseif (js && flight_esm)

typedef Physics3DContact = flight._js.Physics3DContact;

#elseif js

#error "flight.Physics3DContact on js requires flight_esm."

#else

#error "flight.Physics3DContact: no backend for this target."

#end
