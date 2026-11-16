package flight;

#if hl

typedef Physics3DRotationalCcdEnvelope = flight._hl.Physics3DRotationalCcdEnvelope;

#elseif cpp

typedef Physics3DRotationalCcdEnvelope = flight._cpp.Physics3DRotationalCcdEnvelope;

#elseif (js && flight_esm)

typedef Physics3DRotationalCcdEnvelope = flight._js.Physics3DRotationalCcdEnvelope;

#elseif js

#error "flight.Physics3DRotationalCcdEnvelope on js requires flight_esm."

#else

#error "flight.Physics3DRotationalCcdEnvelope: no backend for this target."

#end
