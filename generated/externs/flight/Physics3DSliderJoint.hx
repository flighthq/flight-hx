package flight;

#if hl

typedef Physics3DSliderJoint = flight._hl.Physics3DSliderJoint;

#elseif cpp

typedef Physics3DSliderJoint = flight._cpp.Physics3DSliderJoint;

#elseif (js && flight_esm)

typedef Physics3DSliderJoint = flight._js.Physics3DSliderJoint;

#elseif js

#error "flight.Physics3DSliderJoint on js requires flight_esm."

#else

#error "flight.Physics3DSliderJoint: no backend for this target."

#end
