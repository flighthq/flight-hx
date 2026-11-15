package flight;

#if hl

typedef Physics2DDebugGeometry = flight._hl.Physics2DDebugGeometry;

#elseif cpp

typedef Physics2DDebugGeometry = flight._cpp.Physics2DDebugGeometry;

#elseif (js && flight_esm)

typedef Physics2DDebugGeometry = flight._js.Physics2DDebugGeometry;

#elseif js

#error "flight.Physics2DDebugGeometry on js requires flight_esm."

#else

#error "flight.Physics2DDebugGeometry: no backend for this target."

#end
