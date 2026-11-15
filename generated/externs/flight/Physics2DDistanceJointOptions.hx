package flight;

#if hl

typedef Physics2DDistanceJointOptions = flight._hl.Physics2DDistanceJointOptions;

#elseif cpp

typedef Physics2DDistanceJointOptions = flight._cpp.Physics2DDistanceJointOptions;

#elseif (js && flight_esm)

typedef Physics2DDistanceJointOptions = flight._js.Physics2DDistanceJointOptions;

#elseif js

#error "flight.Physics2DDistanceJointOptions on js requires flight_esm."

#else

#error "flight.Physics2DDistanceJointOptions: no backend for this target."

#end
