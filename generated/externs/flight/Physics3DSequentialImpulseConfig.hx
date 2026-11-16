package flight;

#if hl

typedef Physics3DSequentialImpulseConfig = flight._hl.Physics3DSequentialImpulseConfig;

#elseif cpp

typedef Physics3DSequentialImpulseConfig = flight._cpp.Physics3DSequentialImpulseConfig;

#elseif (js && flight_esm)

typedef Physics3DSequentialImpulseConfig = flight._js.Physics3DSequentialImpulseConfig;

#elseif js

#error "flight.Physics3DSequentialImpulseConfig on js requires flight_esm."

#else

#error "flight.Physics3DSequentialImpulseConfig: no backend for this target."

#end
