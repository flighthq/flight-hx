package flight;

#if hl

typedef Physics3DDistanceJoint = flight._hl.Physics3DDistanceJoint;

#elseif cpp

typedef Physics3DDistanceJoint = flight._cpp.Physics3DDistanceJoint;

#elseif (js && flight_esm)

typedef Physics3DDistanceJoint = flight._js.Physics3DDistanceJoint;

#elseif js

#error "flight.Physics3DDistanceJoint on js requires flight_esm."

#else

#error "flight.Physics3DDistanceJoint: no backend for this target."

#end
