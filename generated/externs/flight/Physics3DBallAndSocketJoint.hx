package flight;

#if hl

typedef Physics3DBallAndSocketJoint = flight._hl.Physics3DBallAndSocketJoint;

#elseif cpp

typedef Physics3DBallAndSocketJoint = flight._cpp.Physics3DBallAndSocketJoint;

#elseif (js && flight_esm)

typedef Physics3DBallAndSocketJoint = flight._js.Physics3DBallAndSocketJoint;

#elseif js

#error "flight.Physics3DBallAndSocketJoint on js requires flight_esm."

#else

#error "flight.Physics3DBallAndSocketJoint: no backend for this target."

#end
