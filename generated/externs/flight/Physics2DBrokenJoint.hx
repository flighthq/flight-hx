package flight;

#if hl

typedef Physics2DBrokenJoint = flight._hl.Physics2DBrokenJoint;

#elseif cpp

typedef Physics2DBrokenJoint = flight._cpp.Physics2DBrokenJoint;

#elseif (js && flight_esm)

typedef Physics2DBrokenJoint = flight._js.Physics2DBrokenJoint;

#elseif js

#error "flight.Physics2DBrokenJoint on js requires flight_esm."

#else

#error "flight.Physics2DBrokenJoint: no backend for this target."

#end
