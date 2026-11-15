package flight;

#if hl

typedef Physics2DContact = flight._hl.Physics2DContact;

#elseif cpp

typedef Physics2DContact = flight._cpp.Physics2DContact;

#elseif (js && flight_esm)

typedef Physics2DContact = flight._js.Physics2DContact;

#elseif js

#error "flight.Physics2DContact on js requires flight_esm."

#else

#error "flight.Physics2DContact: no backend for this target."

#end
