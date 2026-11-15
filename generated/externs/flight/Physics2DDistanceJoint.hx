package flight;

#if hl

typedef Physics2DDistanceJoint = flight._hl.Physics2DDistanceJoint;

#elseif cpp

typedef Physics2DDistanceJoint = flight._cpp.Physics2DDistanceJoint;

#elseif (js && flight_esm)

typedef Physics2DDistanceJoint = flight._js.Physics2DDistanceJoint;

#elseif js

#error "flight.Physics2DDistanceJoint on js requires flight_esm."

#else

#error "flight.Physics2DDistanceJoint: no backend for this target."

#end
